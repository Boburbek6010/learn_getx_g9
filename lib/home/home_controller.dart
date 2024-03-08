import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:learn_getx_g9/services/network_service.dart';

import '../models/post_model.dart';

class HomeController extends GetxController{


  TextEditingController controller = TextEditingController();

  RxList<Post> postList = <Post>[].obs;
  RxBool isLoading = false.obs;

  Future<void> fetchData()async{
    isLoading.value = false;
    var result = await NetworkService.getData(NetworkService.apiGetAllPosts, NetworkService.paramEmpty());
    if(result != null){
      postList.value = NetworkService.parsePostList(result);
      isLoading.value = true;
    }
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

}