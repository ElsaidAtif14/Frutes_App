import 'package:flutter/material.dart';

import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:frutes_app/core/utils/app_images.dart';
import 'package:frutes_app/core/utils/app_text_styles.dart';
import 'package:frutes_app/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:gap/gap.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.sizeOf(context).width - 32;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                top: 0,
                right: itemWidth * 0.4,
                child: Image.asset(
                  Assets.assetsImagesWatermelonTest,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: itemWidth * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(Assets.assetsImagesFeaturedItemBackground),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 33),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(25),
                      Text(
                        'عروض العيد',
                        style: TextStyles.regular13.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'خصم 25%',
                        style: TextStyles.bold19.copyWith(color: Colors.white),
                      ),
                      Gap(11),
                      FeaturedItemButton(onPressed: () {}),
                      Gap(29),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
