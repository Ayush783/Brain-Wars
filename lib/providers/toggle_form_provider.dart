import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final toggleForm = ChangeNotifierProvider((ref) => FormNotifier());

class FormNotifier extends ChangeNotifier {
  bool _show = false;
  bool get show => _show;

  toggle() {
    _show = !show;
    notifyListeners();
  }
}
