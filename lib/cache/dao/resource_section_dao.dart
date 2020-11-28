//cache/dao/resource_section_dao.dart

import 'package:ciying/cache/entity/resource_section.dart';
import 'package:floor/floor.dart';

@dao
abstract class CacheResourceSectionDao {
  @Query('SELECT * FROM CacheResourceSection')
  Future<List<CacheResourceSection>> findAllResourceSection();

  @Query('SELECT * FROM CacheResourceSection WHERE resourceId = :resourceId')
  Stream<CacheResourceSection> findResourceSectionById(String resourceId);

  @Query('DELETE FROM CacheResourceSection')
  Future<void> deleteAllResourceSection(); // query without returning an entity

  @Query(
      'SELECT * FROM CacheResourceSection WHERE resourceId = :resourceId AND name = :name')
  Future<CacheResourceSection> findResourceSectionByIdAndName(
      String resourceId, String name);

  @Query(
      'SELECT * FROM CacheResourceSection WHERE resourceId IN (:resourceIds)')
  Future<List<CacheResourceSection>> findResourceSectionsWithIds(
      List<String> resourceIds); // query with IN resourceIds

  @Query('SELECT * FROM CacheResourceSection WHERE name LIKE :name')
  Future<List<CacheResourceSection>> findResourceSectionsWithNamesLike(
      String name);

  @Query('SELECT * FROM CacheResourceSection WHERE isFavorite = :isFavorite')
  Future<List<CacheResourceSection>> findResourceSectionsByIsFavorite(
      bool isFavorite);

  // update isFavorite
  @Query(
      'UPDATE CacheResourceSection SET isFavorite = :isFavorite WHERE resourceId = :resourceId')
  Future<List<CacheResourceSection>>
      updateIsFavoriteResourceSectionsByResourceId(
          bool isFavorite, String resourceId);

// update isDownload
  @Query(
      'UPDATE CacheResourceSection SET isDownload = :isDownload WHERE resourceId = :resourceId')
  Future<List<CacheResourceSection>>
      updateIsDownloadResourceSectionsByResourceId(
          bool isDownload, String resourceId);

// update isDownload cache path
  @Query(
      'UPDATE CacheResourceSection SET resourceAddressCachePath=:resourceAddressCachePath WHERE resourceId = :resourceId')
  Future<List<CacheResourceSection>>
      updateDownloadPathResourceSectionsByResourceId(
          String resourceAddressCachePath, String resourceId);

  //select isDownload
  @Query('SELECT * FROM CacheResourceSection WHERE isDownload = :isDownload')
  Future<List<CacheResourceSection>> findResourceSectionsByIsDownload(
      bool isDownload);

  @Query('SELECT * FROM CacheResourceSection WHERE duration = :duration')
  Future<List<CacheResourceSection>> findResourceSectionsByDuration(
      String duration);

  @Query(
      'SELECT * FROM CacheResourceSection WHERE emotionCode IN ():emotionCode)')
  Future<List<CacheResourceSection>> findResourceSectionsByEmotionCode(
      List<int> emotionCodes);

  // check local cache by searchText;
  @Query('SELECT * FROM CacheResourceSection WHERE searchText = :searchText')
  Future<List<CacheResourceSection>> findResourceSectionsBySearchText(
      String searchText);

  @insert
  Future<void> insertResourceSection(CacheResourceSection cacheResourceSection);

  @insert
  Future<void> insertResourceSections(
      List<CacheResourceSection> cacheResourceSections);

  @update
  Future<void> updateResourceSection(CacheResourceSection cacheResourceSection);

  @update
  Future<void> updateResourceSections(
      List<CacheResourceSection> cacheResourceSections);

  @delete
  Future<void> deleteResourceSection(CacheResourceSection cacheResourceSection);

  @delete
  Future<void> deleteResourceSections(
      List<CacheResourceSection> cacheResourceSections);
}
