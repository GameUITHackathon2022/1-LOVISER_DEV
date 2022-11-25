import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uit_hackathon/features/authentication/services/auth_services.dart';
import 'package:uit_hackathon/providers/user_provider.dart';
import 'package:uit_hackathon/route.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authService = AuthServices();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    print(user.name);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uit Hackathon',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      routes: routes,
      onGenerateRoute: generateRoutes,
      home: Scaffold(),
    );
  }
}
