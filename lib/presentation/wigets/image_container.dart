import 'package:flutter/material.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/data/dto/org_image.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class ImageContainer extends StatelessWidget {
  final OrgImage imageDTO;

  const ImageContainer({super.key, required this.imageDTO});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // màu bóng mờ
              blurRadius: 4, // độ mờ
              offset: Offset(2, 2), // độ lệch theo trục x, y
            )
          ]),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            HttpUtil.mapUrl(imageDTO.imageUrl),
            fit: BoxFit.cover,
          )),
    );
  }
}
