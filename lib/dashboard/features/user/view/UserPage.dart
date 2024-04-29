import 'package:dashboard2/dashboard/features/user/controller/UserCubit.dart';
import 'package:dashboard2/dashboard/features/user/controller/UserState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
    const UserPage({super.key});

    @override
    Widget build(BuildContext context) {
        // Provide the UserCubit to the widget tree
        return BlocProvider(
            create: (context) => UserCubit(),
            child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                    // Handle different states from UserCubit
                    if (state is UserLoading) {
                        // Display a loading indicator while data is loading
                        return const Center(child: CircularProgressIndicator());
                    } else if (state is UserEmpty) {
                        // Display a delete icon when there is no data
                        return const Center(
                            child: Icon(
                                Icons.delete,
                                size: 64, // Adjust the size as desired
                                color: Colors.grey,
                            ),
                        );
                    } else if (state is UserLoaded) {
                        // Display a GridView with user data
                        UserCubit controller = context.read<UserCubit>();
                        return GridView.builder(
                            itemCount: controller.users.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Number of columns in the grid
                                childAspectRatio: 3 / 2, // Aspect ratio of grid items
                                mainAxisSpacing: 10.0, // Vertical spacing between items
                                crossAxisSpacing: 10.0, // Horizontal spacing between items
                            ),
                            itemBuilder: (context, index) {
                                final user = controller.users[index];
                                return Card(
                                    child: Center(child: Text(user.name)),
                                );
                            },
                        );
                    }  else {
                        // Return an empty container if the state doesn't match any known state
                        
                         return const Center(child: CircularProgressIndicator());
                    }
                },
            ),
        );
    }
}
