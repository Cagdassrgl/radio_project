import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radio_project/core/constant/color/app_color.dart';
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
      backgroundColor: AppColors.lightBlue,
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
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkBlue,
                    spreadRadius: 1.0.r,
                    blurRadius: 20.0.r,
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
                color: AppColors.black,
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
                        color: AppColors.white,
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
                                    color: Color(0xFFa4161a),
                                  )
                                : Icon(
                                    Icons.play_circle,
                                    size: 100,
                                    color: AppColors.darkBlue,
                                  ),
                          );
                        }),
                    Text(
                      radioController.radio?.category ?? "",
                      style: GoogleFonts.roboto(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: AppColors.darkBlue,
        height: 120.h,
        child: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(
              context,
              '/home',
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                color: AppColors.white,
              ),
              Text(
                "Home",
                style: GoogleFonts.roboto(
                  fontSize: 24.sp,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
