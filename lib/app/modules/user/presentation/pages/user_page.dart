import 'package:eduqhub_test/app/modules/user/presentation/pages/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Eduqhub ")),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(
          top: 50,
          left: 30,
          right: 30,
          bottom: 200,
        ),
        itemCount: 3,
        itemBuilder: (_, index) {
          return UserTile(
            onTap: (() => Modular.to.pushNamed('./edit/100')),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}
