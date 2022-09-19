import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/header.dart';
import '../Components/sideMenu.dart';
import '../Constants/colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = true;
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        drawer: SideMenu(),
        backgroundColor: bgColor,
        extendBodyBehindAppBar: true,
        body: Container(
          child: Center(
            child: Column(
              children: [
                // ロゴとか名前
                Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: RichText(
                      text: TextSpan(
                          text: 'Yamu',
                          style: TextStyle(
                              fontFamily: 'Antra',
                              fontSize: 36.0,
                              color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'LogIn',
                                style: TextStyle(
                                    fontFamily: 'Antra',
                                    fontSize: 36.0,
                                    color: Colors.redAccent)),
                            // TextSpan(
                            //     text: 'In',
                            //     style: TextStyle(
                            //         fontFamily: 'Antra',
                            //         color: Colors.white,
                            //         fontSize: 36.0))
                          ]),
                    )),
                // メアドフォーム
                SizedBox(
                  height: 400.0,
                  width: 400.0,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 80.0, left: 80.0, right: 80.0),
                          child: TextFormField(
                            validator: (val) =>
                                val!.isEmpty ? 'Enter email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Enter email',
                                hintStyle: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontFamily: 'Antra')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, left: 80.0, right: 80.0),
                          child: TextFormField(
                            validator: (val) => val!.length < 8
                                ? 'Enter correct password'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                            obscureText: isVisible ? true : false,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(isVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                ),
                                hintText: 'Enter password',
                                hintStyle: TextStyle(
                                  fontFamily: 'Antra',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 70.0),
                          child: MaterialButton(
                              color: Colors.lightBlueAccent,
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() => loading = true);
                                  print(email);
                                  print(password);
                                  // ログイン処理はこちら
                                  // dynamic result = await authentication
                                  //     .signUpWithEmailAndPassword(
                                  //         email, password);
                                  // if (result == null) {
                                  //   setState(() => error =
                                  //       'Sorry cannot sign in with those credentials');
                                  //   loading = false;
                                  // }
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontFamily: 'Antra', color: Colors.black),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                // SNS認証のボタンたち
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: FloatingActionButton(
                            heroTag: 'googleButton',
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), //角の丸み
                            ),
                            backgroundColor: Colors.white,
                            child: Image.asset(
                                "assets/icons/Google_login_pressed.png"),
                            clipBehavior: Clip.antiAlias,
                            onPressed: () async {
                              // authentication.signInWithGoogle().whenComplete(() {
                              //   Navigator.pushReplacement(
                              //       context,
                              //       PageTransition(
                              //           child: Homepage(),
                              //           type: PageTransitionType.rightToLeft));
                              // });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                                "assets/icons/Facebook_login_focus.png"),
                            clipBehavior: Clip.antiAlias,
                            heroTag: 'FacebookButton',
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     PageTransition(
                              //         child: LoginFacebook(),
                              //         type: PageTransitionType.downToUp));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                                "assets/icons/Twitter_Login_focus.png"),
                            clipBehavior: Clip.antiAlias,
                            heroTag: 'TwitterButton',
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     PageTransition(
                              //         child: LoginFacebook(),
                              //         type: PageTransitionType.downToUp));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18), //角の丸み
                            ),
                            child: Image.asset("assets/icons/insta-color.png"),
                            clipBehavior: Clip.antiAlias,
                            heroTag: 'InstagramButton',
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     PageTransition(
                              //         child: LoginFacebook(),
                              //         type: PageTransitionType.downToUp));
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), //角の丸み
                            ),
                            child: Image.asset("assets/icons/tictok-gray.png"),
                            clipBehavior: Clip.antiAlias,
                            heroTag: 'TictokButton',
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     PageTransition(
                              //         child: LoginFacebook(),
                              //         type: PageTransitionType.downToUp));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 新規さんはこちら
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 30.0),
                  child: Row(
                    children: [
                      Text(
                        '新規登録はこちら！',
                        style: TextStyle(
                            fontFamily: 'Antra',
                            color: Colors.white,
                            fontSize: 12.0),
                      ),
                      MaterialButton(
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //     context,
                            //     PageTransition(
                            //         child: SignupPage(),
                            //         type: PageTransitionType.downToUp));
                          },
                          child: Text(
                            '新規登録',
                            style: TextStyle(
                                fontFamily: 'Antra',
                                color: Colors.red,
                                fontSize: 16.0),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
