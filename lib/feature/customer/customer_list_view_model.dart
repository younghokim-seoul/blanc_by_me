import 'package:blanc_f/feature/customer/customer_id_reange.dart';
import 'package:blanc_f/global/http_service.dart';
import 'package:blanc_f/global/network/dto/customer_dto.dart';
import 'package:blanc_f/util/commonutil.dart';
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

  String query = '';

  Future<void> _init() async {
    final response = await httpServer.fetchClinicData();
    final clinicData = response.clinicOwner?.clinicData;

    if (clinicData != null) {
      clinicId = clinicData.id;
      state = state.copyWith(isClinicId: true);
      loadMore();
    }
  }

  setQuery(String query) {
    print("setQuery: $query");
    this.query = query;
    customerIdRange = CustomerIdReange.empty();
    state = state.copyWith(
      list: [],
      isLoading: false,
      isEndOfList: false,
    );
  }

  Future<bool> saveCustomer(String name, DateTime birthDay) async {
    final response = await httpServer.saveCustomer(clinicId: clinicId, name: name, birthDay: birthDay.toYyyyMmDd());
    return response;
  }

  Future<void> loadMore() async {
    if (state.isLoading || state.isEndOfList) {
      return;
    }

    state = state.copyWith(isLoading: true);
    
    final offset = state.list.isEmpty ? customerIdRange.pageKey : state.list.length; // 0

    final loadedList = await httpServer.fetchCustomerList(clinicId: clinicId, query: query, offset: offset);

    final isEndOfList = loadedList.data.isEmpty || loadedList.data.length < customerIdRange.pageSize;

    state = state.copyWith(
      list: [...state.list, ...loadedList.data],
      isLoading: false,
      isEndOfList: isEndOfList,
    );
  }
}

final customerListViewModelProvider =
    StateNotifierProvider.autoDispose<CustomerListViewModel, CustomerListViewModelState>((ref) {
  final httpService = ref.watch(httpServiceProvider);
  return CustomerListViewModel(httpServer: httpService);
});

final httpServiceProvider = Provider.autoDispose<HttpService>((ref) {
  return HttpService();
});
