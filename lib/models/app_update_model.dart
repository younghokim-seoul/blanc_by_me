import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_update_model.freezed.dart';
part 'app_update_model.g.dart';

@freezed
class AppUpdateModel with _$AppUpdateModel {
  factory AppUpdateModel({
    required String ios,
    required String aos,
    required bool shoudAppUpdate,
  }) = _AppUpdateModel;

  factory AppUpdateModel.fromJson(Map<String,dynamic> json) => _$AppUpdateModelFromJson(json);
}
