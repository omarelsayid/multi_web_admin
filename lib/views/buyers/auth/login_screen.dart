import 'package:flutter/material.dart';
import 'package:multi_web_admin/controller/auth_conroller.dart';
import 'package:multi_web_admin/utils/show_snak_bar.dart';
import 'package:multi_web_admin/views/buyers/auth/register_screen.dart';
import 'package:multi_web_admin/views/buyers/main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;

  late String password;

  final GlobalKey<FormState> _formKey = GlobalKey();

  final AuthController _authController = AuthController();
  bool _isLoading = false;
  _loginUsers() async {
    if (_formKey.currentState!.validate()) {
      String res = await _authController.loginUsers(email, password);
      return Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
        return const MainScreen();
      }));
    } else {
      setState(() {
        _isLoading = true;
      });
      return showSnakBar(context, 'Please feilds must not be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Text(
              'Login custome\'s Account',
              style: TextStyle(fontSize: 20),
            )),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please email filed must not be empty ';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    const InputDecoration(labelText: 'Enter Email Aadress'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please password filed must not be empty ';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {
                  password = value;
                },
                decoration: const InputDecoration(labelText: 'Enter Password'),
              ),
            ),
            InkWell(
              onTap: () {
                _loginUsers();
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.yellow.shade900,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('don\'t Have An Account?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return RigesterScreen();
                        },
                      ));
                    },
                    child: const Text('Rigester'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
