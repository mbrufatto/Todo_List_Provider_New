import 'package:sqflite/sqflite.dart';

import 'migration.dart';

class MigrationV2 implements Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
      ALTER TABLE todo
      ADD COLUMN id_usuario VARCHAR;
      )
    ''');
  }

  @override
  void update(Batch batch) {
    batch.execute('''
      ALTER TABLE todo
      ADD COLUMN id_usuario VARCHAR;
      )
    ''');
  }
}
