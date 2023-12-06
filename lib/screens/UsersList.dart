import 'package:flutter/material.dart';
import 'package:texas_real_state/bloc/app_events.dart';
import 'package:texas_real_state/bloc/app_states.dart';
import 'package:texas_real_state/repos/repositories.dart';
import '../bloc/app-bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/ImageViewerListTile.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: RepositoryProvider(
            create: (context) => UserRepository(),
            child: BlocProvider(
              create: (context) => UserBloc(
                RepositoryProvider.of<UserRepository>(context),
              )..add(LoadUserEvent()),
              child:
                  BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                if (state is UserLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is UserLoadedState) {
                  final users = state.users;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Hero(
                          tag: 'tag-1',
                          child: ListTile(
                            trailing: Image.network(
                              users[index].avatar,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(users[index].first_name),
                            subtitle: Text(users[index].last_name),
                            dense: true,
                          ));
                    },
                  );
                } else if (state is UserErrorState) {
                  return Text(state.error);
                } else {
                  return const Text('unknown error');
                }
              }),
            )));
  }
}
