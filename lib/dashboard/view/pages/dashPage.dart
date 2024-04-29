import 'package:dashboard2/dashboard/controller/DashController.dart';
import 'package:dashboard2/dashboard/controller/DashStatement.dart';
import 'package:dashboard2/dashboard/features/user/view/UserPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashPage extends StatelessWidget {
  //const DashPage({super.key});
List<String> titles=["home","user","service"];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashController(),
      child: BlocBuilder<DashController, DashStatement>(
        builder: (context, state) {
          DashController controller=context.read<DashController>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              title: Text(
                titles[controller.selectedTapIndex]
              ),
              actions: [IconButton(onPressed: (){
                Navigator.pushNamed(context,"/UserInsertPage"  );
              }, icon: Icon(CupertinoIcons.add))],
            ),
            body: PageView(
              // controller class in folder
              controller: controller.pageController,
              onPageChanged:controller. onChangeTap,

              children: const [Text("home"),UserPage(), Text("services")],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedTapIndex,
              onTap: controller.onChangeIndex,

              unselectedItemColor: Colors.green,
              showSelectedLabels: true,
              unselectedLabelStyle:
                  const TextStyle(fontSize: 15, color: Colors.blueAccent),

              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "user"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), label: "services")
              ],
            ),
          );
        },
      ),
    );
  }
}
