import 'package:flutter/material.dart';
import 'package:mini_mart/shared/shared.dart';
import 'package:mini_mart/shared/theme/app_colors.dart';

///
class UnorderedListWidget extends StatelessWidget {
  ///
  const UnorderedListWidget({required this.items, super.key});

  ///
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '• ',
              style: AppTextStyles.w400(
                fontSize: 17,
                color: AppColors.descriptionColor,
              ),
            ),
            Expanded(
              child: Text(
                item,
                style: AppTextStyles.w400(color: AppColors.descriptionColor),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
