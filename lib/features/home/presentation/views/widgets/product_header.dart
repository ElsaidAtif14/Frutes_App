
import 'package:flutter/material.dart';
import 'package:frutes_app/core/entites/product_entity.dart';
import 'package:frutes_app/core/widgets/custom_network_image.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final headerColor = isDarkMode ? const Color(0xFF2A2A2A) : const Color(0xFFF7F7F7);
    final backButtonBgColor = isDarkMode ? const Color(0xFF3A3A3A) : Colors.white;
    final backButtonIconColor = isDarkMode ? Colors.grey[300] : Colors.black;

    return Stack(
      children: [
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            height: 350,
            color: headerColor,
          ),
        ),
        Positioned(
          top: 50,
          right: 20,
          child: CircleAvatar(
            backgroundColor: backButtonBgColor,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, 
                color: backButtonIconColor, 
                size: 18
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: SizedBox(
              height: 200,
              child: CustomNetworkImage(imageUrl: product.imageUrl!))
          ),
        ),
      ],
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}