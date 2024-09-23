import 'package:blanc_f/feature/customer/customer_id_reange.dart';
import 'package:blanc_f/global/http_service.dart';
import 'package:blanc_f/global/network/dto/customer_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_list_view_model.freezed.dart';

@freezed
class CustomerListViewModelState with _$CustomerListViewModelState {
  factory CustomerListViewModelState({
    required List<CustomerData> list,
    required bool isLoading,
    required bool isEndOfList,
    required bool isClinicId,
  }) = _CustomerListViewModelState;
}

class CustomerListViewModel extends StateNotifier<CustomerListViewModelState> {
  CustomerListViewModel({
    required this.httpServer,
  }) : super(
          CustomerListViewModelState(
            list: [],
            isLoading: false,
            isEndOfList: false,
            isClinicId: false,
          ),
        ) {
    _init();
  }

  final HttpService httpServer;

  late int clinicId;

  var customerIdRange = CustomerIdReange.empty();

  Future<void> _init() async {
    final response = await httpServer.fetchClinicData();
    final clinicData = response.clinicOwner?.clinicData;



    if(clinicData != null) {
      clinicId = clinicData.id;
      state = state.copyWith(isClinicId: true);
    }
  }

Future<void> loadMore() async {
  if (state.isLoading || state.isEndOfList) {
    return;
  }

  state = state.copyWith(isLoading: true);

  final offset = state.list.isEmpty ? customerIdRange.start - 1 :  state.list.last.id; // 0

  final loadedList = await httpServer.fetchCustomerList(clinicId: clinicId, offset: offset);

  customerIdRange = customerIdRange.copyWith(end: loadedList.meta.pagination.total);

  state = state.copyWith(
    list: [...state.list, ...loadedList.data],
    isLoading: false,
    isEndOfList: loadedList.data.last.id == customerIdRange.end,
  );
}
}

final customerListViewModelProvider = StateNotifierProvider.autoDispose<CustomerListViewModel, CustomerListViewModelState>((ref) {
  final httpService = ref.watch(httpServiceProvider);
  return CustomerListViewModel(httpServer: httpService);
});

final httpServiceProvider = Provider.autoDispose<HttpService>((ref) {
  return HttpService();
});
