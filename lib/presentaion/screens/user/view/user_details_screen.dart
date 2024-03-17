import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_test/domain/model/user_model.dart';
import 'package:task_test/presentaion/screens/user/controller/user_provider.dart';
import 'package:task_test/utils/size_config.dart';

class UserDetailsScreen extends StatefulWidget {
  final User user;
  const UserDetailsScreen({super.key, required this.user});

  @override
  State<UserDetailsScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: sizedH(context) * 0.15,
            width: sizedW(context) * 0.20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.user.name!),
                Text(widget.user.birthDate!),
                Text(widget.user.gender!.toString()),
              ],
            ),
          ),
          SizedBox(
            height: sizedH(context) * 0.10,
          ),
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () {
                  ref.read(userProvider).deleteUser(widget.user.id!);
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(10),
                  child: const Text('delete user'),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
