import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isPinned;

  ChatItem({required this.title, required this.subtitle, this.isPinned = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: isPinned ? Icon(Icons.push_pin, color: Colors.red) : null,
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
