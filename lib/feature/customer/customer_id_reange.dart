import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_id_reange.freezed.dart';

@freezed
class CustomerIdReange with _$CustomerIdReange {
  const factory CustomerIdReange({
    required int pageKey,
    required int pageSize,
  }) = _CustomerIdReange;

  factory CustomerIdReange.empty() => const CustomerIdReange(pageKey: 0, pageSize: 10);
}