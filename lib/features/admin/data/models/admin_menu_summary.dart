import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_menu_summary.freezed.dart';
part 'admin_menu_summary.g.dart';

@freezed
class AdminMenuSummary with _$AdminMenuSummary {
  const factory AdminMenuSummary({
    required String menuId,
    required String date,
    required String title,
  }) = _AdminMenuSummary;

  factory AdminMenuSummary.fromJson(Map<String, dynamic> json) => 
      _$AdminMenuSummaryFromJson(json);
}