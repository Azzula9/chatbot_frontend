import 'package:flutter/material.dart';
import 'section.dart';
import 'chat_item.dart';

class ConversationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                Section(
                  title: 'Pinned Chats',
                  items: [
                    ChatItem(
                      title: 'Exploring Data-Only Plans',
                      subtitle:
                      'Details on available data-centric plans for tablets and other mobile devices.',
                      isPinned: true,
                    ),
                    ChatItem(
                      title: 'Billing and Payments',
                      subtitle:
                      'Understanding your bill, payment methods available, and how to resolve billing issues.',
                      isPinned: true,
                    ),
                  ],
                ),
                Section(
                  title: 'Yesterday',
                  items: [
                    ChatItem(
                      title: 'Network Coverage Queries',
                      subtitle:
                      'Checking network availability and resolving connectivity issues in your area.',
                    ),
                    ChatItem(
                      title: 'Plan Options and Upgrades',
                      subtitle:
                      'Exploring available mobile and internet plans, and how to upgrade or switch plans.',
                    ),
                  ],
                ),
                Section(
                  title: 'Last 7 Days',
                  items: [
                    ChatItem(
                      title: 'Enhancing Mobile Internet Speed',
                      subtitle:
                      'Tips and tricks to boost your mobile internet performance.',
                    ),
                    ChatItem(
                      title: 'Reporting Service Outages',
                      subtitle:
                      'What to do if you experience a service outage and how to report it for quick resolution.',
                    ),
                    ChatItem(
                      title: 'Upgrading Your Mobile Plan',
                      subtitle:
                      'Steps to find the right upgrade for your needs and how to apply it directly.',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Conversations',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
