import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app_prefs.dart';
import 'app/my_app.dart';
import 'firebase_options.dart';
import 'presentation/resourses/language_manager.dart';
import 'presentation/01_auth_screens/bloc/auth_bloc.dart';
import 'presentation/02_home/blocs/theme_bloc/theme_bloc.dart';
import 'presentation/04_profile_management/blocs/profile_bloc.dart';
import 'simple_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppPreferencesImpl.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = SimpleObserver();
  final initialUserData = await AppPreferencesImpl.loadUserData();
  final initialAvatar = await AppPreferencesImpl.loadUserAvatar();
  runApp(
    EasyLocalization(
        supportedLocales: [
          LocalizationUtils.englishLocal,
          LocalizationUtils.arabicLocal
        ],
        path: 'assets/lang',
        fallbackLocale: LocalizationUtils.englishLocal,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (_) => AuthBloc(appPreferences: AppPreferencesImpl())),
            BlocProvider(
                create: (_) => ProfileBloc(
                    initialUserData: initialUserData,
                    initialAvatar: initialAvatar)),
            BlocProvider(
              create: (_) => ThemeBloc(AppPreferencesImpl())..add(LoadTheme()),
            )
          ],
          child: MyApp(),
        )),
  );
}
