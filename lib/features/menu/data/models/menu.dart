import 'package:freezed_annotation/freezed_annotation.dart';
import 'menu_item.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  const factory Menu({
    required String menuId,
    required String title,
    required DateTime date,
    required List<MenuItem> items,
    required bool isActive,
    String? description,
    DateTime? lastModified,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  // Add a static empty constructor within the class definition
  static Menu empty() => Menu(
    menuId: '',
    title: '',
    date: DateTime.now(),
    items: const [],
    isActive: false,
  );
}