import 'package:dashboard2/dashboard/features/user/model/repo/SuperClass.dart';

class FirebaseData extends SuperClass{
  static FirebaseData? _firebaseObject;

  FirebaseData._init();

  static FirebaseData get instance{
    _firebaseObject ??= FirebaseData._init();

      return _firebaseObject!;
  }
  
  @override
  Future<void> deleteData({required int id}) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }
  
  @override
  Future<void> insertData({required int id, required String name, required String grade, required int age}) {
    // TODO: implement insertData
    throw UnimplementedError();
  }
  
  
}