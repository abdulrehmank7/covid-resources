import 'package:covid_resources/screens/add_info/add_info_screen.dart';
import 'package:covid_resources/screens/home/home_screen.dart';
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
    ],
    currentIndex: navSelectedIndex,
    selectedItemColor: Colors.amber[800],
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
  }
}

String getTimeAgo(String serverDate) {
  return timeago.format(DateTime.parse(serverDate));
}

void callPhone(String phone) async {
  if (await canLaunch("tel:$phone")) await launch("tel:$phone");
}
