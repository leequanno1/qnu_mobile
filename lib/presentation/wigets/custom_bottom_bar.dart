import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class CustomBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          StylishBottomBar(
            option: BubbleBarOptions(
              barStyle: BubbleBarStyle.vertical,
              bubbleFillStyle: BubbleFillStyle.fill,
              opacity: 0.3,
            ),
            items: [
              BottomBarItem(
                icon: const Icon(PhosphorIconsBold.horse),
                title: const Text('Tổ chức'),
                selectedColor: AppColors.primary,
                unSelectedColor: Colors.grey,
              ),
              BottomBarItem(
                icon: const Icon(PhosphorIconsBold.usersThree),
                title: const Text('Người dùng'),
                selectedColor: AppColors.primary,
                unSelectedColor: Colors.grey,
              ),
              // Center empty item for FAB
              BottomBarItem(
                icon: const Icon(PhosphorIconsBold.elevator),
                title: const Text('Phòng ban'),
                selectedColor: AppColors.primary,
                unSelectedColor: Colors.grey,
              ),
              BottomBarItem(
                icon: const Icon(PhosphorIconsBold.user),
                title: const Text('Cá nhân'),
                selectedColor: AppColors.primary,
                unSelectedColor: Colors.grey,
              ),
            ],
            currentIndex: selectedIndex,
            onTap: onItemTapped,
          ),
        ],
      ),
    );
  }
}