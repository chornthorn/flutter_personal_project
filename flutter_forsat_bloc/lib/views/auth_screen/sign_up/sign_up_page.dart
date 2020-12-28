import 'package:flutter/material.dart';
import 'package:forsatbloc/routes/route_constants.dart';
import 'package:forsatbloc/utils/images.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Container(
            height: 250,
            child: Center(
              child: Image.asset(Images.logo),
            ),
          ),
          TextFormField(
            onChanged: (String firstName) {},
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              hintText: 'Enter first name',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            onChanged: (String lastName) {},
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              hintText: 'Enter last name',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            onChanged: (String email) {},
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              hintText: 'Enter your email',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            onChanged: (String password) {},
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              hintText: 'Enter password',
            ),
            obscureText: true,
          ),
          SizedBox(height: 10),
          TextFormField(
            onChanged: (String passwordConfirm) {},
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              hintText: 'Enter confirm password',
            ),
            obscureText: true,
          ),
          SizedBox(height: 25),
          MaterialButton(
            onPressed: () {},
            child: Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
            height: 55,
            color: Theme.of(context).primaryColor,
            shape: StadiumBorder(),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Already have an account?"),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, signInRoute);
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                shape: StadiumBorder(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
