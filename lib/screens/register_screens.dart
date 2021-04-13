import 'package:flutter/material.dart';
import 'package:gngappv1/state/user_state.dart';

import 'package:provider/provider.dart';

import 'login_screens.dart';

class RegisterScreens extends StatefulWidget {
  static const routeName = '/register-screens';
  @override
  _RegisterScreensState createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens> {
  final _form = GlobalKey<FormState>();

  String _username = '';
  String _password = '';
  String _confpassword = '';

  _registerNow() async {
    var isvalid = _form.currentState.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState.save();
    bool isregis = await Provider.of<UserState>(
      context,
      listen: false,
    ).registernow(_username, _password);
    if (isregis) {
      Navigator.of(context).pushReplacementNamed(LoginScrrens.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.,
      // ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,

            child: Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    Text("Register", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFe8e8e8),
                            borderRadius: BorderRadius.circular(10)
                        ),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFe8e8e8),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(
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
                          onChanged: (v) {
                            setState(() {
                              _confpassword = v;
                            });
                          },
                          onSaved: (v) {
                            _password = v;
                          },
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFe8e8e8),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(
                          validator: (v) {
                            if (_confpassword != v) {
                              return 'Confirm password';
                            }
                            if (v.isEmpty) {
                              return 'Confirm Your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm Password",
                          ),
                          onSaved: (v) {
                            _password = v;
                          },
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          color: Color(0xFF3e30d1),
                          onPressed: () {
                            _registerNow();
                          },
                          child: Text("Register", style: TextStyle(color: Colors.white)),
                        ),
                        FlatButton(
                          color: Color(0xFFfcba03),
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScrrens.routeName);
                          },
                          child: Text(
                            "Login Now",
                            style: TextStyle(
                              color: Colors.white,
                            ),
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
