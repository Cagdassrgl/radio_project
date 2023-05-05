// ignore_for_file: constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio_project/core/model/radios.dart';

class RadioController extends GetxController {
  MyRadio? radio;

  bool isPlaying = false;
  AudioPlayer audioPlayer = AudioPlayer();

  void getArguments(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as MyRadio;
    radio = args;
    audioPlayer.setUrl(radio?.url ?? "");
  }

  void changePlayingStatus(String url) async {
    isPlaying = isPlaying ? false : true;
    update([RADIO_PAGE_BUTTON_OBSERVE_ID]);

    if (isPlaying) {
      await audioPlayer.play();
    } else {
      await audioPlayer.stop();
    }
    update([RADIO_PAGE_BUTTON_OBSERVE_ID]);
  }

  static const RADIO_PAGE_BUTTON_OBSERVE_ID = "radio_page_button_observe_id";
}
