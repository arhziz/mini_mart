// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:mini_mart/core/core.dart';
import 'package:mini_mart/shared/shared.dart';

/// A view for displaying the home screen of the application.
/// This view is typically the first screen users see when they open the app.
class HomeView extends StatelessWidget {
  /// Creates a [HomeView].
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      Item(
        id: 1,
        name: 'Apple iPhone 16 128GB|Teal',
        price: 700,
        image: AppAssets.iphone,
        description: [
          'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
          'There will be no visible cosmetic imperfections when held at an arm’s length.',
          'There will be no visible cosmetic imperfections when held at an arm’s length.',
          'This product will have a battery which exceeds 80% capacity relative to new.',
          'Accessories will not be original, but will be compatible and fully functional. Product may come in generic Box',
          'This product is eligible for a replacement or refund within 90 days of receipt if you are not satisfied.',
        ],
      ),
      Item(
        id: 2,
        name: 'M4 Macbook Air 13” 256GB|Sky blue',
        price: 1000,
        image: AppAssets.macbook,
        description: [
          'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
          'There will be no visible cosmetic imperfections when held at an arm’s length.',
          'There will be no visible cosmetic imperfections when held at an arm’s length.',
          'This product will have a battery which exceeds 80% capacity relative to new.',
          'Accessories will not be original, but will be compatible and fully functional. Product may come in generic Box',
          'This product is eligible for a replacement or refund within 90 days of receipt if you are not satisfied.',
        ],
      ),
      Item(
        id: 3,
        name: 'Google Pixel 9A 128GB|Iris',
        price: 499,
        image: AppAssets.pixel,
        description: [
          'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
          'There will be no visible cosmetic imperfections when held at an arm’s length.',
          'There will be no visible cosmetic imperfections when held at an arm’s length.',
          'This product will have a battery which exceeds 80% capacity relative to new.',
          'Accessories will not be original, but will be compatible and fully functional. Product may come in generic Box',
          'This product is eligible for a replacement or refund within 90 days of receipt if you are not satisfied.',
        ],
      ),
      Item(
        id: 4,
        name: 'Apple Airpods 4 Active Noise Cancellation|Teal',
        price: 129,
        image: AppAssets.pod,
        description: [
          'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
          'There will be no visible cosmetic imperfections when held at an arm’s length.',
          'There will be no visible cosmetic imperfections when held at an arm’s length.',
          'This product will have a battery which exceeds 80% capacity relative to new.',
          'Accessories will not be original, but will be compatible and fully functional. Product may come in generic Box',
          'This product is eligible for a replacement or refund within 90 days of receipt if you are not satisfied.',
        ],
      ),
      Item(
        id: 5,
        name: 'Google Pixel 9A 128GB|Iris',
        price: 1.49,
        image: AppAssets.pixel,
        description: [
          'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
          'There will be no visible cosmetic imperfections when held at an arm’s length.',
          'There will be no visible cosmetic imperfections when held at an arm’s length.',
          'This product will have a battery which exceeds 80% capacity relative to new.',
          'Accessories will not be original, but will be compatible and fully functional. Product may come in generic Box',
          'This product is eligible for a replacement or refund within 90 days of receipt if you are not satisfied.',
        ],
      ),
      Item(
        id: 6,
        name: 'Apple Airpods 4 Active Noise Cancellation|Teal',
        price: 1.49,
        image: AppAssets.pod,
        description: [
          'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
          'There will be no visible cosmetic imperfections when held at an arm’s length.',
          'There will be no visible cosmetic imperfections when held at an arm’s length.',
          'This product will have a battery which exceeds 80% capacity relative to new.',
          'Accessories will not be original, but will be compatible and fully functional. Product may come in generic Box',
          'This product is eligible for a replacement or refund within 90 days of receipt if you are not satisfied.',
        ],
      ),
    ];
    return Column(
      children: [
        const AppBarWidget(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Smartphones, Laptops & \nAssecories',
                  style: AppTextStyles.w500(fontSize: 18)
                      .copyWith(fontFamily: AppStrings.ibmPlexMono),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children:
                      items.map((item) => ItemWidget(item: item)).toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
