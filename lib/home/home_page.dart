import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx_g9/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var homeController = Get.find<HomeController>();

    return Obx(
        () => Scaffold(
          body: homeController.isLoading.value ?ListView.builder(
            itemCount: homeController.postList.length,
            itemBuilder: (_, index){
              return Card(
                child: ListTile(
                  title: Text(homeController.postList[index].title),
                  subtitle: Text(homeController.postList[index].body),
                ),
              );
            },
          ):const Center(
            child: CircularProgressIndicator(),
          ),
        ),
    );
  }
}
