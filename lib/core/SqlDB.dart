import 'package:dashboard2/dashboard/features/user/model/UserModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDB {

    
       static SqlDB? _instance;
    static Database? _db;

    // Singleton getter function
    static SqlDB get instance {
        _instance ??= SqlDB();
        return _instance!;
    }

    // Getter for the database instance
    Future<Database?> get db async {
        if (_db == null) {
            _db = await _initializeDb();
        }
        return _db;
    }

    // Initialize the database and create tables if necessary
    Future<Database> _initializeDb() async {
        String databasePath = await getDatabasesPath();
        String path = join(databasePath, 'myDB.db');
        Database myDb = await openDatabase(path, version: 4, onCreate: _onCreate, onUpgrade: _onUpgrade);
        return myDb;
    }

    // Define how to upgrade the database if the version changes
    Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
        print("Upgrading database from version $oldVersion to $newVersion...");
        // Add upgrade logic here
        // Example: Altering an existing table, adding new columns, etc.
    }

    // Define how to create the database
    Future<void> _onCreate(Database db, int version) async {
        await db.execute("""
            CREATE TABLE User (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT NOT NULL,
                age INTEGER NOT NULL,
                grade TEXT
            )
        """);
        print("Database and User table created successfully");
    }

    // Method to read data from the database
    Future<List<Map<String, dynamic>>> readData(String sql) async {
        Database? myDb = await db;
        List<Map<String, dynamic>> response = await myDb!.rawQuery(sql);
        return response;
    }

    // Method to insert data into the database
    Future<int> insertData(String sql) async {
        Database? myDb = await db;
        int response = await myDb!.rawInsert(sql);
        return response;
    }

    // Method to update data in the database
    Future<int> updateData(String sql) async {
        Database? myDb = await db;
        int response = await myDb!.rawUpdate(sql);
        return response;
    }

    // Method to delete data from the database
    Future<int> deleteData(String sql) async {
        Database? myDb = await db;
        int response = await myDb!.rawDelete(sql);
        return response;
    }

    // Method to insert data with parameters into the database
    Future<int> insertDataWithParams(String sql, List<dynamic> values) async {
        Database? myDb = await db;
        int response = await myDb!.insert('User', {
            'name': values[0],
            'age': values[1],
            'grade': values[2]
        });
        return response;
    }


  Future<List<UserModel>> fetchData() async {
        
        List<UserModel> userList = [];

        // Define the SQL query to fetch data from the 'student' table
        String sql = 'SELECT * FROM User';

        // Fetch the data from the database
        try {
            List<Map<String, dynamic>>? result = await readData(sql);

            // Convert the raw data into UserModel objects
            for (Map<String, dynamic> row in result!) {
                UserModel user=UserModel.fromMap(row);
                
                userList.add(user);
            }

            // Return the list of UserModel objects
            return userList;
        } catch (e) {
            // Handle any errors 
            print('Error fetching data: $e');
            return [];
        }
    }
}
