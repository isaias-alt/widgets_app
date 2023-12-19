import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      title: 'Buttons',
      subTitle: 'Several buttons',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItems(
      title: 'Cards',
      subTitle: 'A stylized container',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItems(
      title: 'Progress Indicators',
      subTitle: 'General y controlled',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItems(
      title: 'Snackbars y Dialogues',
      subTitle: 'On screen indicator',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItems(
      title: 'Animated Container',
      subTitle: 'Stateful widget animated',
      link: '/animated',
      icon: Icons.check_box_outline_blank_outlined),
  MenuItems(
      title: 'UI controls and Tiles',
      subTitle: 'A series of Flutter controls',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItems(
      title: 'App Tutorial',
      subTitle: 'A little tutorial',
      link: '/tutorial',
      icon: Icons.accessible_rounded),
  MenuItems(
      title: 'InfiniteScroll and Pull',
      subTitle: 'Inifinite lists and pull to refresh',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
];
