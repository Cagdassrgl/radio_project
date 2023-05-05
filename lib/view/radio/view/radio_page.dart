import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radio_project/view/radio/controller/radio_controller.dart';

class RadioPage extends StatelessWidget {
  RadioPage({
    Key? key,
  }) : super(key: key);

  final RadioController radioController = Get.put(RadioController());

  @override
  Widget build(BuildContext context) {
    radioController.getArguments(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: Get.width,
              margin: EdgeInsets.only(
                  top: 80.w, bottom: 40.h, left: 40.w, right: 40.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.sp),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1.0,
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/home',
                  );
                },
                child: Image.asset(
                  radioController.radio?.image ?? "",
                  fit: BoxFit.fill,
                  errorBuilder: (context, _, __) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 200.r,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Beklenmedik bir hata oluştu!",
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: 32.sp,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: Get.width,
              margin: EdgeInsets.only(
                  top: 20.w, bottom: 40.h, left: 40.w, right: 40.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.sp),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1.0,
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "FM ${radioController.radio?.name ?? ""}",
                      style: GoogleFonts.roboto(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GetBuilder(
                      id: RadioController.RADIO_PAGE_BUTTON_OBSERVE_ID,
                      init: radioController,
                      builder: (context) {
                        return InkWell(
                          onTap: () {
                            radioController.changePlayingStatus(
                                radioController.radio?.url ?? "");
                          },
                          child: radioController.isPlaying
                              ? const Icon(
                                  Icons.stop_circle_rounded,
                                  size: 100,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.play_circle,
                                  size: 100,
                                  color: Colors.blue,
                                ),
                        );
                      }
                    ),
                    Text(
                      radioController.radio?.category ?? "",
                      style: GoogleFonts.roboto(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: Get.width,
              margin: EdgeInsets.only(
                  top: 20.w, bottom: 40.h, left: 40.w, right: 40.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.sp),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1.0,
                    blurRadius: 20.0,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
