import 'package:atraksion_nazorati/src/core/router/app_routes.dart';
import 'package:atraksion_nazorati/src/core/router/route_transitions.dart';
import 'package:atraksion_nazorati/src/features/auth/presentation/pages/language_page.dart';
import 'package:atraksion_nazorati/src/features/auth/presentation/pages/one_id_page.dart';
import 'package:atraksion_nazorati/src/features/auth/presentation/pages/slider_page.dart';
import 'package:atraksion_nazorati/src/features/auth/presentation/pages/splash_page.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/pages/about_ombudsman_page.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/pages/biography_page.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/pages/central_membership_page.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/pages/faq_page.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/pages/functions_page.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/pages/info_page.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/pages/leadership_page.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/pages/news_page.dart';
import 'package:atraksion_nazorati/src/features/home/presentation/pages/regional_membership_page.dart';
import 'package:atraksion_nazorati/src/features/main/main_page.dart';
import 'package:atraksion_nazorati/src/features/main/tabs/notification/notification_page.dart';
import 'package:atraksion_nazorati/src/features/profile/presentation/pages/about_app_page.dart';
import 'package:atraksion_nazorati/src/features/reference/presentation/pages/create_appeal_page.dart';
import 'package:atraksion_nazorati/src/features/reference/presentation/pages/info_appeal_page.dart';
import 'package:atraksion_nazorati/src/features/reference/presentation/pages/requirements_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');

final appRouter = GoRouter(
  navigatorKey: rootNavigator,
  initialLocation: AppRoutes.splash.path,
  routes: [
    GoRoute(
      name: AppRoutes.splash.name,
      path: AppRoutes.splash.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const SplashPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.language.name,
      path: AppRoutes.language.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const LanguagePage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.oneId.name,
      path: AppRoutes.oneId.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const OneIdPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.slider.name,
      path: AppRoutes.slider.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          SliderPage(args: int.parse(state.pathParameters['args']!))
              .defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.main.name,
      path: AppRoutes.main.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const MainPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.faq.name,
      path: AppRoutes.faq.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const FAQPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.news.name,
      path: AppRoutes.news.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const NewsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.createAppeal.name,
      path: AppRoutes.createAppeal.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const CreateAppealPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.requirements.name,
      path: AppRoutes.requirements.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const RequirementsPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.info.name,
      path: AppRoutes.info.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const InfoPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.notification.name,
      path: AppRoutes.notification.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const NotificationPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.aboutOmbudsman.name,
      path: AppRoutes.aboutOmbudsman.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const AboutOmbudsmanPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.aboutApp.name,
      path: AppRoutes.aboutApp.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const AboutAppPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.leadership.name,
      path: AppRoutes.leadership.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const LeadershipPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.centralMembership.name,
      path: AppRoutes.centralMembership.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const CentralMembershipPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.regionalMembership.name,
      path: AppRoutes.regionalMembership.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          const RegionalMembershipPage().defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.biography.name,
      path: AppRoutes.biography.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          BiographyPage(text: state.pathParameters['text'] ?? '')
              .defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.functions.name,
      path: AppRoutes.functions.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) =>
          FunctionsPage(text: state.pathParameters['text'] ?? '')
              .defaultPage(state: state),
    ),
    GoRoute(
      name: AppRoutes.infoAppeal.name,
      path: AppRoutes.infoAppeal.path,
      parentNavigatorKey: rootNavigator,
      pageBuilder: (context, state) => InfoAppealPage(
        arg: int.parse(state.pathParameters['arg']!),
      ).defaultPage(state: state),
    ),
  ],
);
