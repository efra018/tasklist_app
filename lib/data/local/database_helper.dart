import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasklist_app/data/models/task_model.dart';

class DatabaseHelper {
  // Variable estatica que almacenará una referencia a la base de datos una vez que se abra.
  static Database? _database;
  // El nombre de la tabla en la base de datos.
  static const String _tableName = 'task';

  /// Este método es un getter asíncrono que devuelve una instancia de la base de datos.
  /// Si _database ya tiene una referencia a la base de datos abierta, la devuelve.
  /// si no, llama al método _initDatabase para inicializar la bd y luego la devuelve.
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  /// Método que inicializa la bd de SQLite
  /// Primero obtiene el directorio de la base de datos utilizando getDatabasesPath() de la bilioteca path.
  /// Utiliza la funcion openDatabase() para abrir la bd Sqlite en la tura especificada.
  /// La ruta de la bd se especifica como la concatenacion del directorio de la bd y el nombre de la bd.
  /// openDatabase(join(path, 'nombre_bd'))
  /// Finalmente, abre la bd en la ruta especificada y llama al método _onCreate si la bd aun no existe
  /// Este metodo se llama cuando se crea la bd por primera vez.
  /// Ejectura una sentencia SQL para crear la tabla con sus columnas.
  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, 'task_database.db'),
      onCreate: (db, version) {
        return db.execute(
          '''
        CREATE TABLE $_tableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          userName TEXT,
          task TEXT,
          isCompleted INTEGER
        )
        ''',
        );
      },
      version: 1,
    );
  }

  // METODOS CRUD

  // Toma un mapa de datos de la tarea y lo inserta en la tabla de tareas de la bd
  Future<int> insertTask(Map<String, dynamic> task) async {
    final db = await database;
    return db.insert(_tableName, task);
  }

  // Obtiene todas las tareas almacenadas en la bd y las devuelve como una lista de mapas de datos.
  Future<List<Task>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> taskMaps = await db.query(_tableName);
    return List.generate(taskMaps.length, (index) {
      return Task(
        id: taskMaps[index]['id'],
        task: taskMaps[index]['name'],
        isCompleted: taskMaps[index]['isCompleted'] == 1,
      );
    });
  }

  Future<int> delete(int id) async {
    final db = await database;
    return db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }
}
