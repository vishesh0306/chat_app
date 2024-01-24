import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {

  final String name;
  final void Function()? ontap;

  const UserTile({
    Key? key,
  required this.name,
    required this.ontap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      title: Text(name),
      leading: Icon(Icons.person),
    );
  }
}
