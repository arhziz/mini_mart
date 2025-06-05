// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class NavItem {
  const NavItem({
    required this.page,
    required this.navKey,
  });
  final Widget page;
  final GlobalKey<NavigatorState> navKey;
}
