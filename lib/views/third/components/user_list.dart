import 'package:flutter/material.dart';
import 'package:suitmedia_mobile/models/user_model.dart';

class UserList extends StatelessWidget {
  final Data data;
  const UserList({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE2E3E4),
            width: 0.7,
          ),
        ),
      ),
      child: ListTile(
        onTap: () {
          Navigator.pop(context, data);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
        leading: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(data.avatar),
            ),
          ),
        ),
        title: Text(
          "${data.firstName} ${data.lastName}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          data.email,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
