import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//  A simple bool
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Inmutabe color list
final colorListProvider = Provider((ref) => colorList);

// A simple int
final selectedColorProvider = StateProvider((ref) => 0);
