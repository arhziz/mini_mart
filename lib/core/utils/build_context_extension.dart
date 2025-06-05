import 'package:flutter/material.dart';

/// Extension on [BuildContext] to provide easy access to theme and media query
/// properties.
/// This extension allows you to access the current theme, text theme,
extension BuildContextExtension on BuildContext {
  /// Returns the current theme data.
  /// This provides access to the theme properties such as colors, font styles,
  /// etc.
  ThemeData get theme => Theme.of(this);

  ///
  NavigatorState get navigator => Navigator.of(this);

  /// Returns the current text theme.
  /// This provides access to the text styles defined in the theme.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns the current text scale factor.
  /// This is useful for adjusting text size based on user preferences.
  double get sizeWidth => MediaQuery.of(this).size.width;

  /// Returns the current text scale factor.
  /// This is useful for adjusting text size based on user preferences.
  double get sizeHeight => MediaQuery.of(this).size.height;

  ///Returns the current top padding.
  double get topPadding => MediaQuery.of(this).viewPadding.top;

  ///Returns the current bottom padding.
  double get bottomPadding => MediaQuery.of(this).viewPadding.bottom;

  /// Returns the current text scale factor.
  /// This is useful for adjusting text size based on user preferences.
  Orientation get orientation => MediaQuery.of(this).orientation;
}
