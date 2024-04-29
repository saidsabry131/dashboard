import 'package:dashboard2/core/SqlDB.dart';
import 'package:dashboard2/dashboard/features/user/controller/UserState.dart';
import 'package:dashboard2/dashboard/features/user/model/UserModel.dart';
import 'package:dashboard2/dashboard/features/user/model/repo/LocalDatabase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
    // Initialize with loading state
    UserCubit() : super(UserLoading()) {
        // Fetch data from the database
        fetchData();
    }

    // List of users
    List<UserModel> users = [];

    // Method to fetch data from the database
    Future<void> fetchData() async {
        try {
            // Fetch user data from the local database
            users = await SqlDB.instance.fetchData();

            // Check if the list of users is empty
            if (users.isEmpty) {
                emit(UserEmpty());
            } else {
                // Emit the UserLoaded state with the list of users
                emit(UserLoaded(users));
            }
        } catch (e) {
            // Emit an error state if there is an issue fetching data
            emit(UserError('Failed to fetch data: $e'));
        }
    }

    Future<void> addUser(UserModel user) async {
    // Add the new user to the list
    users.add(user);
    // Emit the UserLoaded state to update the UI with the new list
    emit(UserLoaded(users));
}

    // Method to insert user
    Future<void> insertUser(UserModel user) async {
        try {
            // Prepare the SQL query and values
            String sql = '''
                INSERT INTO User (name, age, grade)
                VALUES (?, ?, ?)
            ''';
            List<dynamic> values = [user.name, user.age, user.grade];

            // Execute the query
            int? result = await SqlDB.instance.insertDataWithParams(sql, values);

            // Check if the insertion was successful
            if (result! > 0) {
                // Add the user to the list and emit UserLoaded state
                users.add(user);
                emit(UserLoaded(users));
            } else {
                emit(UserError('Failed to insert user data'));
            }
        } catch (e) {
            emit(UserError('Failed to insert user data: $e'));
        }
    }
}
