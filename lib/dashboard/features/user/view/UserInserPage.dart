import 'dart:developer';

import 'package:dashboard2/core/SqlDB.dart';
import 'package:dashboard2/dashboard/controller/DashController.dart';
import 'package:dashboard2/dashboard/features/user/controller/UserCubit.dart';
import 'package:dashboard2/dashboard/features/user/controller/UserState.dart';
import 'package:dashboard2/dashboard/features/user/model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInsertPage extends StatelessWidget {
    UserInsertPage({Key? key}) : super(key: key);

    // Controllers for form fields
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _ageController = TextEditingController();
    final TextEditingController _gradeController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return BlocProvider(
            create: (context) => UserCubit(),
            child: BlocListener<UserCubit, UserState>(
                listener: (context, state) {
                    if ((state is UserLoaded)&&(state is UserEmpty)) {
                        // Show success message
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('User data inserted successfully'))
                        );
                        Navigator.pop(context);
                    } else if (state is UserError) {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error inserting data'))
                        );
                    }
                    else if (state is UserLoading) {

                    }
                },
                child: Scaffold(
                    appBar: AppBar(title: Text('Insert User Data')),
                    body: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            children: [
                                TextField(
                                    controller: _nameController,
                                    decoration: InputDecoration(labelText: 'Name'),
                                ),
                                TextField(
                                    controller: _ageController,
                                    decoration: InputDecoration(labelText: 'Age'),
                                    keyboardType: TextInputType.number,
                                ),
                                TextField(
                                    controller: _gradeController,
                                    decoration: InputDecoration(labelText: 'Grade'),
                                ),
                                SizedBox(height: 16),
                                ElevatedButton(
                                    onPressed: () async {
                                        String name = _nameController.text;
                                        final int? age = int.tryParse(_ageController.text); // Use `int.tryParse` for age
                                        final String grade = _gradeController.text;
                                        SqlDB obj=SqlDB();
                                            String sql = 'INSERT INTO User ( name, age, grade) VALUES ("$name",$age,"$grade")';
                                        obj.insertData(sql);
                                        print("addedd Done");
                                        print(name);
                                        
                                        Navigator.pop(context);
                                        
                                       log("message");

                                    },
                                    child: Text('Submit'),
                                ),

                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}
