import 'package:block_app/user_bloc.dart';
import 'package:block_app/user_events.dart';
import 'package:block_app/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:BlocProvider(create: (context) =>  UserBloc(),child:  MyHomePage(title: 'Flutter Demo Home Page'),),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var nameController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            TextField(controller: nameController, decoration: InputDecoration(hintText: "Enter name"),),
            TextField(controller: emailController, decoration: InputDecoration(hintText: "Enter email"),),
            BlocBuilder<UserBloc, UsersState>(builder: (context, state) =>  Text(
              ' name ${state.name} and email  ${state.email}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserBloc>().add( NextUserEvent(nameController.text.toString(), emailController.text.toString()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
