import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDetailsController extends GetxController {
  var username = ''.obs;

  void setUsername(String name) {
    username.value = name;
  }
}