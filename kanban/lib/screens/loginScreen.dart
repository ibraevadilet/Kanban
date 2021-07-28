import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanban/screens/listScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  String valueUsername = 'armada';
  String valuePassword = 'FSH6zBZ0p9yH';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text("Kanban"),
        ),
        body: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildUsername(),
                const SizedBox(height: 16),
                buildPassword(),
                const SizedBox(height: 32),
                buildSubmit(),
              ],
            ),
          ),
        ),
      );

  Widget buildUsername() => TextFormField(
        toolbarOptions:
            ToolbarOptions(paste: true, cut: true, selectAll: true, copy: true),
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'Enter your username',
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          errorStyle: TextStyle(color: Colors.red),
        ),
        validator: (value) {
          if (value!.length < 4) {
            return 'Minimum is 4 characters';
          } else {
            return null;
          }
        },
        onChanged: (values) => setState(() => username = values),
      );

  Widget buildPassword() => TextFormField(
        toolbarOptions:
            ToolbarOptions(copy: true, paste: true, cut: true, selectAll: true),
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'Enter your password',
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        validator: (value) {
          if (value!.length < 8) {
            return 'Minimum is 8 characters';
          } else {
            return null;
          }
        },
        onChanged: (value) => setState(() => password = value),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      );

  Widget buildSubmit() => Builder(
      builder: (context) => InkWell(
            onTap: () {
              if (valueUsername == username || valuePassword == password) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListScreen()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Введен неправильный логин или пароль'),
                  duration: const Duration(seconds: 5),
                  action: SnackBarAction(
                    label: 'Повторить заново',
                    onPressed: () {},
                  ),
                ));
              }
            },
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: 900,
              decoration: BoxDecoration(
                  color: Colors.greenAccent[400],
                  borderRadius: BorderRadius.circular(40)),
              child: Text(
                "Log in",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ));
}
