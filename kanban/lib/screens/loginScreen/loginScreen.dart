import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/screens/loginScreen/login_bloc/kanban_bloc.dart';
import 'package:kanban/screens/loginScreen/login_bloc/kanban_repository.dart';
import 'package:kanban/screens/secondScreen/bloc/list_bloc.dart';
import 'package:kanban/screens/secondScreen/secondScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen();

  @override
  _LoginScreenState createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final bloc = KanbanBloc(KanbanRepository());
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  String username = '';
  String password = '';
  String valueUsername = 'armada';
  String valuePassword = 'FSH6zBZ0p9yH';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildUsername(),
                const SizedBox(height: 16),
                buildPassword(),
                const SizedBox(height: 32),
                buildSum(context),
              ],
            ),
          ),
        ),
      );

  Widget buildUsername() => TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: _username,
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
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
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
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: _password,
        toolbarOptions:
            ToolbarOptions(copy: true, paste: true, cut: true, selectAll: true),
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'Enter your password',
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
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
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
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
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        onChanged: (value) => setState(() => password = value),
      );

  Widget buildSum(BuildContext context) {
    return BlocListener(
        bloc: bloc,
        listener: (context, state) async {
          if (state is Authorization) {
            {
              SharedPreferences _prefs = await SharedPreferences.getInstance();
              _prefs.setString("token", state.tokenModel.token.toString());
            }
          } else if (state is ListError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message.message.toString()),
              duration: const Duration(seconds: 5),
              action: SnackBarAction(
                label: 'Повторить заново',
                onPressed: () {},
              ),
            ));
          }
        },
        child: InkWell(
          onTap: () {
            bloc.add(
              PostKanbanEvent(
                  username: _username.text, password: _password.text),
            );

            if (valueUsername == username && valuePassword == password) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new ListScreen()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Неправильный логин или пароль"),
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
}

class TestScreen extends StatefulWidget {
  TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(''),
      ),
    );
  }
}
