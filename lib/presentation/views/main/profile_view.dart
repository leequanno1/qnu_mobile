import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/main/profile_controller.dart';
import 'package:qnu_mobile/data/dto/staff_user_info.dart';
import 'package:qnu_mobile/data/dto/student_user_info.dart';
import 'package:qnu_mobile/data/services/state_service.dart';
import 'package:qnu_mobile/data/services/user_type.dart';
import 'package:qnu_mobile/presentation/dialog/logout_dialog.dart';
import 'package:qnu_mobile/presentation/styles/button_style.dart';
import 'package:qnu_mobile/utils/http_ultil.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});
  final bool isStaff = Get.find<StateService>().userInfo.value?.userType != UserType.STUDENT;
  final ProfileController _controller = Get.find();
  final StateService stateService = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: isStaff? 
      _StaffCard(staffUserInfo: _controller.staffUserInfo.value!, email: stateService.userInfo.value!.emailAddress, ) : 
      _StudentCard(studentUserInfo: _controller.studentUserInfo.value!,email: stateService.userInfo.value!.emailAddress, ),
    );
  }
}

class _StaffCard extends StatelessWidget {
  final StaffUserInfo staffUserInfo;
  final String email;

  const _StaffCard({required this.staffUserInfo, required this.email});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with background and profile image
            SizedBox(
              height: 180,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      child: Image.network(HttpUtil.mapUrl(staffUserInfo.userBackground), fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => Image(image: AssetImage("assets/images/empty.png"), fit: BoxFit.cover,),),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 15,
                    child: CircleAvatar(
                      radius: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(49),
                        child: SizedBox(
                          height: 98,
                          width: 98,
                          child: Image.network(HttpUtil.mapUrl(staffUserInfo.userAvatar), fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) => Image(image: AssetImage("assets/images/empty.png"), fit: BoxFit.cover,),)),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 120,
                    bottom: 15,
                    child: Text(
                      staffUserInfo.displayName,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBackground),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            // Staff Details
            _buildDetailRow('Họ và tên:', staffUserInfo.fullName),
            _buildDetailRow('Khoa:', staffUserInfo.depName),
            _buildDetailRow('Liên hệ:', staffUserInfo.phoneNumber),
            _buildDetailRow('Email:', email),
            _buildDetailRow('Tài khoản:', 'Giảng viên.'),
            SizedBox(height: 10,),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: redBackgroundButton,
                onPressed: (){
                  LogoutDialog.instance.render(context,null);
                }, 
                child: Text("Đăng xuất")
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _StudentCard extends StatelessWidget {
  final StudentUserInfo studentUserInfo;
  
  final String email;

  const _StudentCard({required this.studentUserInfo, required this.email});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with background and profile image
            SizedBox(
              height: 180,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 15,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 49,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 120,
                    bottom: 15,
                    child: Text(
                      'Student Name',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBackground),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            // Staff Details
            _buildDetailRow('Họ và tên:', studentUserInfo.displayName),
            _buildDetailRow('Ngành học:', studentUserInfo.majorName),
            _buildDetailRow('Khoa:', studentUserInfo.depName),
            _buildDetailRow('Liên hệ:', studentUserInfo.phoneNumber),
            _buildDetailRow('Email:', email),
            _buildDetailRow('Tài khoản:', 'Sinh viên.'),
            SizedBox(height: 10,),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: redBackgroundButton,
                onPressed: () {
                  LogoutDialog.instance.render(context,null);
                },
                child: Text("Đăng xuất")
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildDetailRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(color: Colors.black87),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
