import 'package:flutter/material.dart';

Widget thirtPartyLogin() {
  return Container(
    margin: const EdgeInsets.only(left: 80.0, right: 80.0, bottom: 20, top: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginButton("assets/icons/google.png"),
        _loginButton("assets/icons/apple.png"),
        _loginButton("assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _loginButton(String imagePath) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.all(6),
      width: 40,
      height: 40,
      child: Image.asset(imagePath),
    ),
  );
}
