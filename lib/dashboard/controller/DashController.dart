import 'package:bloc/bloc.dart';
import 'package:dashboard2/dashboard/controller/DashStatement.dart';
import 'package:dashboard2/dashboard/features/home/view/HomePage.dart';
import 'package:dashboard2/dashboard/features/user/view/UserPage.dart';
import 'package:dashboard2/read.dart';
import 'package:flutter/material.dart';

class DashController extends Cubit<DashStatement>{
  // initial state
  DashController():super(DashChnageState());

  int selectedTapIndex=0;

  final PageController pageController=PageController();

  Widget currentPage() {
    switch (selectedTapIndex) {
      case 0:
        return HomePage();
      case 1:
        return UserPage();
      case 2:
        return UserPage();
      case 3:
        return UserPage();
      case 4:
        return REAd();
      default:
        return REAd(); // Default case
    }
  }

    get onChangeTap => (int index) {
    // Update the selected tab index
    selectedTapIndex = index;
    // Jump to the selected page
    pageController.jumpToPage(selectedTapIndex);
    // Emit a state to notify the change
    emit(DashTabChangeState(selectedTapIndex));
  };


  void onChangeIndex(int index)
  {
    selectedTapIndex =index;
    pageController.jumpToPage(selectedTapIndex);
    emit(DashChnageState as DashStatement);
  }

  //   void onItemTapped(int index) {
  //   emit(index as DashStatement);
  //   pageController.animateToPage(
  //     index,
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }
}