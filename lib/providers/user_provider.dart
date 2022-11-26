import 'package:flutter/material.dart';
import 'package:uit_hackathon/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    username: '',
    phoneNumber: '',
    id: '',
    password: '',
    type: '',
    token: '',
    address: '',
  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
