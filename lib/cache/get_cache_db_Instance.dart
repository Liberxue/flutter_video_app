import 'package:ciying/cache/database.dart';

class getCacheDbInstance {
  getDatabaseInstance() async {
    return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }
}
