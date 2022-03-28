import 'package:get/get.dart';

import 'package:get_api_data_8/Models/profile.dart';
import '../Services/services.dart';

class ProfileController extends GetxController {
  var isLoading = true.obs;
  var dataList = <DumyModel>[].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }



  void getData() async {
    try {
      isLoading(true);

      var profileData = await Api_Manager.getData();
      if (profileData != null) {
        dataList.value = profileData;
      }
    } finally {
      isLoading(false);
      // TODO
    }
  }
}
