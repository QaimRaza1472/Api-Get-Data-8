import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_api_data_8/Views/profile_card.dart';
import '../Controller/profile_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Testing"),
      ),
      body: Obx(() {
        if (profileController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: profileController.dataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ProfileCard(profileController.dataList[index]),
                );
              });
        }
      }),
    );
  }
}
