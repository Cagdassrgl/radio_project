// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:radio_project/core/model/radios.dart';

class HomeController extends GetxController {
  List<MyRadio>? radios;
  NetworkState radioState = NetworkState.LOADING;

  @override
  void onInit() {
    fetchRadios();
    super.onInit();
  }

  void fetchRadios() async {
    radioState = NetworkState.LOADING;
    update([RADIO_OBSERVE_ID]);

    final radioJson = await rootBundle.loadString("assets/radios/radio.json");
    radios = MyRadios.fromJson(jsonDecode(radioJson)).radios;

    if (radios != null) {
      radioState = NetworkState.SUCCESS;
      update([RADIO_OBSERVE_ID]);
    }else {
      radioState = NetworkState.ERROR;
      update([RADIO_OBSERVE_ID]);
    }
  }

  static const String RADIO_OBSERVE_ID = "radio_observe_id";
}

enum NetworkState {
  LOADING,
  SUCCESS,
  ERROR,
}
