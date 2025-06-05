import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_mart/core/constants/app_assets.dart';
import 'package:mini_mart/core/utils/build_context_extension.dart';
import 'package:mini_mart/shared/theme/app_colors.dart';
import 'package:mini_mart/shared/theme/app_text_styles.dart';
import 'package:mini_mart/shared/theme/theme.dart';

/// A widget that represents the application bar in the app.
class AppBarWidget extends StatelessWidget {
  /// Creates an instance of [AppBarWidget].
  const AppBarWidget({
    super.key,
    this.isHome = true,
    this.title = 'Technology',
  });

  /// Indicates whether the app bar is for the home page.
  final bool isHome;

  ///String for the app bar title
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: context.topPadding + 10,
      ),
      color: Colors.white,
      child: Column(
        children: [
          const _TopAddressWidget(),
          const SizedBox(
            height: 15,
          ),
          if (isHome) _SearchBoxWidget(),
          if (isHome)
            const SizedBox(
              height: 15,
            ),
          _AppBarNavSectionWidget(
            title: title,
            isHome: isHome,
          ),
        ],
      ),
    );
  }
}

class _TopAddressWidget extends StatelessWidget {
  const _TopAddressWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppAssets.logo),
          Column(
            children: [
              Text(
                'DELIVERY ADDRESS',
                style: AppTextStyles.w600(fontSize: 10),
              ),
              Text(
                'Umuezike Road, Oyo State',
                style: AppTextStyles.w600(fontSize: 12),
              ),
            ],
          ),
          SvgPicture.asset(AppAssets.notificationIcon),
        ],
      ),
    );
  }
}

class _SearchBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: AppTextStyles.w500(
                    color: AppColors.placeholderColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarNavSectionWidget extends StatelessWidget {
  const _AppBarNavSectionWidget({required this.title, this.isHome = false});
  final String title;
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: const Border(top: BorderSide(color: AppColors.borderColor)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (!isHome) {
                context.navigator.pop();
              }
            },
            child: const Icon(Icons.chevron_left),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: AppTextStyles.w700(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
