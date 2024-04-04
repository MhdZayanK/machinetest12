



import 'package:exoro_interview/model/datamodel.dart';
import 'package:exoro_interview/service/service.dart';
import 'package:get/get.dart';


class Datacontroller extends GetxController{
  var datamodels = <DataModel>[].obs;
  getData()async{
    try{
      var data = await DataService().getService();
      if (data !=null){
        datamodels.value = data as List<DataModel>;
      }

    }catch(e){
      Get.snackbar("title", "$e");
    }
  }

  @override
  void onInit(){
    getData();
    super.onInit();
  }

}