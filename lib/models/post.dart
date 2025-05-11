import 'package:qnu_mobile/data/dto/member_info.dart';
import 'package:qnu_mobile/data/dto/post_dto.dart';

class Post {
  final PostDto postDto;
  final MemberInfo memberInfo;

  Post(this.postDto, this.memberInfo);
}
