import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConversationsPage(),
    );
  }
}

class ConversationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, // Change the app bar color
        title: Text('Conversations'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Section(
            title: 'pinned chats',
            items: [
              ChatItem(
                title: 'Exploring Data-Only Plans',
                subtitle: 'Details on available data-centric plans for tablets and other mobile devices.',
                isPinned: true,
              ),
              ChatItem(
                title: 'Billing and Payments',
                subtitle: 'Understanding your bill, payment methods available, and how to resolve billing issues.',
                isPinned: true,
              ),
            ],
          ),
          Section(
            title: 'Yesterday',
            items: [
              ChatItem(
                title: 'Network Coverage Queries',
                subtitle: 'Checking network availability and resolving connectivity issues in your area.',
              ),
              ChatItem(
                title: 'Plan Options and Upgrades',
                subtitle: 'Exploring available mobile and internet plans, and how to upgrade or switch plans.',
              ),
            ],
          ),
          Section(
            title: 'Last 7 Days',
            items: [
              ChatItem(
                title: 'Enhancing Mobile Internet Speed',
                subtitle: 'Tips and tricks to boost your mobile internet performance.',
              ),
              ChatItem(
                title: 'Reporting Service Outages',
                subtitle: 'What to do if you experience a service outage and how to report it for quick resolution.',
              ),
              ChatItem(
                title: 'Upgrading Your Mobile Plan',
                subtitle: 'Steps to find the right upgrade for your needs and how to apply it directly.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<Widget> items;

  Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey, // Change the section title color
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Column(children: items),
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isPinned;

  ChatItem({required this.title, required this.subtitle, this.isPinned = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0), // Change the card margin
      color: Colors.grey[200], // Change the card background color
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0), // Change the card padding
        leading: isPinned
            ? Icon(Icons.push_pin, color: Colors.red) // Change the pin icon and color
            : null,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold, // Change the title font weight
          ),
        ),
        subtitle: Text(subtitle),
        trailing: isPinned
            ? Icon(Icons.circle, color: Colors.red, size: 8.0) // Change the trailing dot color and size
            : null,
      ),
    );
  }
}