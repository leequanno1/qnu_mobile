import 'package:get/get.dart';
import 'package:qnu_mobile/data/dto/custom_response.dart';
import 'package:qnu_mobile/data/dto/staff_user_info.dart';
import 'package:qnu_mobile/data/dto/student_user_info.dart';
import 'package:qnu_mobile/data/dto/user_info.dart';
import 'package:qnu_mobile/data/services/user_type.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';
import 'dart:convert';

class StateService extends GetxService {

  final _isAuthenticated = false.obs;
  String _token = "";
  String get token => _token;
  Rx<UserInfo?> userInfo = Rx(null);

  final Rx<StudentUserInfo?> studentInfo = Rx(null);
  final Rx<StaffUserInfo?> staffInfo = Rx(null);

  bool get isAuthenticated => _isAuthenticated.value;

  Future<void> setAuthenticated(bool value, String token) async {
    _isAuthenticated.value = value;
    _token = token;
    String tempId = extractSubFromJwt(token)??"";
    //get userType
    CustomResponse<List<UserInfo>> response = CustomResponse.convert(
      await HttpUtil.post("/api/user/get_user_info", body: {
        "userIds": [tempId]
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
    } else {
      staffInfo.value = await getStaffUserInfo();
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

  String? extractSubFromJwt(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw FormatException('Invalid JWT');
      }

      final payload = parts[1];
      final normalized = base64.normalize(payload);
      final decoded = utf8.decode(base64Url.decode(normalized));
      final payloadMap = json.decode(decoded);

      if (payloadMap is! Map<String, dynamic>) {
        throw FormatException('Invalid payload');
      }
      return payloadMap['sub'];
    } catch (e) {
      return null;
    }
  }
}
