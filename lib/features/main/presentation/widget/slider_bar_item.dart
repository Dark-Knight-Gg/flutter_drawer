import 'package:facexpress/features/main/presentation/widget/admin_menu_item.dart';
import 'package:flutter/material.dart';


class SideBarItem extends StatelessWidget {
  const SideBarItem({super.key,
    required this.items,
    required this.index,
    this.onSelected,
    this.depth = 0,
    this.iconColor,
    this.activeIconColor,
    required this.textStyle,
    required this.activeTextStyle,
    required this.backgroundColor,
    required this.activeBackgroundColor,
    required this.borderColor,
  });

  final List<AdminMenuItem> items;
  final int index;
  final void Function(AdminMenuItem item)? onSelected;
  final int depth;
  final Color? iconColor;
  final Color? activeIconColor;
  final TextStyle textStyle;
  final TextStyle activeTextStyle;
  final Color backgroundColor;
  final Color activeBackgroundColor;
  final Color borderColor;
  bool get isLast => index == items.length - 1;

  @override
  Widget build(BuildContext context) {
    if (depth > 0 && isLast) {
      return _buildTiles(context, items[index]);
    }
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: _buildTiles(context, items[index]),
    );
  }

  Widget _buildTiles(BuildContext context, AdminMenuItem item) {
    bool selected = _isSelected([item]);

    if (item.children.isEmpty) {
      return ListTile(
        contentPadding: _getTilePadding(depth),
        leading: _buildIcon(item.icon, selected),
        title: _buildTitle(item.title, selected),
        selected: selected,
        tileColor: backgroundColor,
        selectedTileColor: activeBackgroundColor,
        onTap: () {
          if (onSelected != null) {
            onSelected!(item);
          }
        },
      );
    }

    int index = 0;
    final childrenTiles = item.children.map((child) {
      return SideBarItem(
        items: item.children,
        index: index++,
        onSelected: onSelected,
        depth: depth +1,
        iconColor: iconColor,
        activeIconColor: activeIconColor,
        textStyle: textStyle,
        activeTextStyle: activeTextStyle,
        backgroundColor: backgroundColor,
        activeBackgroundColor: activeBackgroundColor,
        borderColor: borderColor,
      );
    }).toList();

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: _getTilePadding(depth),
        leading: _buildIcon(item.icon),
        title: _buildTitle(item.title),
        initiallyExpanded: selected,
        backgroundColor: const Color(0xff56CCF2),
        textColor: Colors.white,
        iconColor: Colors.white,
        children: childrenTiles,
      ),
    );
  }

  bool _isSelected(List<AdminMenuItem> items) {
    for (final item in items) {

      if (item.children.isNotEmpty) {
        return _isSelected(item.children);
      }
    }
    return false;
  }

  Widget _buildIcon(IconData? icon, [bool selected = false]) {
    return icon != null
        ? Icon(
      icon,
      size: 30,
      color: selected
          ? activeIconColor != null
          ? activeIconColor
          : activeTextStyle.color
          : iconColor != null
          ? iconColor
          : textStyle.color,
    )
        : SizedBox();
  }

  Widget _buildTitle(String title, [bool selected = false]) {
    return Text(
      title,
      style: selected ? activeTextStyle: textStyle

    );
  }

  EdgeInsets _getTilePadding(int depth) {
    return EdgeInsets.only(
      left: 10.0 + 10.0 * depth,
      right: 10.0,
    );
  }
}
