import 'package:flutter/material.dart';
import 'package:qnu_mobile/assets/app_color.dart';

ButtonStyle borderButtonEnable = ElevatedButton.styleFrom(
  backgroundColor: AppColors.background,
  foregroundColor: Colors.black,
  disabledForegroundColor: Colors.black12,
  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
  textStyle: const TextStyle(
    fontSize: 16, 
    fontWeight: FontWeight.bold,
    color: Colors.black54,
  ),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(color: AppColors.outline, width: 1)),
);

ButtonStyle redBackgroundButton = ElevatedButton.styleFrom(
  backgroundColor: AppColors.textRed,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
  textStyle: const TextStyle(
    fontSize: 16, 
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
  ),
);

ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  backgroundColor: AppColors.primary,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
  textStyle: const TextStyle(
    fontSize: 16, 
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
  ),
);

ButtonStyle switchButtonSeleted = ElevatedButton.styleFrom(
  backgroundColor: AppColors.primary,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
  textStyle: const TextStyle(
    fontSize: 16, 
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
  ),
);

ButtonStyle switchButtonUnseleted = ElevatedButton.styleFrom(
  backgroundColor: AppColors.secondary,
  foregroundColor: Colors.black,
  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
  textStyle: const TextStyle(
    fontSize: 16, 
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
  ),
);
