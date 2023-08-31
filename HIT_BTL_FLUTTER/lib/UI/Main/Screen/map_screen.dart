import 'package:btl_flutter/controller/map_controller.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../res/AppImage.dart';
import '../../Widget/app_color.dart';
import '../../Widget/app_container.dart';
import '../../Widget/app_image_widget.dart';
import '../../Widget/app_touchable.dart';

class MapScreen extends GetView<MapController> {
  const MapScreen({super.key});

  Widget _buildSlidingUpPanel(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // height: Get.height / 6,
      padding: EdgeInsets.all(8.sp),
      margin: EdgeInsets.only(top: 10.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.sp),
              topLeft: Radius.circular(25.sp))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.sp,
          ),
          Row(
            children: [
              SizedBox(width: 10.sp,),
              Text(
                "Vị trí của bạn: ",
                style: TextStyle(
                  color: AppColor.black333,
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                child: Obx(() => Text(
                      controller.address.value,
                      style: TextStyle(
                        color: AppColor.black333,
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10.sp,),
              Text(
                "Khoảng cách của bạn: ",
                style: TextStyle(
                  color: AppColor.black333,
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Obx(() => Text(
                '${controller.distance} km',
                style: TextStyle(
                    fontSize: 20.sp, fontWeight: FontWeight.w500),
              )),
            ],
          ),
          SizedBox(height:5.sp,),
          Padding(
            padding: EdgeInsets.only(
              left: 16.0.sp,
              right: 8.0.sp,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.red.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: TextButton(
                    onPressed: () {
                      controller.onPressNext();
                    },
                    child: Row(
                      children: [
                        Text(
                          'Tiếp tục',
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: 15.sp,
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0.sp +
                (MediaQuery.of(context).padding.bottom > 0 ? 20.0.sp : 0),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return AppContainer(
      showBanner: false,
      child: Stack(
        children: [
          Obx(
            () => !controller.delayLoadMap.value
                ? const SizedBox.shrink()
                : GoogleMap(
                    mapType: MapType.normal,
                    padding: controller.isMapLoaded.value
                        ? EdgeInsets.only(top: 200.0.sp)
                        : EdgeInsets.zero,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(controller.myLocation.latitude,
                          controller.myLocation.longitude),
                      zoom: 14.4746,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    polylines: controller.route.routes,
                    markers: controller.markerResult.value,
                    onMapCreated: (GoogleMapController googleMapController) {
                      controller.isMapLoaded.value = true;
                      controller.googleMapController
                          .complete(googleMapController);
                      controller.customInfoWindowController
                          .googleMapController = googleMapController;
                    },
                    onCameraMove: (position) {
                      if (controller.customInfoWindowController.onCameraMove !=
                          null) {
                        controller.customInfoWindowController.onCameraMove!();
                      }
                    },
                  ),
          ),
          CustomInfoWindow(
            controller: controller.customInfoWindowController,
            width: 75.0.sp,
            height: 85.0.sp,
            offset: 50.0.sp,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 12.0.sp,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    BackButton(
                      onPressed: () => Get.back(),
                    ),
                    Expanded(
                      child: Text(
                        "Vị trí của bạn",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.black333,
                        ),
                      ),
                    ),
                    InkWell(
                      child: AppImageWidget.asset(
                        path: AppImage.icSearch,
                        color: Colors.black,
                      ),
                      onTap: () {
                   //     controller.onPressSearch();
                      },
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppTouchable(
                            onPressed: controller.onPressMyLocation,
                            width: 50.0.sp,
                            height: 50.0.sp,
                            margin: EdgeInsets.only(
                                bottom: 12.0.sp, right: 12.0.sp),
                            padding: EdgeInsets.all(4.0.sp),
                            borderRadius: BorderRadius.circular(30.0.sp),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(30.0.sp),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.black.withOpacity(0.25),
                                  offset: const Offset(0, 0),
                                  blurRadius: 10.0.sp,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: AppImageWidget.asset(
                                path: AppImage.icMyLocation),
                          ),
                          _buildSlidingUpPanel(context),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
