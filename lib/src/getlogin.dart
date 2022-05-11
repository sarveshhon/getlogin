import 'package:flutter/material.dart';

class LoginContainer extends StatefulWidget {

  final Color? primaryColor;

  const LoginContainer({Key? key, this.primaryColor}) : super(key: key);

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.primaryColor,
    );
  }
}
