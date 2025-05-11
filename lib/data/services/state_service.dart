import 'package:get/get.dart';
import 'package:qnu_mobile/data/dto/custom_response.dart';
import 'package:qnu_mobile/data/dto/staff_user_info.dart';
import 'package:qnu_mobile/data/dto/student_user_info.dart';
import 'package:qnu_mobile/data/dto/user_info.dart';
import 'package:qnu_mobile/data/services/user_type.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class StateService extends GetxService {

  final _isAuthenticated = false.obs;
  String _token = "";
  Rx<UserInfo?> userInfo = Rx(null);

  final Rx<StudentUserInfo?> studentInfo = Rx(null);
  final Rx<StaffUserInfo?> staffInfo = Rx(null);

  bool get isAuthenticated => _isAuthenticated.value;

  Future<void> setAuthenticated(bool value, String token) async {
    _isAuthenticated.value = value;
    _token = token;
    //get userType
    CustomResponse<List<UserInfo>> response = CustomResponse.convert(
      await HttpUtil.post("/api/user/get_user_info", body: {
        "userIds": ["4451190096"]
      }, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': getToken()
      }),
      (data) => (data as List)
          .map((item) => UserInfo.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
    userInfo.value = response.data[0];
    if(userInfo.value?.userType == UserType.STUDENT){
      // get student info;
      studentInfo.value = await getStudentUserInfo();
      print(studentInfo.value?.fullName);
    } else {
      staffInfo.value = await getStaffUserInfo();
      print(staffInfo.value?.fullName);
    }
  }

  Future<bool> checkAuth() async {
    return true;
  }

  String getToken(){
    return "Bearer $_token";
  }

  Future<StudentUserInfo> getStudentUserInfo() async {
    CustomResponse<StudentUserInfo> response = CustomResponse.convert(
      await HttpUtil.post("/api/user/get_stu_user_info", body: {
        "userId": userInfo.value?.userId
      }, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': getToken()
      }),
      (json) => StudentUserInfo.fromJson(json),
    );
    return response.data;
  }
  
  Future<StaffUserInfo> getStaffUserInfo() async {
    CustomResponse<StaffUserInfo> response = CustomResponse.convert(
      await HttpUtil.post("/api/user/get_sta_user_info", body: {
        "userId": userInfo.value?.userId
      }, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': getToken()
      }),
      (json) => StaffUserInfo.fromJson(json),
    );
    return response.data;
  }
}
