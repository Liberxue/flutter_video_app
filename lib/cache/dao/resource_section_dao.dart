//cache/dao/resource_section_dao.dart

import 'package:ciying/cache/entity/resource_section.dart';
import 'package:floor/floor.dart';

@dao
abstract class ResourceSectionDao {
  @Query('SELECT * FROM ResourceSection')
  Future<List<ResourceSection>> findAllResourceSection();

  @Query('SELECT * FROM ResourceSection WHERE resourceId = :resourceId')
  Stream<ResourceSection> findPersonById(String resourceId);

  @insert
  Future<void> insertResourceSection(ResourceSection resourceSection);

  @insert
  Future<void> insertResourceSections(List<ResourceSection> resourceSections);

  @update
  Future<void> updateResourceSection(ResourceSection resourceSection);

  @update
  Future<void> updateResourceSections(List<ResourceSection> resourceSections);

  @delete
  Future<void> deleteResourceSection(ResourceSection resourceSection);

  @delete
  Future<void> deleteResourceSections(List<ResourceSection> resourceSections);
}
