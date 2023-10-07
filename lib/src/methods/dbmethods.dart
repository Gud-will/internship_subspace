/*
Need to sort an error
insert is not working properly
*/

/*
if need can make a local storage using isar package which is much faster and lighter than sqlite
*/
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';

// class DatabaseHelper {
//   static const _databaseName = "Blogs.db";
//   static const _databaseVersion = 1;

//   static const table = 'BlogData';

//   static const columnId = 'id';
//   static const columnImageUrl = 'imageUrl';
//   static const columnTitle = 'title';

//   late Database _db;

//   // this opens the database (and creates it if it doesn't exist)
//   Future<void> init() async {
//     final documentsDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentsDirectory.path, _databaseName);
//     if(await databaseExists(path)){
//       deleteDatabase(path);
//     }
//     _db = await openDatabase(
//       path,
//       version: _databaseVersion,
//       onCreate: _onCreate,
//     );
//   }

//   // SQL code to create the database table
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//           CREATE TABLE $table (
//             $columnId TEXT PRIMARY KEY,
//             $columnImageUrl TEXT NOT NULL,
//             $columnTitle TEXT NOT NULL
//           )
//           ''');
//   }

//   Future<int> insert(Map<String, dynamic> row) async {
//     return await _db.insert(table, row);
//   }

//   Future<List<Map<String, dynamic>>> queryAllRows() async {
//     return await _db.query(table);
//   }

//   Future<int> queryRowCount() async {
//     final results = await _db.rawQuery('SELECT COUNT(*) FROM $table');
//     return Sqflite.firstIntValue(results) ?? 0;
//   }

//   Future<int> update(Map<String, dynamic> row) async {
//     int id = row[columnId];
//     return await _db.update(
//       table,
//       row,
//       where: '$columnId = ?',
//       whereArgs: [id],
//     );
//   }

//   Future<int> delete(int id) async {
//     return await _db.delete(
//       table,
//       where: '$columnId = ?',
//       whereArgs: [id],
//     );
//   }
// }