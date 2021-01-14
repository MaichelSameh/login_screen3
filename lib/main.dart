import 'package:flutter/material.dart';

import 'size.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final Color backgroundColor = Color.fromRGBO(31, 30, 48, 1);

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    Size size = new Size(context);

    TextStyle style = TextStyle(
      fontSize: size.font(20),
      color: Color.fromRGBO(255, 225, 237, 1),
    );
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              height: size.screenHeight() / 3,
              width: size.screenHeight() / 3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color.fromRGBO(52, 47, 86, 1),
                    backgroundColor,
                  ],
                ),
              ),
              child: Text("LOGO",
                  style: TextStyle(
                    fontSize: size.font(20),
                    color: Color.fromRGBO(255, 225, 237, 1),
                  )),
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    buildContainerField(
                      size,
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: size.width(10)),
                            child: Icon(Icons.person,
                                color: Color.fromRGBO(80, 97, 123, 1)),
                          ),
                          buildTextField(size, emailController, false,
                              "USER NAME", "your user name"),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height(30)),
                    buildContainerField(
                      size,
                      Row(
                        children: [
                          Switch(
                            value: passwordVisibility,
                            onChanged: (value) => setState(() {
                              passwordVisibility = value;
                            }),
                            activeTrackColor: Color.fromRGBO(66, 96, 122, 1),
                            activeColor: Color.fromRGBO(253, 252, 244, 1),
                          ),
                          buildTextField(size, passwordController,
                              passwordVisibility, "PASSWORD", "your password"),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height(10)),
                    InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                            color: Color.fromRGBO(174, 174, 184, 1),
                            fontSize: size.font(18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height(60)),
                    Container(
                      height: size.height(70),
                      margin: EdgeInsets.symmetric(horizontal: size.width(25)),
                      child: RaisedButton(
                        color: Color.fromRGBO(216, 50, 86, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            size.height(70),
                          ),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            "LOG IN",
                            style: TextStyle(
                              fontSize: size.font(20),
                              color: Color.fromRGBO(255, 225, 237, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            fontSize: size.font(20),
                            color: Color.fromRGBO(255, 225, 237, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildTextField(Size size, TextEditingController controller,
      bool obscure, String labelText, String hintText) {
    return Container(
      width: size.screenWidth() * 2 / 3,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: size.width(20)),
          enabledBorder: InputBorder.none,
          labelText: labelText,
          hintText: hintText,
          labelStyle: TextStyle(
            color: Color.fromRGBO(168, 166, 189, 1),
            fontSize: size.font(25),
          ),
          hintStyle: TextStyle(
            color: Color.fromRGBO(168, 166, 189, 1),
            fontSize: size.font(15),
          ),
        ),
        style: TextStyle(
          color: Color.fromRGBO(168, 166, 189, 1),
          fontSize: size.font(15),
        ),
        obscureText: obscure,
      ),
    );
  }

  Container buildContainerField(Size size, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(55, 55, 83, 1),
        borderRadius: BorderRadius.circular(
          size.height(10),
        ),
      ),
      height: size.height(70),
      margin: EdgeInsets.symmetric(horizontal: size.width(25)),
      child: child,
    );
  }
}
