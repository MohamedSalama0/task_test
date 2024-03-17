import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_test/presentaion/screens/user/controller/user_provider.dart';
import 'package:task_test/presentaion/screens/user/view/user_details_screen.dart';
import 'package:task_test/utils/size_config.dart';

class UsersScreen extends ConsumerStatefulWidget {
  const UsersScreen({super.key});

  @override
  ConsumerState<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends ConsumerState<UsersScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(userProvider).getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final data = ref.watch(userProvider);
          return data.userLoader
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.userList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDetailsScreen(
                                  user: data.userList[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.grey,
                            padding: const EdgeInsets.all(10),
                            // height: sizedH(context) * 0.15,
                            // width: sizedW(context) * 0.20,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(data.userList[index].name!),
                                Text(data.userList[index].birthDate!),
                                Text(data.userList[index].gender!.toString()),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
