import 'package:block_app/user_api_bloc.dart';
import 'package:block_app/user_details/user_firebase_bloc.dart';
import 'package:block_app/user_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<UserApiBloc>(create: (context) => UserApiBloc(), ),
      BlocProvider<UserFirebaseBloc>(create: (context) => UserFirebaseBloc(), )

    ], child: MaterialApp(home: UserScreen(),));
  }
}
