import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_mart/core/core.dart';
import 'package:mini_mart/core/utils/build_context_extension.dart';
import 'package:mini_mart/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:mini_mart/shared/shared.dart';
import 'package:mini_mart/shared/theme/app_colors.dart';
import 'package:toastification/toastification.dart';

///Product view for each item
class ProductView extends StatelessWidget {
  /// Creates a [ProductView].
  const ProductView({required this.item, super.key});

  ///The item object
  final Item item;

  /// This method is used to create a route for the [ProductView].
  static Route<void> route(Item item) {
    return MaterialPageRoute<void>(
      builder: (_) => ProductView(
        item: item,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _AddToCartSection(item: item),
      body: Column(
        children: [
          const AppBarWidget(
            title: 'Go back',
            isHome: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    _ImageWidget(item: item),
                    const SizedBox(height: 10),
                    _ItemDetailWidget(item: item),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddToCartSection extends StatelessWidget {
  const _AddToCartSection({
    required this.item,
  });
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.sp,
        left: 10.sp,
        right: 10.sp,
        bottom: 10.sp + context.bottomPadding,
      ),
      color: AppColors.white,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Change radius here
          ),
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: () {
          context.read<CartBloc>().add(AddToCart(item));
          toastification.show(
            context: context,
            style: ToastificationStyle.minimal,
            type: ToastificationType.success,
            title: Text(
              'Item has been added to cart',
              style: AppTextStyles.w600(),
            ),
            autoCloseDuration: const Duration(seconds: 2),
          );
        },
        child: Text(
          'Add to cart',
          style: AppTextStyles.w700(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class _ItemDetailWidget extends StatelessWidget {
  const _ItemDetailWidget({
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          style: AppTextStyles.w400(fontSize: 17),
        ),
        const SizedBox(height: 10),
        Text(
          '\$${item.price.toStringAsFixed(2)}',
          style: AppTextStyles.w700(fontSize: 32.75),
        ),
        const SizedBox(height: 10),
        Text(
          'About this item',
          style: AppTextStyles.w400(color: AppColors.descriptionColor),
        ),
        UnorderedListWidget(items: item.description),
      ],
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.sizeHeight * 0.4,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(item.image),
        ),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {},
          icon: const _IconContainer(),
        ),
      ),
    );
  }
}

class _IconContainer extends StatelessWidget {
  const _IconContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.sp,
      height: 50.sp,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(25.sp),
      ),
      padding: EdgeInsets.all(10.sp),
      child: SvgPicture.asset(
        AppAssets.favoriteIcon,
      ),
    );
  }
}
