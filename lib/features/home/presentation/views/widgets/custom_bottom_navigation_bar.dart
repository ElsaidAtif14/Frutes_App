import 'package:flutter/material.dart';
import 'package:frutes_app/features/home/doamin/entites/bottom_navigation_bar_entity.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/naivgation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});

  final Function(int) onItemTapped;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final navBarColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final shadowColor = isDarkMode ? Colors.black54 : const Color(0x19000000);

    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: navBarColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 25,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarItems.asMap().entries.map((e) {
          final index = e.key;
          final entity = e.value;

          return Expanded(
            flex: index == selectedIndex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onItemTapped(index);
              },
              child: NaivgationBarItem(
                entity: entity,
                isActive: selectedIndex == index,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
