import 'package:eduqhub_test/app/modules/user/presentation/pages/state/user_state.dart';
import 'package:eduqhub_test/app/modules/user/presentation/pages/store/user_store.dart';
import 'package:eduqhub_test/app/modules/user/presentation/pages/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final userStore = Modular.get<UserStore>();

  @override
  void initState() {
    super.initState();
    userStore.stateInitialReaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Eduqhub ")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modular.to.pushNamed('./save'),
        child: const Icon(Icons.person_add),
      ),
      body: Observer(builder: (context) {
        final state = userStore.state;
        if (state is ErrorUserState) {
          return const Center(
            child: Text("Ops ! Alguma coisa deu errada"),
          );
        }
        if (state is SucessUserState) {
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 30,
                    right: 30,
                    bottom: 200,
                  ),
                  itemCount: state.users.length,
                  itemBuilder: (_, index) {
                    final user = state.users[index];
                    return UserTile(
                      user: user,
                      onTap: (() => Modular.to.pushNamed('./edit/100')),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                ),
              ),
            ],
          );
        }

        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
