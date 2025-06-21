import 'package:flutter/material.dart';
import 'package:loyalty_challenge/src/common/theme/theme.dart';
import 'package:loyalty_challenge/src/modules/login/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loyalty App',
      theme: theme,
      home: const LoginView(),
    );
  }
}
