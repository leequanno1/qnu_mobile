import 'package:get/get.dart';
import 'package:qnu_mobile/data/dto/custom_response.dart';
import 'package:qnu_mobile/data/dto/staff_user_info.dart';
import 'package:qnu_mobile/data/dto/student_user_info.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/data/services/user_type.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class ProfileController extends GetxController {
  final Rx<StudentUserInfo?> studentUserInfo = Rx(null);
  final Rx<StaffUserInfo?> staffUserInfo = Rx(null);
  final StateService stateService = Get.find();

  @override 
  void onInit() async {
    super.onInit();
    if(stateService.userInfo.value?.userType == UserType.STUDENT){
      // load student
      await _loadStudent();
    } else {
      // load staff
      await _loadStaff();
    }
  }

  Future<void> _loadStudent() async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };

    dynamic rawResponse = await HttpUtil.post("/api/user/get_stu_user_info",
      headers: headerPair,
      body: {"userId": stateService.userInfo.value?.userId}
    );

    CustomResponse<StudentUserInfo> studentResponse = CustomResponse.convert(rawResponse,
      (json) => StudentUserInfo.fromJson(json)
    );

    studentUserInfo.value = studentResponse.data;
  }

  Future<void> _loadStaff() async {
    var headerPair = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': stateService.getToken()
    };

    dynamic rawResponse = await HttpUtil.post("/api/user/get_sta_user_info",
      headers: headerPair,
      body: {"userId": stateService.userInfo.value?.userId}
    );

    CustomResponse<StaffUserInfo> staffResponse = CustomResponse.convert(rawResponse,
      (json) => StaffUserInfo.fromJson(json)
    );

    staffUserInfo.value = staffResponse.data;
  }
  
}