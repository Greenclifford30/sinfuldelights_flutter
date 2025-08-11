import 'package:freezed_annotation/freezed_annotation.dart';
import 'menu_item.dart';

part 'predefined_menu.freezed.dart';
part 'predefined_menu.g.dart';

@freezed
class PredefinedMenu with _$PredefinedMenu {
  const factory PredefinedMenu({
    required String templateId,
    required String name,
    required List<MenuItem> items,
    required DateTime createdAt,
    String? description,
    @Default(false) bool isActive,
  }) = _PredefinedMenu;

  factory PredefinedMenu.fromJson(Map<String, dynamic> json) => _$PredefinedMenuFromJson(json);

  // Add a static empty constructor within the class definition
  static PredefinedMenu empty() => PredefinedMenu(
    templateId: '',
    name: '',
    items: const [],
    createdAt: DateTime.now(),
  );
}