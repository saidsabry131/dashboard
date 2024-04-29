import 'package:dashboard2/core/SqlDB.dart';
import 'package:dashboard2/dashboard/features/user/model/UserModel.dart';
import 'package:dashboard2/dashboard/features/user/model/repo/SuperClass.dart';

class LocalDatabase extends SuperClass {
    static String? dbname;
    static LocalDatabase? _LocalDatabaseObject;
    SqlDB? _sqlObject;

    // Constructor to initialize the SqlDB instance
    LocalDatabase._init() {
        if (dbname != null) {
            _sqlObject = SqlDB();
        }
    }

    // Static getter to create or retrieve the instance
    static LocalDatabase get instance {
        _LocalDatabaseObject ??= LocalDatabase._init();
        return _LocalDatabaseObject!;
    }

    // Method to insert data
    @override
    Future<void> insertData({required int id, required String name, required String grade, required int age}) async {
        String sql = 'INSERT INTO User (id, name, grade, age) VALUES ($id, "$name", "$grade", $age)';
        List<dynamic> values = [id, name, grade, age];
        
        // Use the insertDataWithParams method from SqlDB
        int result = await _sqlObject!.insertData(sql);
        
        if (result == 0) {
            throw Exception('Failed to insert data');
        }
    }

    // Method to insert data with parameterized SQL
    Future<int?> insertDataWithParams(String sql, List<dynamic> values) async {
        return await _sqlObject?.insertDataWithParams(sql, values);
    }

    // Method to delete data by ID
    @override
    Future<void> deleteData({required int id}) async {
        String sql = 'DELETE FROM User WHERE id = ?';
        List<dynamic> values = [id];
        
        int result = 0;
        
        if (result == 0) {
            throw Exception('Failed to delete data');
        }
    }


     Future<List<UserModel>> fetchData() async {
        
        List<UserModel> userList = [];

        // Define the SQL query to fetch data from the 'student' table
        String sql = 'SELECT * FROM User';

        // Fetch the data from the database
        try {
            List<Map<String, dynamic>>? result = await _sqlObject?.readData(sql);

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
