import 'package:flutter/material.dart';
import 'package:mini_mart/shared/shared.dart';

/// A view for displaying user profile information.
class UserProfileView extends StatelessWidget {
  /// Creates a [UserProfileView].
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'User Profile View',
        style: AppTextStyles.w500(),
      ),
    );
  }
}
