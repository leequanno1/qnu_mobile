class ImageDTO {
  final String imageId;
  final String parentId;
  final String imageUrl;
  final DateTime insDate;
  final bool delFlg;

  ImageDTO(
      {required this.imageId,
      required this.parentId,
      required this.imageUrl,
      required this.insDate,
      required this.delFlg});
}
