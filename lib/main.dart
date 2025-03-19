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

  // This widget is the root of your application.
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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

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

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(controller: nameController,),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(controller: emailController,),
            ),
            BlocBuilder<UserBloc, UsersState>(builder: (context, state) =>  Text(
              state.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserBloc>().add( NextUserEvent(name: nameController.text.toString(), email: emailController.text.toString()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
