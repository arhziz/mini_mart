import 'package:flutter/material.dart';
import 'package:mini_mart/shared/theme/theme.dart';

/// A view for displaying favorite items in the application.
/// This view is typically used to show items that the user has marked
/// as favorites.
class FavoriteView extends StatelessWidget {
  /// Creates a [FavoriteView].
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorite View',
        style: AppTextStyles.w500(),
      ),
    );
  }
}
