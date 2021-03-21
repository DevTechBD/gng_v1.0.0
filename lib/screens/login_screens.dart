import 'package:flutter/material.dart';
import 'package:gngappv1/screens/register_screens.dart';
import 'package:gngappv1/state/user_state.dart';

import 'package:provider/provider.dart';

import 'home_Screens.dart';

class LoginScrrens extends StatefulWidget {
  static const routeName = '/login-screens';

  @override
  _LoginScrrensState createState() => _LoginScrrensState();
}

class _LoginScrrensState extends State<LoginScrrens> {
  String _username = '';
  String _password = '';
  final _form = GlobalKey<FormState>();

  void _loginNew() async {
    var isvalid = _form.currentState.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState.save();
    bool istoken = await Provider.of<UserState>(
      context,
      listen: false,
    ).loginNow(_username, _password);
    if (istoken) {
      Navigator.of(context).pushReplacementNamed(HomeScreens.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Something is wrong.Try Again"),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Color(0xFFe8e8e8),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                          validator: (v) {
                            if (v.isEmpty) {
                              return 'Enter Your Username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Username",
                            border: InputBorder.none,
                          ),
                          onSaved: (v) {
                            _username = v;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(

                      decoration: BoxDecoration(
                        color: Color(0xFFe8e8e8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          validator: (v) {
                            if (v.isEmpty) {
                              return 'Enter Your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                          ),
                          onSaved: (v) {
                            _password = v;
                          },
                          obscureText: true,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Color(0xFF6854ff),
                          onPressed: () {
                            _loginNew();
                          },
                          child: Text("Login"),
                        ),
                        // ignore: deprecated_member_use
                        FlatButton(
                          color: Colors.amber,
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(RegisterScreens.routeName);
                          },
                          child: Text(
                            "Register New",
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
