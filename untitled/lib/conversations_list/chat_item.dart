import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isPinned;
  final bool isSelected;
  final Function onTap;
  final Function onLongPress;

  ChatItem({
    required this.title,
    required this.subtitle,
    this.isPinned = false,
    this.isSelected = false,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      onLongPress: () => onLongPress(),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16.0),
          leading: isSelected
              ? Icon(Icons.check_circle, color: Colors.green)
              : null,
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: isPinned ? Icon(Icons.push_pin, color: Colors.red) : null,
        ),
      ),
    );
  }
}
