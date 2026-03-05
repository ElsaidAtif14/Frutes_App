import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frutes_app/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:frutes_app/core/helper/on_generete_routes.dart';
import 'package:frutes_app/core/services/custom_bloc_observer.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/services/shared_preferences_singleton.dart';
import 'package:frutes_app/core/utils/app_theme.dart';
import 'package:frutes_app/features/home/presentation/cubits/favorite/favorite_cubit.dart';
import 'package:frutes_app/features/splach/presentation/views/splach_view.dart';
import 'package:frutes_app/firebase_options.dart';
import 'package:frutes_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupGetIt();
  Bloc.observer = CustomBlocObserver();
  await Prefs.init();
  await FacebookAuth.instance.webAndDesktopInitialize(
    appId: '907223328369683',
    cookie: true,
    xfbml: true,
    version: 'v20.0',
  );
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider<FavoriteCubit>(create: (context) => FavoriteCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale('ar'),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: onGenerateRoutes,
            initialRoute: SplachView.routeName,
          );
        },
      ),
    );
  }
}
