import 'package:flutter/material.dart';

void main() {
  runApp(MonApp());
}

class MonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('LOGIN FORM', textAlign: TextAlign.center),
          ),
          backgroundColor: Color.fromARGB(255, 241, 134, 170),
        ),
        body: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController mailController = TextEditingController();
  final TextEditingController motdepasseController = TextEditingController();
  bool rememberMe = false;
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ],
              ),
              child: TextFormField(
                controller: mailController,
                decoration: InputDecoration(
                  labelText: 'Mail',
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextFormField(
                controller: motdepasseController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Checkbox(
                value: rememberMe,
                onChanged: (bool? value) {
                  setState(() {
                    rememberMe = value!;
                  });
                },
              ),
              Text(
                'Remember me',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 241, 134, 170),
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              String mail = mailController.text;
              String motdepasse = motdepasseController.text;
              setState(() {
                message =
                    'Email: $mail, Password: $motdepasse, Remember Me: $rememberMe';
              });
              print(message);
            },
            child: Text('Submit'),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            message,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
