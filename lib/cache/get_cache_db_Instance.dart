import 'package:ciying/cache/database.dart';

// ignore: camel_case_types
class getCacheDbInstance {
  getDatabaseInstance() async {
    return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }
}
