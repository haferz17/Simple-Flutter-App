import 'package:flutter/material.dart';
import 'package:test_flutter/home.dart';

class Auth extends StatefulWidget {
  final page;
  const Auth({Key? key, this.page}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    bool isLogin = widget.page == 'Login';

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              'https://dbaeumer.gallerycdn.vsassets.io/extensions/dbaeumer/vscode-eslint/2.2.3/1642067257652/Microsoft.VisualStudio.Services.Icons.Default',
              width: width,
            ),
          ),
          Container(
            child: Column(
              children: [
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 40),
                  child: TextField(
                    controller: password,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
          ),
          ElevatedButton(
            onPressed: () {
              if (email.text == 'abc' && password.text == '123') {
                print(email.text);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              }
            },
            child: Text(
              widget.page,
              style: const TextStyle(color: Colors.white, fontSize: 23),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.fromLTRB(50, 18, 50, 18),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isLogin
                  ? 'Doesnt have an account?'
                  : 'Already have an account?'),
              TextButton(
                onPressed: () {
                  if (isLogin) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Auth(page: 'Register'),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text(isLogin ? 'Register' : 'Login'),
              )
            ],
          )
        ],
      ),
    );
  }
}
