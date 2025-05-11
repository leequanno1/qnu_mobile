import 'package:qnu_mobile/data/dto/org_image.dart';

class PostDto {
  final String postId;
  final String posterId;
  final String postTitle;
  final String postContent;
  final int comments;
  final DateTime insDate;
  final bool delFlg;
  final bool isApproved;
  final String orgId;
  final List<OrgImage> images;

  PostDto({
    required this.postId,
    required this.posterId,
    required this.postTitle,
    required this.postContent,
    required this.comments,
    required this.insDate,
    required this.delFlg,
    required this.isApproved,
    required this.orgId,
    required this.images,
  });

  factory PostDto.fromJson(Map<String, dynamic> json) {
    return PostDto(
      postId: json['postId'] ?? '',
      posterId: json['posterId'] ?? '',
      postTitle: json['postTitle'] ?? '',
      postContent: json['postContent'] ?? '',
      comments: json['comments'] ?? 0,
      insDate: DateTime.tryParse(json['insDate'] ?? '') ?? DateTime(1970),
      delFlg: json['delFlg'] ?? false,
      isApproved: json['isApproved'] ?? false,
      orgId: json['orgId'] ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => OrgImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
