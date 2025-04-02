import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qnu_mobile/assets/app_color.dart';
import 'package:qnu_mobile/controller/main/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: true? _StaffCard() : _StudentCard(),
    );
  }
}

class _StaffCard extends StatelessWidget {
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
                      'Staff Name',
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
            _buildDetailRow('Họ và tên:', 'Student Name'),
            _buildDetailRow('Khoa:', 'Dep Name'),
            _buildDetailRow('Liên hệ:', '09xx xxx xxx'),
            _buildDetailRow('Email:', 'exampleadmin@mail.com'),
            _buildDetailRow('Tài khoản:', 'Giảng viên.'),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){}, child: Text("Đăng xuất"))
          ],
        ),
      ),
    );
  }
}

class _StudentCard extends StatelessWidget {
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
            _buildDetailRow('Họ và tên:', 'Student Name'),
            _buildDetailRow('Ngành học:', 'Major Name'),
            _buildDetailRow('Khoa:', 'Dep Name'),
            _buildDetailRow('Liên hệ:', '09xx xxx xxx'),
            _buildDetailRow('Email:', 'exampleadmin@mail.com'),
            _buildDetailRow('Tài khoản:', 'Giảng viên.'),
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
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
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
