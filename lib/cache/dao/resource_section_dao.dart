//cache/dao/resource_section_dao.dart

import 'package:ciying/cache/entity/resource_section.dart';
import 'package:floor/floor.dart';

@dao
abstract class ResourceSectionDao {
  @Query('SELECT * FROM ResourceSection')
  Future<List<ResourceSection>> findAllResourceSection();

  @Query('SELECT * FROM ResourceSection WHERE resourceId = :resourceId')
  Stream<ResourceSection> findResourceSectionById(String resourceId);

  @Query('DELETE FROM ResourceSection')
  Future<void> deleteAllResourceSection(); // query without returning an entity

  @Query(
      'SELECT * FROM ResourceSection WHERE resourceId = :resourceId AND name = :name')
  Future<ResourceSection> findResourceSectionByIdAndName(
      String resourceId, String name);

  @Query('SELECT * FROM ResourceSection WHERE resourceId IN (:resourceIds)')
  Future<List<ResourceSection>> findResourceSectionsWithIds(
      List<String> resourceIds); // query with IN resourceIds

  @Query('SELECT * FROM ResourceSection WHERE name LIKE :name')
  Future<List<ResourceSection>> findResourceSectionsWithNamesLike(String name);

  @Query('SELECT * FROM ResourceSection WHERE isFavorite = :isFavorite')
  Future<List<ResourceSection>> findResourceSectionsByIsFavorite(
      bool isFavorite);

  @Query('SELECT * FROM ResourceSection WHERE isDownload = :isDownload')
  Future<List<ResourceSection>> findResourceSectionsByIsDownload(
      bool isDownload);

  @Query('SELECT * FROM ResourceSection WHERE duration = :duration')
  Future<List<ResourceSection>> findResourceSectionsByDuration(String duration);

  @Query('SELECT * FROM ResourceSection WHERE emotionCode IN ():emotionCode)')
  Future<List<ResourceSection>> findResourceSectionsByEmotionCode(
      List<int> emotionCodes);

  // @Query('SELECT * FROM ResourceSection WHERE emotionCode IN ():emotionCode)')
  // Future<List<ResourceSection>> findResourceSectionsByEmotionCode();

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
