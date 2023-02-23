import 'package:flutter/material.dart';

class AdminMenuItem {
  const AdminMenuItem({
    required this.title,
    this.onTap,
    this.icon,
    this.children = const [],
  });

  final String title;
  final VoidCallback? onTap;
  final IconData? icon;
  final List<AdminMenuItem> children;
}
