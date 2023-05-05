import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:radio_project/view/home/home_controller.dart';
import 'package:radio_project/view/radio/view/radio_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 40.h),
        child: Container(
          color: Colors.blue,
          child: Center(
            child: Text(
              "Radio Project",
              style: GoogleFonts.roboto(
                fontSize: 48.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder(
        id: HomeController.RADIO_OBSERVE_ID,
        init: homeController,
        builder: (context) {
          if (homeController.radioState == NetworkState.LOADING) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (homeController.radioState == NetworkState.SUCCESS) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: homeController.radios?.length ?? 0,
              itemBuilder: (context, index) {
                final current = homeController.radios?[index];
                return Container(
                  width: Get.width,
                  height: Get.height / 3,
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
                        '/radio',
                        arguments: current
                      );
                    },
                    child: Image.asset(
                      homeController.radios?[index].image ?? "",
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            );
          } else {
            return Container(
              width: Get.width,
              height: Get.height,
              margin: EdgeInsets.all(50.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1.0,
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "Beklenmedik bir hata oluştu!",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 48.sp,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
