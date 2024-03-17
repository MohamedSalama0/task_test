import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_test/domain/model/user_model.dart';
import 'package:task_test/domain/repository/user_repository.dart';
final userProvider = ChangeNotifierProvider((ref) => UserProvider());

class UserProvider extends ChangeNotifier {
  List<User> userList = [];
  bool userLoader = false;
  getAllUsers() async {
    userLoader = true;
    var response = await UserRepository().getAllUsers();

    if (response != null) {
      userList = response;
      userLoader = false;
      notifyListeners();
    }
    userLoader = false;
    notifyListeners();
    return null;
  }

  deleteUser(int id) {
    if (userList.isNotEmpty) {
      userList.removeWhere((item) =>item.id == id ,);
      notifyListeners();
    }
  }
}
