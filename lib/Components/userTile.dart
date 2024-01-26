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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onTap: ontap,
        title: Text(name),
        leading: Icon(Icons.person),
      ),
    );
  }
}
