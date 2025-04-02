import 'package:qnu_mobile/models/image.dart';

class Post {
  final String postId;
  final String posterId;
  final String postTitle;
  final String postContent;
  final int comments;
  final DateTime insDate;
  final bool delFlg;
  final bool isApproved;
  final String orgId;
  final List<ImageDTO> images;

  Post(
      {required this.postId,
      required this.posterId,
      required this.postTitle,
      required this.postContent,
      required this.comments,
      required this.insDate,
      required this.delFlg,
      required this.isApproved,
      required this.orgId,
      required this.images});
}
