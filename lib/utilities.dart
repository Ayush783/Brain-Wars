import 'package:brain_wars/providers/toggle_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Utility {
  toggleSigninform(BuildContext context) {
    context.read(toggleForm).toggle();
  }
}
