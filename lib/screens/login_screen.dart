import 'package:examen_final_guevara_rec/preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedUser();
  }

  Future<void> _loadSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedUser = prefs.getBool('rememberMe');
    if (savedUser == true) {
      _userController.text = prefs.getString('nombre')!;
      setState(() {
        _rememberMe = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            Row(
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                      Preferences.rememberMe = value!;
                    });
                  },
                ),
                Text("Recordar usuario")
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String username = _userController.text.trim();
                String password = _passController.text.trim();
                Navigator.pushNamed(context, 'home');
                /*bool success = await authProvider.login(username, password, _rememberMe);
                if (success) {
                  await _saveUser(username);
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Credenciales incorrectas")),
                  );
                }
                */
              },
              child: Text("Iniciar sesión"),
            ),
          ],
        ),
      ),
    );
  }
}