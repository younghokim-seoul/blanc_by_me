import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_id_reange.freezed.dart';

@freezed
class CustomerIdReange with _$CustomerIdReange {
  const factory CustomerIdReange({
    required int start,
    required int end,
  }) = _CustomerIdReange;

  factory CustomerIdReange.empty() => const CustomerIdReange(start: -1, end: -1);
}