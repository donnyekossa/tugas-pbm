import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool logorreg = true;
  List accountlist = [];

  bool login() {
    if (email.text.length > 0 && password.text.length > 0) {
      for (var i in accountlist) {
        if (i[0] == email.text && i[1] == password.text) {
          return true;
        }
      }
    }
    return false;
  }

  bool register() {
    if (email.text.length > 0 && password.text.length > 0) {
      for (var i in accountlist) {
        if (i[0] == email.text) {
          return false;
        }
      }
      accountlist.add([email.text, password.text]);
      return true;
    }
    return false;
  }

  final email = TextEditingController();

  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              logorreg == true
                  ? 'Sign in to BMI Calculator App'
                  : 'Register to BMI Calculator App',
              style: TextStyle(color: Colors.white, fontSize: 40),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 100,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                'Email',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(60),
                    ),
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white24),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(60),
                    ),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.white24),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: logorreg == true
                  ? () {
                      final result = login();
                      if (result == true) {
                        Navigator.pushReplacementNamed(context, '/home',
                            arguments: email.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Something went wrong')));
                      }
                    }
                  : () {
                      final result = register();

                      if (result == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Success')));
                        setState(() {
                          logorreg = !logorreg;
                          email.clear();
                          password.clear();
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Something went wrong')));
                      }
                    },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(60)),
                width: double.infinity,
                child: Text(
                  logorreg == true ? 'Sign in ' : 'Register',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    logorreg = !logorreg;
                  });
                },
                child: Text(
                  logorreg == true ? 'Register' : 'Sign in',
                  style: const TextStyle(color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
