import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';
part 'tables.dart';

@DriftDatabase(
  tables: [
    Habits, 
    Completions
    ],
  
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

 
}

QueryExecutor _openConnection() {
  return driftDatabase(
    name: 'habits_db.sqlite',
    native: DriftNativeOptions(
      shareAcrossIsolates: false, 
      databasePath: () async {
        final dbFolder = await getApplicationDocumentsDirectory();
        return p.join(dbFolder.path, 'habits_db.sqlite');
      },
    ),
  );
}