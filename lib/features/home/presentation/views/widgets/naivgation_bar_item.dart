import 'package:flutter/material.dart';
import 'package:frutes_app/features/home/doamin/entites/bottom_navigation_bar_entity.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/active_item.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/in_active_item.dart';

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem({
    super.key,
    required this.entity,
    required this.isActive,
  });
  final BottomNavigationBarEntity entity;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItem(text: entity.name, image: entity.activeImage)
        : InActiveItem(image: entity.inActiveImage);
  }
}
