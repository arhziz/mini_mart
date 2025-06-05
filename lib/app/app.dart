import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/features/home/presentation/views/home_page.dart';

/// MiniMartApp is the main application widget for the Mini Mart app.
/// It serves as the entry point for the application and sets up the
class MiniMartApp extends StatelessWidget {
  /// Creates a [MiniMartApp].
  const MiniMartApp({super.key});

  @override
  Widget build(BuildContext context) {
    {
      return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            themeMode: ThemeMode.light,
            home: HomePage(),
          );
        },
      );
    }
  }
}
