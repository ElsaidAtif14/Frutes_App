import '../../../../core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesVuesaxBoldHome,
    inActiveImage: Assets.assetsImagesVuesaxOutlineHome,
    name: 'الرئيسية',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesVuesaxBoldProducts,
    inActiveImage: Assets.assetsImagesVuesaxOutlineProducts,
    name: 'المنتجات',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesVuesaxBoldShoppingCart,
    inActiveImage: Assets.assetsImagesVuesaxOutlineShoppingCart,
    name: 'سلة التسوق',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.assetsImagesVuesaxBoldUser,
    inActiveImage: Assets.assetsImagesVuesaxOutlineUser,
    name: 'حسابي',
  ),
];
