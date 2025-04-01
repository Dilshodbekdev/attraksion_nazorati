import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:atraksion_nazorati/generated/l10n.dart';
import 'package:atraksion_nazorati/src/config/theme/app_colors.dart';
import 'package:atraksion_nazorati/src/features/main/tabs/home/home_page.dart';
import 'package:atraksion_nazorati/src/features/main/tabs/profile/profile_page.dart';
import 'package:atraksion_nazorati/src/features/main/tabs/references/references_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const ReferencesPage(),
    //const NotificationPage(),
    const ProfilePage()
  ];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          iconSize: 24,
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.secondaryTextColor,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/ic_home_ac.svg',
                color: AppColors.mainColor,
              ),
              icon: SvgPicture.asset(
                'assets/icons/ic_home.svg',
                color: AppColors.secondaryTextColor,
              ),
              label: S.of(context).main,
            ),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_reference_ac.svg',
                  color: AppColors.mainColor,
                ),
                icon: SvgPicture.asset('assets/icons/ic_reference.svg'),
                label: S.of(context).appeal),
            /*BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_notification_ac.svg',
                  color: AppColors.mainColor,
                ),
                icon: SvgPicture.asset('assets/icons/ic_notification.svg'),
                label: S.of(context).chats),*/
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/icons/ic_profile_ac.svg',
                  color: AppColors.mainColor,
                ),
                icon: SvgPicture.asset('assets/icons/ic_profile.svg'),
                label: S.of(context).profile),
          ]),
    );
  }
}
