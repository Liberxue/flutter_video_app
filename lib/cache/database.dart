// cace/database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/resource_section_dao.dart';
import 'entity/resource_section.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [CacheResourceSection])
abstract class AppDatabase extends FloorDatabase {
  CacheResourceSectionDao get resourceSectionDao;
}
