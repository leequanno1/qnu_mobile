import 'package:flutter/material.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/models/image.dart';

class ImageContainer extends StatelessWidget {
  
  final ImageDTO imageDTO;

  const ImageContainer({super.key, required this.imageDTO});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
    );
  }
}