import 'package:flutter/material.dart';

class MenuDrawerItem {
  final String title;
  final IconData icon;
  final String link;

  const MenuDrawerItem({
    required this.title,
    required this.icon,
    required this.link
  });

}

const appMenuItems = <MenuDrawerItem> [

  MenuDrawerItem(
    title: 'Inicio',
    icon: Icons.home,
    link: 'home'
  ),
  MenuDrawerItem(
    title: 'Lista tareas',
    icon: Icons.task,
    link: 'home'
  ),
  MenuDrawerItem(
    title: 'Trabajadores',
    icon: Icons.work,
    link: 'home'
  ),

];