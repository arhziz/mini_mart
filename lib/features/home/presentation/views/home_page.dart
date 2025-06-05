import 'package:flutter/material.dart';
import 'package:mini_mart/features/cart/cart.dart';
import 'package:mini_mart/features/home/presentation/views/views.dart';
import 'package:mini_mart/features/home/presentation/widgets/widgets.dart';

import 'package:mini_mart/shared/theme/app_colors.dart';

/// HomePage widget
/// This widget is the home page of the application.
/// It displays the user's email and name.
/// It also has a logout button in the app bar.
class HomePage extends StatefulWidget {
  /// Creates an instance of [HomePage].
  const HomePage({
    super.key,
    this.activePage = 0,
  });

  ///
  final int activePage;

  ///
  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final favoriteNavKey = GlobalKey<NavigatorState>();
  final cartNavKey = GlobalKey<NavigatorState>();
  final userNavKey = GlobalKey<NavigatorState>();

  List<NavItem> items = [];
  int currentPage = 0;

  @override
  void initState() {
    currentPage = widget.activePage;
    items = [
      NavItem(
        page: const HomeView(),
        navKey: homeNavKey,
      ),
      NavItem(
        page: const CartView(),
        navKey: cartNavKey,
      ),
      NavItem(
        page: const FavoriteView(),
        navKey: favoriteNavKey,
      ),
      NavItem(
        page: const UserProfileView(),
        navKey: userNavKey,
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        if (items[currentPage].navKey.currentState?.canPop() ?? false) {
          items[currentPage].navKey.currentState?.pop();
          //return Future.value(false);
        } else {
          //return Future.value(true);
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          bottomNavigationBar: NavBar(
            pageIndex: currentPage,
            onTap: (index) {
              if (index == currentPage) {
                items[index]
                    .navKey
                    .currentState
                    ?.popUntil((route) => route.isFirst);
              } else {
                setState(() {
                  currentPage = index;
                });
              }
            },
          ),
          body: Container(
            decoration: const BoxDecoration(color: AppColors.scaffoldBgColor),
            child: IndexedStack(
              index: currentPage,
              children: items
                  .map(
                    (page) => page.page,
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
