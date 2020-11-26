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

  ResourceSectionDao _resourceSectionDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `ResourceSection` (`resourceId` INTEGER, `duration` REAL, `sourceName` TEXT, `emotionCode` INTEGER, `resourceAddress` TEXT, `sourceId` TEXT, `isFavorite` INTEGER, `isDownload` INTEGER, `name` TEXT, `resourceAddressCachePath` TEXT, PRIMARY KEY (`resourceId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ResourceSectionDao get resourceSectionDao {
    return _resourceSectionDaoInstance ??=
        _$ResourceSectionDao(database, changeListener);
  }
}

class _$ResourceSectionDao extends ResourceSectionDao {
  _$ResourceSectionDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _resourceSectionInsertionAdapter = InsertionAdapter(
            database,
            'ResourceSection',
            (ResourceSection item) => <String, dynamic>{
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
                  'resourceAddressCachePath': item.resourceAddressCachePath
                },
            changeListener),
        _resourceSectionUpdateAdapter = UpdateAdapter(
            database,
            'ResourceSection',
            ['resourceId'],
            (ResourceSection item) => <String, dynamic>{
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
                  'resourceAddressCachePath': item.resourceAddressCachePath
                },
            changeListener),
        _resourceSectionDeletionAdapter = DeletionAdapter(
            database,
            'ResourceSection',
            ['resourceId'],
            (ResourceSection item) => <String, dynamic>{
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
                  'resourceAddressCachePath': item.resourceAddressCachePath
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ResourceSection> _resourceSectionInsertionAdapter;

  final UpdateAdapter<ResourceSection> _resourceSectionUpdateAdapter;

  final DeletionAdapter<ResourceSection> _resourceSectionDeletionAdapter;

  @override
  Future<List<ResourceSection>> findAllResourceSection() async {
    return _queryAdapter.queryList('SELECT * FROM ResourceSection',
        mapper: (Map<String, dynamic> row) => ResourceSection(
            row['resourceId'] as int,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Stream<ResourceSection> findPersonById(String resourceId) {
    return _queryAdapter.queryStream(
        'SELECT * FROM ResourceSection WHERE resourceId = ?',
        arguments: <dynamic>[resourceId],
        queryableName: 'ResourceSection',
        isView: false,
        mapper: (Map<String, dynamic> row) => ResourceSection(
            row['resourceId'] as int,
            row['duration'] as double,
            row['sourceName'] as String,
            row['emotionCode'] as int,
            row['resourceAddress'] as String,
            row['sourceId'] as String,
            row['isFavorite'] == null ? null : (row['isFavorite'] as int) != 0,
            row['isDownload'] == null ? null : (row['isDownload'] as int) != 0,
            row['name'] as String,
            row['resourceAddressCachePath'] as String));
  }

  @override
  Future<void> insertResourceSection(ResourceSection resourceSection) async {
    await _resourceSectionInsertionAdapter.insert(
        resourceSection, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertResourceSections(
      List<ResourceSection> resourceSections) async {
    await _resourceSectionInsertionAdapter.insertList(
        resourceSections, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateResourceSection(ResourceSection resourceSection) async {
    await _resourceSectionUpdateAdapter.update(
        resourceSection, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateResourceSections(
      List<ResourceSection> resourceSections) async {
    await _resourceSectionUpdateAdapter.updateList(
        resourceSections, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteResourceSection(ResourceSection resourceSection) async {
    await _resourceSectionDeletionAdapter.delete(resourceSection);
  }

  @override
  Future<void> deleteResourceSections(
      List<ResourceSection> resourceSections) async {
    await _resourceSectionDeletionAdapter.deleteList(resourceSections);
  }
}
