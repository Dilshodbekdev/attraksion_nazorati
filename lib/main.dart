import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/core/app_state/cubit/app_cubit.dart';
import 'package:atraksion_nazorati/src/core/locator.dart';
import 'package:atraksion_nazorati/src/core/router/route_config.dart';
import 'package:atraksion_nazorati/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/manager/home_bloc.dart';
import 'package:atraksion_nazorati/src/features/reference/presentation/manager/appeal_bloc.dart';
import 'package:toastification/toastification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => locator<AppCubit>()..init()),
          BlocProvider(create: (context) => locator<AuthBloc>()),
          BlocProvider(create: (context) => locator<HomeBloc>()),
          BlocProvider(create: (context) => locator<AppealBloc>()),
        ],
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return ToastificationWrapper(
              child: MaterialApp.router(
                locale: state.locale,
                supportedLocales: S.delegate.supportedLocales,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                title: 'Atraksion nazorati',
                theme: state.theme,
                routeInformationParser: appRouter.routeInformationParser,
                routeInformationProvider: appRouter.routeInformationProvider,
                routerDelegate: appRouter.routerDelegate,
              ),
            );
          },
        ));
  }
}
