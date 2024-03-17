import 'package:task_test/data/network/api_request.dart';
import 'package:task_test/data/network/endpoints.dart';
import 'package:task_test/domain/model/user_model.dart';

class UserRepository {
  static final ApiRequest _request = ApiRequest.init();

  Future<List<User>?> getAllUsers() async {
    var response = await _request.request(
      EndPoints.getAllUsers,
    );
    List<User> usersList = [];
    if (response != null) {
      for (var v in response.data) {
        usersList.add(User.fromJson(v));
      }
      return usersList;
    }
    return null;
  }
}
