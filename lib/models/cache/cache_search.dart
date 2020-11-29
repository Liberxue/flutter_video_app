import 'package:ciying/cache/database.dart';
import 'package:ciying/cache/entity/resource_section.dart';

Future<void> CacheDb() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final resourceSectionDao = database.resourceSectionDao;

//   final resourceSection = CacheResourceSection(
//     "resourceId",
//     0.1,
//     "sourceName",
//     1,
//     "resourceAddress",
//     "sourceId",
//     true,
//     false,
//     "name",
//     "resourceAddressCachePath",
//   );
//   await resourceSectionDao.insertResourceSection(resourceSection);

//   final result = await resourceSectionDao.findAllResourceSection();
//   List<CacheResourceSection> resourceSectionData = result;
//   print(resourceSectionData);
// }

// single
// batch
}
