import 'package:dashboard2/dashboard/features/home/view/HomePage.dart';
import 'package:dashboard2/dashboard/features/user/view/UserInserPage.dart';
import 'package:dashboard2/dashboard/features/user/view/UserPage.dart';
import 'package:dashboard2/dashboard/view/pages/dashPage.dart';
import 'package:flutter/material.dart';

class Routes{
  static const  String initialRoute='/dashboard'; 
  static  Map<String, WidgetBuilder> route = {
    '/dashboard': (context) =>  DashPage(),
    '/UserInsertPage':(context)=>UserInsertPage(),
    "/UserPage":(_)=>UserPage(),
    "/Services":(_)=>HomePage(),

    
  };
}