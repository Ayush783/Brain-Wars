import 'package:brain_wars/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = ChangeNotifierProvider((ref) => UserNotifier());

class UserNotifier extends ChangeNotifier {
  Usermodel? _user;

  Usermodel get user => _user!;

  getData(Map<String, dynamic> data) {
    _user = Usermodel.fromJson(data);
    notifyListeners();
  }
}
