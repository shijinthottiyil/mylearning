import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/features/home/bloc/home_bloc.dart';
import 'package:mylearning/features/home/model/user_model.dart';
import 'package:mylearning/utils/logic/networking/app_popups.dart';
import 'package:mylearning/utils/logic/networking/repository/app_repository.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeEventDataFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JsonPlaceHolder User"),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeStateLoading) {
            AppPopups.showLoaderDialog(context);
          }
          if (state is HomeStateSuccess) {
            AppPopups.cancelLoaderDialog(context);
          }
          if (state is HomeStateError) {
            AppPopups.cancelLoaderDialog(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('SomeThing WentWrong')));
          }
        },
        builder: (context, state) {
          if (state is HomeStateSuccess) {
            final HomeStateSuccess homeStateSuccess = state as HomeStateSuccess;
            final List<UserModel> userModelList =
                homeStateSuccess.userModelList;
            return ListView.builder(
              itemBuilder: (context, index) {
                final UserModel userModel = userModelList[index];
                return ListTile(
                  title: Text('${userModel.name}'),
                );
              },
              itemCount: userModelList.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
