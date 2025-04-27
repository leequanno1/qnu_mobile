import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimePickerController extends GetxController {
  Rx<DateTime?> startTime = Rx<DateTime?>(null);
  Rx<DateTime?> endTime = Rx<DateTime?>(null);

  Future<DateTime?> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.teal, // màu nút chọn ngày
              onSurface: Colors.white, // màu chữ
            ),
            dialogBackgroundColor: Colors.black, // nền dialog
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal, // màu nút Cancel/OK
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    final time = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Colors.teal, // màu nút chọn ngày
              onSurface: Colors.white, // màu chữ
            ),
            dialogBackgroundColor: Colors.black, // nền dialog
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal, // màu nút Cancel/OK
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    return time == null? date : date?.add(Duration(hours: time.hour, minutes: time.minute));
  }

  Future<void> selectStartTime(BuildContext context) async {
    startTime.value = await _selectDate(context);
  }

  Future<void> selectEndTime(BuildContext context) async {
    endTime.value = await _selectDate(context);
  }

  void dataReset() {
    startTime.value = null;
    endTime.value = null;
  }
}
