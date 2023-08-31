  import 'dart:async';

import 'package:btl_flutter/controller/AppControler.dart';
import 'package:btl_flutter/controller/state_main_controller.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_routes/google_maps_routes.dart';

class MapController extends GetxController {
  late BuildContext context;

  late Position myLocation;
  RxBool isMapLoaded = false.obs;
  Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();

  RxSet<Marker> markerResult = RxSet();
  MarkerId markerId = const MarkerId('Marker_id_location_pick');
  BitmapDescriptor? _markerBitmapFrom;
  final CustomInfoWindowController customInfoWindowController =
      CustomInfoWindowController();
  RxMap selectedData = RxMap();



  MapsRoutes route = new MapsRoutes();
  DistanceCalculator distanceCalculator = new DistanceCalculator();
  String googleApiKey = 'AIzaSyCrnEW-f7Lx9PlGw3vzZWgfOiMwbLa37-4';
  String totalDistance = 'No route';

  //RxList<Prediction> listPredictionSuggestSearch = RxList();
  TextEditingController textEditingControllerSearch = TextEditingController();
  RxString strSearch = "".obs;

  RxBool isSearch = false.obs;
  RxString currentAddress = "".obs;

  RxBool showClearButton = false.obs;

  RxDouble distance=0.0.obs;

  RxBool delayLoadMap=false.obs;

  RxString address=''.obs;
  final Position shopLocation = Position(
    latitude: 21.0403,
    longitude: 105.7663,
    timestamp: DateTime.now(),
    accuracy: 0.0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
    floor: 0,
  );

  List<LatLng> points = [];


  void drawRouter() async{
    await route.drawRoute(points, 'Test routes',
        const Color.fromRGBO(130, 78, 210, 1.0), googleApiKey,
        travelMode: TravelModes.walking);
      totalDistance =
          distanceCalculator.calculateRouteDistance(points, decimals: 1);

}

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    myLocation=await getCurrentPosition(context);
    distance.value=calculateDistance(myLocation);
    Future.delayed(
        const Duration(milliseconds: 400), () => delayLoadMap.value = true);

    address.value=await getAddressFromLocation(myLocation.latitude,myLocation.longitude);
    super.onReady();
  }
  @override
  Future<void> onInit() async {

    myLocation=Get.arguments['myLocation'];

    points=[
      LatLng(myLocation.latitude, myLocation.longitude),
      const LatLng(21.0402002, 105.7662002),
      const LatLng(21.0402222, 105.7662222),
      const LatLng(21.0403, 105.7663),
    ];

    // Tạo marker với biểu tượng tùy chỉnh
    final Marker customMarker = Marker(
      markerId: const MarkerId('custom_marker_id'),
      position: const LatLng(21.0367, 105.7750),
      icon: BitmapDescriptor.defaultMarkerWithHue(210.0),// Icon tùy chỉnh
      infoWindow: const InfoWindow(title: 'Custom Marker'), // Thông tin cửa sổ info của marker
    );

    drawRouter();

    // Danh sách marker để hiển thị trên bản đồ


    onPressMap(LatLng(myLocation.latitude, myLocation.longitude));
    markerResult.value.add(customMarker);
    distance.value=calculateDistance(myLocation);
    super.onInit();

  }
  onPressMap(LatLng latLng) async {
    markerResult.clear();
    markerResult.add(
      Marker(
        markerId: markerId,
        position: latLng,
        icon: _markerBitmapFrom ?? BitmapDescriptor.defaultMarker,
      ),
    );
  }
  Future<Position> getCurrentPosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // showErrorDialog(context, StringConstants.errorLocation01.tr);
      return Future.error({'code': 1, 'message': 'lõi'});
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // showErrorDialog(context, StringConstants.errorLocation02.tr);
        return Future.error({'code': 2, 'message': 'Loi'});
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error({'code': 2, 'message': 'Loi'});
    }
    return await Geolocator.getCurrentPosition();
  }

  onPressSearch() {
    print('object');
  }
  onPressNext(){
    Get.back();
    Get.find<StateMainController>().selectedIndex.value=1;
  }
  Future<String> getAddressFromLocation(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks.first;
        String address = "${placemark.street}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.country}";
        Get.find<AppControleer>().address=address;
        return address;
      }
    } catch (e) {
      print("Error: $e");
    }
    return "";
  }
  // onChangedSearch(String text) {
  //   listPredictionSuggestSearch.value = [];
  //
  //   if (text.isEmpty) {
  //     return;
  //   }
  //
  //   if (textEditingControllerSearch.value.text.isEmpty) {
  //     showClearButton.value = false;
  //   } else {
  //     showClearButton.value = true;
  //   }
  //
  //   EasyDebounce.debounce(
  //     'debouncer-autocomplete-to',
  //     const Duration(milliseconds: 800),
  //         () async {
  //       PlacesAutocompleteResponse response =
  //       await GoogleMapsPlaces(apiKey: AppConstant.keyGoogleMap)
  //           .autocomplete(text);
  //       listPredictionSuggestSearch.value = response.predictions;
  //     },
  //   );
  // }
  // Future<List<Prediction>> searchLocation(BuildContext context, String text) async {
  //   if(text != null && text.isNotEmpty) {
  //     http.Response response = await getLocationData(text);
  //     var data = jsonDecode(response.body.toString());
  //     print("my status is "+data["status"]);
  //     if ( data['status']== 'OK') {
  //       _predictionList = [];
  //       data['predictions'].forEach((prediction)
  //       => _predictionList.add(Prediction.fromJson(prediction)));
  //     } else {
  //       // ApiChecker.checkApi(response);
  //     }
  //   }
  //   return _predictionList;
  // }
  onPressMyLocation() async {
    try {
      Position? myLocation = await Geolocator.getLastKnownPosition();
      if (myLocation != null) {
        final GoogleMapController gmc = await googleMapController.future;
        gmc.animateCamera(CameraUpdate.newLatLng(
            LatLng(myLocation.latitude, myLocation.longitude)));
      }
    } catch (e) {}
  }
    double calculateDistance(Position startLocation) {
    double distanceInMeters = Geolocator.distanceBetween(
      shopLocation.latitude,
      shopLocation.longitude,
      startLocation.latitude,
      startLocation.longitude,
    );

    // Đổi khoảng cách từ mét sang kilomet
    double distanceInKilometers = distanceInMeters / 1000;

    return double.parse(distanceInKilometers.toStringAsFixed(2));
  }


}


