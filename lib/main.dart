import 'package:eduqhub_test/app/app_module.dart';
import 'package:eduqhub_test/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  Modular.to.addListener(() {
    debugPrint(Modular.to.path);
  });
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
