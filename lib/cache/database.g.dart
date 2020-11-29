// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CacheResourceSectionDao _resourceSectionDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CacheResourceSection` (`resourceId` TEXT, `duration` REAL, `sourceName` TEXT, `emotionCode` INTEGER, `resourceAddress` TEXT, `sourceId` TEXT, `isFavorite` INTEGER, `isDownload` INTEGER, `name` TEXT, `searchText` TEXT, `resourceAddressCachePath` TEXT, PRIMARY KEY (`resourceId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CacheResourceSectionDao get resourceSectionDao {
    return _resourceSectionDaoInstance ??=
        _$CacheResourceSectionDao(database, changeListener);
  }
}

class _$CacheResourceSectionDao extends CacheResourceSectionDao {
  _$CacheResourceSectionDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _cacheResourceSectionInsertionAdapter = InsertionAdapter(
            database,
            'CacheResourceSection',
            (CacheResourceSection item) => <String, dynamic>{
                  'resourceId': item.resourceId,
                  'duration': item.duration,
                  'sourceName': item.sourceName,
                  'emotionCode': item.emotionCode,
                  'resourceAddress': item.resourceAddress,
                  'sourceId': item.sourceId,
                  'isFavorite': item.isFavorite == null
                      ? null
                      : (item.isFavorite ? 1 : 0),
                  'isDownload': item.isDownload == null
                      ? null
                      : (item.isDownload ? 1 : 0),
                  'name': item.name,
                  'searchText': item.searchText,
                  'resourceAddressCachePath': item.resourceAddressCachePath
                },
            changeListener),
        _cacheResourceSectionUpdateAdapter = UpdateAdapter(
            database,
            'CacheResourceSection',
            ['resourceId'],
            (CacheResourceSection item) => <String, dynamic>{
                  'resourceId': item.resourceId,
                  'duration': item.duration,
                  'sourceName': item.sourceName,
                  'emotionCode': item.emotionCode,
                  'resourceAddress': item.resourceAddress,
                  'sourceId': item.sourceId,
                  'isFavorite': item.isFavorite == null
                      ? null
                      : (item.isFavorite ? 1 : 0),
                  'isDownload': item.isDownload == null
                      ? null
                      : (item.isDownload ? 1 : 0),
                  'name': item.name,
                  'searchText': item.searchText,
                  'resourceAddressCachePath': item.resourceAddressCachePath
                },
            changeListener),
        _cacheResourceSectionDeletionAdapter = DeletionAdapter(
            database,
            'CacheResourceSection',
            ['resourceId'],
            (CacheResourceSection item) => <String, dynamic>{
                  'resourceId': item.resourceId,
                  'duration': item.duration,
                  'sourceName': item.sourceName,
                  'emotionCode': item.emotionCode,
                  'resourceAddress': item.resourceAddress,
                  'sourceId': item.sourceId,
                  'isFavorite': item.isFavorite == null
                      ? null
                      : (item.isFavorite ? 1 : 0),
                  'isDownload': item.isDownload == null
                      ? null
                      : (item.isDownload ? 1 : 0),
                  'name': item.name,
                  'searchText': item.searchText,
                  'resourceAddressCachePath': item.resourceAddressCachePath
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CacheResourceSection>
      _cacheResourceSectionInsertionAdapter;

  final UpdateAdapter<CacheResourceSection> _cacheResourceSectionUpdateAdapter;

  final DeletionAdapter<CacheResourceSection>
      _cacheResourceSectionDeletionAdapter;

  @override
  Future<List<CacheResourceSection>> findAllResourceSection() async {
    return _queryAdapter.queryList('SELECT * FROM CacheResourceSection',
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Stream<CacheResourceSection> findResourceSectionById(String resourceId) {
    return _queryAdapter.queryStream(
        'SELECT * FROM CacheResourceSection WHERE resourceId = ?',
        arguments: <dynamic>[resourceId],
        queryableName: 'CacheResourceSection',
        isView: false,
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<void> deleteAllResourceSection() async {
    await _queryAdapter.queryNoReturn('DELETE FROM CacheResourceSection');
  }

  @override
  Future<CacheResourceSection> findResourceSectionByIdAndName(
      String resourceId, String name) async {
    return _queryAdapter.query(
        'SELECT * FROM CacheResourceSection WHERE resourceId = ? AND name = ?',
        arguments: <dynamic>[resourceId, name],
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<List<CacheResourceSection>> findResourceSectionsWithIds(
      List<String> resourceIds) async {
    final valueList0 = resourceIds.map((value) => "'$value'").join(', ');
    return _queryAdapter.queryList(
        'SELECT * FROM CacheResourceSection WHERE resourceId IN ($valueList0)',
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<List<CacheResourceSection>> findResourceSectionsWithNamesLike(
      String name) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CacheResourceSection WHERE name LIKE ?',
        arguments: <dynamic>[name],
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<List<CacheResourceSection>> findResourceSectionsByIsFavorite(
      bool isFavorite) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CacheResourceSection WHERE isFavorite = ?',
        arguments: <dynamic>[isFavorite == null ? null : (isFavorite ? 1 : 0)],
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<List<CacheResourceSection>>
      updateIsFavoriteResourceSectionsByResourceId(
          bool isFavorite, String resourceId) async {
    return _queryAdapter.queryList(
        'UPDATE CacheResourceSection SET isFavorite = ? WHERE resourceId = ?',
        arguments: <dynamic>[
          isFavorite == null ? null : (isFavorite ? 1 : 0),
          resourceId
        ],
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<List<CacheResourceSection>>
      updateIsDownloadResourceSectionsByResourceId(bool isDownload,
          String resourceAddressCachePath, String resourceId) async {
    return _queryAdapter.queryList(
        'UPDATE CacheResourceSection SET isDownload = ? AND resourceAddressCachePath = ? WHERE resourceId = ?',
        arguments: <dynamic>[
          isDownload == null ? null : (isDownload ? 1 : 0),
          resourceAddressCachePath,
          resourceId
        ],
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<List<CacheResourceSection>>
      updateDownloadPathResourceSectionsByResourceId(
          String resourceAddressCachePath, String resourceId) async {
    return _queryAdapter.queryList(
        'UPDATE CacheResourceSection SET resourceAddressCachePath=? WHERE resourceId = ?',
        arguments: <dynamic>[resourceAddressCachePath, resourceId],
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<List<CacheResourceSection>> findResourceSectionsByIsDownload(
      bool isDownload) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CacheResourceSection WHERE isDownload = ?',
        arguments: <dynamic>[isDownload == null ? null : (isDownload ? 1 : 0)],
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<List<CacheResourceSection>> findResourceSectionsByDuration(
      String duration) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CacheResourceSection WHERE duration = ?',
        arguments: <dynamic>[duration],
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<List<CacheResourceSection>> findResourceSectionsByEmotionCode(
      List<int> emotionCodes) async {
    final valueList0 = emotionCodes.map((value) => "'$value'").join(', ');
    return _queryAdapter.queryList(
        'SELECT * FROM CacheResourceSection WHERE emotionCode IN ($valueList0)',
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<List<CacheResourceSection>> findResourceSectionsBySearchText(
      String searchText, int limit, int offset) async {
    return _queryAdapter.queryList(
        'SELECT * FROM CacheResourceSection WHERE searchText = ? order by resourceId LIMIT ? OFFSET ?',
        arguments: <dynamic>[searchText, limit, offset],
        mapper: (Map<String, dynamic> row) => CacheResourceSection(
            row['resourceId'] as String,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['searchText'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<void> insertResourceSection(
      CacheResourceSection cacheResourceSection) async {
    await _cacheResourceSectionInsertionAdapter.insert(
        cacheResourceSection, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertResourceSections(
      List<CacheResourceSection> cacheResourceSections) async {
    await _cacheResourceSectionInsertionAdapter.insertList(
        cacheResourceSections, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateResourceSection(
      CacheResourceSection cacheResourceSection) async {
    await _cacheResourceSectionUpdateAdapter.update(
        cacheResourceSection, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateResourceSections(
      List<CacheResourceSection> cacheResourceSections) async {
    await _cacheResourceSectionUpdateAdapter.updateList(
        cacheResourceSections, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteResourceSection(
      CacheResourceSection cacheResourceSection) async {
    await _cacheResourceSectionDeletionAdapter.delete(cacheResourceSection);
  }

  @override
  Future<void> deleteResourceSections(
      List<CacheResourceSection> cacheResourceSections) async {
    await _cacheResourceSectionDeletionAdapter
        .deleteList(cacheResourceSections);
  }
}
