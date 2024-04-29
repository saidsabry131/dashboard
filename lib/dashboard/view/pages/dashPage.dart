import 'package:dashboard2/dashboard/controller/DashController.dart';
import 'package:dashboard2/dashboard/controller/DashStatement.dart';
import 'package:dashboard2/dashboard/features/home/view/HomePage.dart';
import 'package:dashboard2/dashboard/features/user/view/UserPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashPage extends StatelessWidget {
  // Define titles for each page
  List<String> titles = ["Home", "User", "Service", "Notifications"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashController(),
      child: BlocBuilder<DashController, DashStatement>(
        builder: (context, state) {
          DashController controller = context.read<DashController>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              title: Text(
                titles[controller.selectedTapIndex],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/UserInsertPage");
                  },
                  icon: Icon(CupertinoIcons.add),
                ),
              ],
            ),
            body: PageView(
              // Use the controller for page control
              controller: controller.pageController,
              onPageChanged: controller.onChangeTap,
              children: [HomePage(), UserPage(), Text("Service"), Text("Notifications")],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedTapIndex,
              onTap: controller.onChangeIndex,
              // Customize the colors and text styles
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: TextStyle(fontSize: 14, color: Colors.blue),
              unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "User",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: "Service",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: "Notifications",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
