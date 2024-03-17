import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_test/presentaion/screens/user/view/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        
        home: UsersScreen(),
      ),
    );
  }
}
