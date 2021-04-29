import 'package:covid_resources/screens/add_info/add_info_screen.dart';
import 'package:covid_resources/screens/disclaimer/disclaimer_screen.dart';
import 'package:covid_resources/screens/home/home_screen.dart';
import 'package:covid_resources/screens/support/support_screen.dart';
import 'package:covid_resources/utils/colors.dart';
import 'package:covid_resources/utils/screen_animation_utils.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

int navSelectedIndex = 0;

BottomNavigationBar getBottomNav(BuildContext context) {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: 'Resources',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_add_alt_1_rounded),
        label: 'Add Info',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.support_rounded),
        label: 'Support Us',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.report_gmailerrorred_rounded),
        label: 'Disclaimer',
      ),
    ],
    currentIndex: navSelectedIndex,
    backgroundColor: Colors.white,
    selectedItemColor: secondaryColor,
    unselectedItemColor: primaryColor,
    type: BottomNavigationBarType.fixed,
    onTap: (index) {
      onBottomNavClicked(context, index);
    },
  );
}

onBottomNavClicked(BuildContext context, int index) {
  navSelectedIndex = index;
  switch (navSelectedIndex) {
    case 0:
      Navigator.of(context).push(fadeScreenTransition(HomeScreen()));
      break;
    case 1:
      Navigator.of(context).push(fadeScreenTransition(AddInfoScreen()));
      break;
    case 2:
      Navigator.of(context).push(fadeScreenTransition(SupportScreen()));
      break;
    case 3:
      Navigator.of(context).push(fadeScreenTransition(DisclaimerScreen()));
      break;
  }
}

String getTimeAgo(String serverDate) {
  return timeago.format(DateTime.parse(serverDate));
}

void callPhone(String phone) async {
  if (await canLaunch("tel:$phone")) await launch("tel:$phone");
}
