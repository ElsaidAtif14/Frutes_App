import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/core/helper/product.details.args.dart';
import 'package:frutes_app/features/auth/presentation/views/signin_view.dart';
import 'package:frutes_app/features/auth/presentation/views/signup_view.dart';
import 'package:frutes_app/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:frutes_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:frutes_app/features/home/doamin/entites/cart_entity/cart_entity.dart';
import 'package:frutes_app/features/home/presentation/views/main_view.dart';
import 'package:frutes_app/features/home/presentation/views/product_details_view.dart';
import 'package:frutes_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:frutes_app/features/profile/presentation/views/favorite_view.dart';
import 'package:frutes_app/features/profile/presentation/views/who_are_we_view.dart';
import 'package:frutes_app/features/splach/presentation/views/splach_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // Define your routes here
    case SplachView.routeName:
      return MaterialPageRoute(builder: (context) => const SplachView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    case WhoAreWeView.routeName:
      return MaterialPageRoute(builder: (context) => const WhoAreWeView());
    case FavoriteView.routeName:
      return MaterialPageRoute(
        builder: (context) => const FavoriteView(),
      );
    case ProductDetailsView.routeName:
      final args = settings.arguments as ProductDetailsArgs; // بنفك الغلاف
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: args.cubit,
          child: ProductDetailsView(args: args),
        ),
      );
    case CheckoutView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            CheckoutView(cartEntity: settings.arguments as CartEntity),
      );
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
