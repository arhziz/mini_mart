import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_mart/core/constants/app_assets.dart';
import 'package:mini_mart/core/utils/build_context_extension.dart';
import 'package:mini_mart/features/cart/cart.dart';
import 'package:mini_mart/shared/shared.dart';
import 'package:mini_mart/shared/theme/app_colors.dart';

///
class NavBar extends StatelessWidget {
  ///
  const NavBar({
    required this.onTap,
    required this.pageIndex,
    super.key,
  });

  ///
  final int pageIndex;

  ///
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
            top: 10.sp,
          ),
          height: 100.sp,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(
                  0,
                  -1,
                ),
                blurRadius: 100,
                spreadRadius: 5,
              ),
            ],
            border: Border(top: BorderSide(color: Colors.black.withAlpha(30))),
            color: AppColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              navItem(
                label: 'Home',
                icon: AppAssets.homeIcon,
                selected: pageIndex == 0,
                onTap: () => onTap(0),
                state: state,
              ),
              navItem(
                label: 'Cart',
                icon: AppAssets.shoppingCartIcon,
                selected: pageIndex == 1,
                onTap: () => context.navigator.push(CartView.route()),
                state: state,
                isCart: true,
              ),
              navItem(
                label: 'Favorites',
                icon: AppAssets.favoriteIcon,
                selected: pageIndex == 2,
                onTap: () => onTap(2),
                state: state,
              ),
              navItem(
                label: 'Profile',
                icon: AppAssets.userIcon,
                selected: pageIndex == 3,
                onTap: () => onTap(3),
                state: state,
              ),
            ],
          ),
        );
      },
    );
  }

  ///
  Widget navItem({
    required String label,
    required String icon,
    required CartState state,
    bool selected = false,
    void Function()? onTap,
    bool isCart = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 40,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: selected ? AppColors.primaryColor : null,
            ),
            child: Stack(
              children: [
                Center(
                  child: SvgPicture.asset(
                    icon,
                    width: 40,
                    colorFilter: ColorFilter.mode(
                      selected ? AppColors.white : AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                if (isCart && state.items.isNotEmpty)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 25.sp,
                      width: 25.sp,
                      decoration: BoxDecoration(
                        color: AppColors.cartBadgeColor,
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Center(
                        child: Text(
                          state.items.length < 9
                              ? '${state.items.length}'
                              : '9+',
                          style: AppTextStyles.w600(
                            color: AppColors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: AppTextStyles.w600(
              color: selected ? AppColors.primaryColor : AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
