import 'package:flutter/material.dart';

class Model extends ChangeNotifier {
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController payController = TextEditingController();
  final TextEditingController changeFromAmountController =
      TextEditingController();
  final TextEditingController recipientController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController promocodeController = TextEditingController();

  String comment = '';
  String descriptionPay = '';

  List<bool> isSelected = [true, false];
  List<String> timeList = [
    '10:00 - 10:30',
    '10:30 - 11:00',
    '11:00 - 11:30',
    '11:30 - 12:00',
    '12:00 - 12:30',
    '12:30 - 13:00',
    '13:00 - 13:30',
    '13:30 - 14:00',
    '14:00 - 14:30',
    '14:30 - 15:00',
    '15:00 - 15:30',
    '15:30 - 16:00',
    '16:00 - 16:30',
    '16:30 - 17:00',
    '17:00 - 17:30',
    '17:30 - 18:00',
    '18:00 - 18:30',
    '18:30 - 19:00',
    '19:00 - 19:30',
    '19:30 - 20:00',
    '20:00 - 20:30',
    '20:30 - 21:00',
    '21:00 - 21:30',
    '21:30 - 22:00',
    '22:00 - 22:30',
    '22:30 - 23:00',
    '23:00 - 23:30',
  ];

  String selectedTime = '';

  bool isSelectTime = false;
  bool isDelivery = false;
  bool isEdit = true;
  bool isFaster = false;
  bool isTime = false;

  void callNotifyListeners() {
    notifyListeners();
  }

  setIsEdit() {
    isEdit = true;
    notifyListeners();
  }

  void onBySoon() {
    if (isFaster == true) {
      isFaster = false;
    } else {
      isFaster = true;
      isTime = false;
    }
    isEdit = false;
    notifyListeners();
  }

  void onByTime() {
    if (isTime == true) {
      isTime = false;
    } else {
      isFaster = false;
      isTime = true;
    }
    isEdit = false;

    notifyListeners();
  }

  void commentUpdate() {
    comment = commentController.text;
    notifyListeners();
  }

  void setDescrtiptionText(String value) {
    if (value == 'pay') {
      descriptionPay =
          '*Для оплаты картой, у курьера будет с собой банковский терминал';
    } else {
      descriptionPay =
          '*Пожалуйста укажите сумму, с которой курьер должен вернуть сдачу';
    }
    notifyListeners();
  }

  void setIsSelected(int index) {
    isSelected[index] = !isSelected[index];
    notifyListeners();
  }

  void setSelectTime(int index) {
    isSelectTime = !isSelectTime;
    selectedTime = timeList[index];
    notifyListeners();
  }
}
