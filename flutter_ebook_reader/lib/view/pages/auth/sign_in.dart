import 'package:cuby_ebook/utils/colors.gen.dart';
import 'package:cuby_ebook/view/widgets/buttons/fb_custom.widget.dart';
import 'package:cuby_ebook/view/widgets/text_field/tf_custom.widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  FocusNode _focus = new FocusNode();
  FocusNode _focus1 = new FocusNode();
  var isActiveEmail = false;
  var isActivePass = false;
  bool _obscureText = false;
  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
    _focus1.addListener(_onFocus1Change);
  }

  void _onFocusChange() {
    setState(() {
      isActivePass = true;
      isActiveEmail = false;
    });
  }

  void _onFocus1Change() {
    setState(() {
      isActiveEmail = true;
      isActivePass = false;
    });
  }

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passTextController = TextEditingController();

  var isValidateEmail = false;
  var isValidate = false;

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorName.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.3,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      'Login to your account by entering your email and your password.',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorName.screen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        TFCustom(
                          label: 'E-mail',
                          icon: Icons.email_outlined,
                          hintText: 'Enter your e-mail',
                          focusNode: _focus1,
                          controller: _emailTextController,
                          isValidate: isValidateEmail,
                          onChanged: (value) {
                            if (isEmail(value)) {
                              setState(() {
                                isValidateEmail = true;
                              });
                            } else {
                              setState(() {
                                isValidateEmail = false;
                              });
                            }

                            print(value);
                          },
                        ),
                        SizedBox(height: height / 50),
                        TFCustom(
                          label: 'Password',
                          icon: Icons.lock_outlined,
                          hintText: 'Enter your password',
                          isPassword: true,
                          focusNode: _focus,
                          onClickShow: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          isShow: _obscureText,
                          controller: _passTextController,
                          isValidate: isValidate,
                          onChanged: (value) {
                            if (value.isNotEmpty && value.length > 3) {
                              setState(() {
                                isValidate = true;
                              });
                            } else {
                              setState(() {
                                isValidate = false;
                              });
                            }
                            print(value);
                          },
                        ),
                        SizedBox(height: 15),
                        Container(
                          child: Text('Forgot Password?'),
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(height: height / 7),
                        isValidateEmail && isValidate
                            ? FBCustom(
                                label: 'Login',
                                onPressed: () {},
                                hasColor: true,
                              )
                            : FBCustom(label: 'Login', onPressed: () {}),
                        SizedBox(height: 15),
                        Container(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Not have an account? '),
                                TextSpan(
                                  text: 'Let’s Sign Up',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorName.primary,
                                  ),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () => Navigator.pushNamed(
                                        context, '/sign_up'),
                                ),
                              ],
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        SizedBox(height: 65),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
