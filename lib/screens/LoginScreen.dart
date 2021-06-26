import 'package:flutter/material.dart';
import 'package:my_app/styles/form/EmailInputStyle.dart';
import 'package:my_app/styles/form/PasswordInputStyle.dart';
import 'package:flutter/foundation.dart';
import '../api/callSomeShit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Login'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Row(),
            ),
            Expanded(
              flex: 8,
              child: LoginForm(),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  var showPassword = ValueNotifier<bool>(false);
  void setShowPassword() {
    showPassword.value = !showPassword.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(flex: 1, child: Column()),
      Expanded(
          flex: 10,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  onSaved: (x) {
                    email = x!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  enableSuggestions: false,
                  // decoration: const InputDecoration(
                  //   labelText: 'Email',
                  // ),
                  decoration: EmailInputStyle.textFieldStyle(
                      labelTextStr: "Email",
                      hintTextStr: "Unesite Email adresu"),
                  // The validator receives the text that the user has entered.
                  validator: (x) {
                    if (x == null || x.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ValueListenableBuilder(
                    valueListenable: showPassword,
                    builder: (_, bool _showPassword, __) {
                      return TextFormField(
                        onSaved: (x) {
                          password = x!;
                        },
                        autocorrect: false,
                        obscureText: !_showPassword,
                        enableSuggestions: false,
                        decoration: PasswordInputStyle.textFieldStyle(
                            labelTextStr: "Lozinka",
                            hintTextStr: "Unesite Lozinku",
                            showPassword: showPassword,
                            onPressed: setShowPassword),
                        // The validator receives the text that the user has entered.
                        validator: (x) {
                          if (x == null || x.isEmpty) {
                            return "Unesite lozinku";
                          }
                          return null;
                        },
                      );
                    }),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                    CallSomeShit().api();

                    debugPrint('credentials: $email $password');
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          )),
      Expanded(flex: 1, child: Column())
    ]);
  }
}
