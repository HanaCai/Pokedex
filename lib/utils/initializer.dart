

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled/new_pokemon_model.dart';
import 'package:untitled/untitled.dart';

class Initializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    await Hive.initFlutter();
    Hive.registerAdapter<NewPokemonModel>(NewPokemonModelAdapter());
    await Hive.openBox<NewPokemonModel>(NewPokemonModel.boxKey);
    // await LocalDatabase.instance.initialize();
    // Get.put(Database(),permanent: true);
    // Get.put(OfflineDataManager());

  }
}
