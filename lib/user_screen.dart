
import 'package:block_app/user_api_bloc.dart';
import 'package:block_app/user_api_events.dart';
import 'package:block_app/user_api_state.dart';
import 'package:block_app/user_details/user_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  void initState() {
    context.read<UserApiBloc>().add(GetUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserApiBloc, UserApiState>(builder: (context, state) {

        if(state is UserApiLoadingState) return Center(child: CircularProgressIndicator(),);
        else if(state is UserApiErrorState) return Text(state.error);
        else if(state is UserApiLoadedState){
          var data = state.users;
          if(data.isEmpty) return Text("No user");
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
            return InkWell(
                 onTap:() {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => BlocProvider.value(
                         value: BlocProvider.of<UserApiBloc>(context),
                         child: UserDetailsScreen(user: data[index],),
                       ),
                     ),
                   );

                   // Navigator.of(context).push( MaterialPageRoute(builder: (context) => UserDetailsScreen(user: data[index],),));
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsScreen(user: data[index],),));
                 },
                child: ListTile(leading: Icon(CupertinoIcons.person), title: Text(data[index]["name"]),));
          },);
        }

        return Container();
      },),
    );
  }
}
