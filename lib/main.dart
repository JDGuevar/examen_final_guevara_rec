import 'package:examen_final_guevara_rec/preferences.dart';
import 'package:examen_final_guevara_rec/providers/provider.dart';
import 'package:examen_final_guevara_rec/screens/home_screen.dart';
import 'package:examen_final_guevara_rec/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => TrenesProvider()),
  ], child: MyApp()));
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exam Final',
      initialRoute: 'login',
      routes: {
        'home': (_) => HomeScreen(),
        'login': (_) => LoginScreen(),
      },
      theme: ThemeData(
        // No es pot emprar colorPrimary des de l'actualització de Flutter
        colorScheme: ColorScheme.light().copyWith(
          primary: Colors.deepPurple,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}

