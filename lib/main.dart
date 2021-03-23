import 'package:flutix_app/services/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                child: Text("Sign Up"),
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.signUp(
                      "ariel@noah.com",
                      "123456",
                      "ariel",
                      ["Action", "Horror", "Music", "Drama"],
                      "Indonesian");

                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                }),
            ElevatedButton(
                child: Text("Sign In"),
                onPressed: () async {
                  SignInSignUpResult result = await AuthServices.signIn(
                    "ariel@noah.com",
                    "1234567",
                  );

                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                })
          ],
        )),
      ),
    );
  }
}
