// import 'package:untitled/untitled.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:untitled/new_pokemon_model.dart';

class HomeScreenController extends GetxController {
  RxList<NewPokemonModel> pokemon = RxList([]);

  @override
  void onInit() async {
    final box = await Hive.openBox<NewPokemonModel>(NewPokemonModel.boxKey);
    final data = box.toMap();
    data.forEach((key, value) {
      pokemon.add(value);
    });
    // for(var item in data.entries){
    //   pokemon.add(item);
    // }
    super.onInit();
  }

  void saveData(NewPokemonModel model) async {
    final box = await Hive.openBox<NewPokemonModel>(NewPokemonModel.boxKey);
    pokemon.add(model);
    await box.add(model);
    Get.back();
  }
}
