import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: Get.width / 2,
                    height: Get.height / 2,
                    margin:
                        EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
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
                ),
                Expanded(
                  child: Container(
                    width: Get.width / 2,
                    height: Get.height / 2,
                    margin:
                    EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
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
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: Get.width / 2,
                    height: Get.height / 2,
                    margin:
                    EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
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
                ),
                Expanded(
                  child: Container(
                    width: Get.width / 2,
                    height: Get.height / 2,
                    margin:
                    EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
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
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
