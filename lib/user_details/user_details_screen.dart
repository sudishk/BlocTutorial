
import 'package:block_app/user_api_bloc.dart';
import 'package:block_app/user_api_events.dart';
import 'package:block_app/user_api_state.dart';
import 'package:block_app/user_details/user_firebase_bloc.dart';
import 'package:block_app/user_details/user_firebase_events.dart';
import 'package:block_app/user_details/user_firebase_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsScreen extends StatefulWidget {
  final dynamic user;
  const UserDetailsScreen({super.key, required this.user});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {

  @override
  void initState() {
    context.read<UserFirebaseBloc>().add(GetFirebaseUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserFirebaseBloc, UserFirebaseState>(builder: (context, state) {

        if(state is UserFirebaseLoadingState) return Center(child: CircularProgressIndicator(),);
        else if(state is UserFirebaseErrorState) return Text(state.error);
        else if(state is UserFirebaseLoadedState){
          var data = state.users;
          if(data.isEmpty) return Text("No user");
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
            return InkWell(
                 onTap:() {

                 },
                child: ListTile(leading: Icon(CupertinoIcons.person), title: Text(data[index]["name"]),));
          },);
        }

        return Container();
      },),
    );
  }
}
