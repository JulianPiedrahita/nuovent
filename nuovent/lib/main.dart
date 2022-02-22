import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nuovent/screens/screens.dart';
import 'package:nuovent/services/services.dart';



void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() ),
        ChangeNotifierProvider(create: ( _ ) => ProductsService() ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nuovent',
      initialRoute: 'checking',
      routes: {
        'home' :    ( _ ) => HomeScreen(),
        'login':    ( _ ) => LoginScreen(),
        'product':  ( _ ) => ProductScreen(),
        'register': ( _ ) => RegisterScreen(),
        'checking': ( _ ) => CheckAuthScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[150],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.blue
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}