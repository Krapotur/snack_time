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

  bool isEdit = false;
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
      isEdit = false;
      isFaster = true;
      isTime = false;
    }
    notifyListeners();
  }

  void onByTime() {
    if (isTime == true) {
      isTime = false;
    } else {
      isEdit = false;
      isFaster = false;
      isTime = true;
    }
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
}
