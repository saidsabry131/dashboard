


import 'package:dashboard2/dashboard/features/user/model/UserModel.dart';

class UserState {}

class UserLoading extends UserState {
  // Represents a loading state; no additional fields needed
}

class UserLoaded extends UserState {
  final List<UserModel> users;

  UserLoaded(this.users);

  // Represents a loaded state with a list of users
}



class UserEmpty extends UserState{}
class UserError extends UserState {
  final String message;

  UserError(this.message);

  // Represents an error state with an error message
}