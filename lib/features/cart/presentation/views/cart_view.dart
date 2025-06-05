import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_mart/core/constants/app_assets.dart';
import 'package:mini_mart/core/utils/build_context_extension.dart';
import 'package:mini_mart/features/cart/domain/models/cart_item.dart';
import 'package:mini_mart/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:mini_mart/shared/shared.dart';
import 'package:mini_mart/shared/theme/app_colors.dart';

///
class CartView extends StatelessWidget {
  ///
  const CartView({super.key});

  /// This method is used to create a route for the [CartView].
  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const CartView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          bottomNavigationBar: _CheckOutSection(state: state),
          body: Column(
            children: [
              const AppBarWidget(
                title: 'Your Cart',
                isHome: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: state.items
                              .map((item) => _CartItemWidget(item: item))
                              .toList(),
                        ),
                        const SizedBox(height: 10),
                        _OrderInfo(
                          state: state,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _OrderInfo extends StatelessWidget {
  const _OrderInfo({required this.state});
  final CartState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Info',
          style: AppTextStyles.w700(),
        ),
        const SizedBox(height: 10),
        _OrderInfoItemWidget(
          state: state,
          title: 'Subtotal',
          info: '\$${state.totalPrice.toStringAsFixed(2)}',
        ),
        _OrderInfoItemWidget(
          state: state,
          title: 'Shipping',
          info: r'$10',
        ),
        _OrderInfoItemWidget(
          state: state,
          title: 'Total',
          info: '\$${(state.totalPrice + 10).toStringAsFixed(2)}',
        ),
      ],
    );
  }
}

class _OrderInfoItemWidget extends StatelessWidget {
  const _OrderInfoItemWidget({
    required this.state,
    required this.info,
    required this.title,
  });

  final CartState state;
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.w500(fontSize: 12),
          ),
          Text(
            info,
            style: AppTextStyles.w500(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _CartItemWidget extends StatelessWidget {
  const _CartItemWidget({required this.item});
  final CartItem item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 10.sp),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: AppColors.cartBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            item.item.image,
            width: 120.sp,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.item.name,
                  style: AppTextStyles.w400(),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '\$${item.item.price.toStringAsFixed(2)}',
                  style: AppTextStyles.w600(fontSize: 17),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'In stock',
                  style: AppTextStyles.w400(color: AppColors.green),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (item.quantity > 1) {
                              context.read<CartBloc>().add(
                                    UpdateCartItemQuantity(
                                      item.item.id,
                                      item.quantity - 1,
                                    ),
                                  );
                            }
                          },
                          icon: const _IconContainer(
                            icon: AppAssets.minusIcon,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${item.quantity}',
                          style: AppTextStyles.w400(),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () {
                            context.read<CartBloc>().add(
                                  UpdateCartItemQuantity(
                                    item.item.id,
                                    item.quantity + 1,
                                  ),
                                );
                          },
                          icon: const _IconContainer(
                            icon: AppAssets.plusIcon,
                            isActive: true,
                            hasBorders: true,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(
                              RemoveFromCart(
                                item.item.id,
                              ),
                            );
                      },
                      icon: const _IconContainer(
                        icon: AppAssets.deleteIcon,
                        isActive: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckOutSection extends StatelessWidget {
  const _CheckOutSection({required this.state});
  final CartState state;
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
        onPressed: () {},
        child: Text(
          'Checkout (\$${state.totalPrice.toStringAsFixed(2)})',
          style: AppTextStyles.w700(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class _IconContainer extends StatelessWidget {
  const _IconContainer({
    required this.icon,
    this.isActive = false,
    this.hasBorders = false,
  });
  final bool isActive;
  final bool hasBorders;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.sp,
      height: 45.sp,
      decoration: BoxDecoration(
        color: isActive ? AppColors.white : AppColors.borderColor,
        borderRadius: BorderRadius.circular(22.5.sp),
        border: hasBorders
            ? Border.all(
                color: AppColors.borderColor,
              )
            : null,
      ),
      padding: EdgeInsets.all(10.sp),
      child: SvgPicture.asset(
        icon,
      ),
    );
  }
}
