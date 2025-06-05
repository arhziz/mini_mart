import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/core/utils/build_context_extension.dart';
import 'package:mini_mart/features/product/presentation/views/product_view.dart';
import 'package:mini_mart/shared/shared.dart';

/// A widget that represents an item in the application.
/// This widget is typically used to display product details in a list or grid.
class ItemWidget extends StatelessWidget {
  /// Creates an instance of [ItemWidget].
  const ItemWidget({required this.item, super.key});

  ///The item object
  final Item item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.navigator.push(ProductView.route(item));
      },
      child: SizedBox(
        width: 170.sp,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              item.image,
              fit: BoxFit.cover,
            ),
            Text(
              item.name,
              style: AppTextStyles.w400(),
            ),
            Text(
              '\$${item.price.toStringAsFixed(2)}',
              style: AppTextStyles.w700(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
