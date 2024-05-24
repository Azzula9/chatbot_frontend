import 'package:flutter/material.dart';
import 'section.dart';
import 'chat_item.dart';

class ConversationsPage extends StatefulWidget {
  @override
  _ConversationsPageState createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {
  List<Map<String, dynamic>> chats = [
    {
      'title': 'Exploring Data-Only Plans',
      'subtitle': 'Details on available data-centric plans for tablets and other mobile devices.',
      'isPinned': true,
      'isSelected': false,
      'section': 'Pinned Chats',
    },
    {
      'title': 'Billing and Payments',
      'subtitle': 'Understanding your bill, payment methods available, and how to resolve billing issues.',
      'isPinned': true,
      'isSelected': false,
      'section': 'Pinned Chats',
    },
    {
      'title': 'Network Coverage Queries',
      'subtitle': 'Checking network availability and resolving connectivity issues in your area.',
      'isPinned': false,
      'isSelected': false,
      'section': 'Yesterday',
    },
    {
      'title': 'Plan Options and Upgrades',
      'subtitle': 'Exploring available mobile and internet plans, and how to upgrade or switch plans.',
      'isPinned': false,
      'isSelected': false,
      'section': 'Yesterday',
    },
    {
      'title': 'Enhancing Mobile Internet Speed',
      'subtitle': 'Tips and tricks to boost your mobile internet performance.',
      'isPinned': false,
      'isSelected': false,
      'section': 'Last 7 Days',
    },
    {
      'title': 'Reporting Service Outages',
      'subtitle': 'What to do if you experience a service outage and how to report it for quick resolution.',
      'isPinned': false,
      'isSelected': false,
      'section': 'Last 7 Days',
    },
    {
      'title': 'Upgrading Your Mobile Plan',
      'subtitle': 'Steps to find the right upgrade for your needs and how to apply it directly.',
      'isPinned': false,
      'isSelected': false,
      'section': 'Last 7 Days',
    },
  ];

  bool isSelecting = false;

  void _toggleSelect(int index) {
    setState(() {
      chats[index]['isSelected'] = !chats[index]['isSelected'];
      isSelecting = chats.any((chat) => chat['isSelected']);
    });
  }

  void _toggleSelectionMode(int index) {
    setState(() {
      chats[index]['isSelected'] = !chats[index]['isSelected'];
      isSelecting = chats.any((chat) => chat['isSelected']);
    });
  }

  void _showOptionsDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: <Widget>[
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.push_pin),
                onPressed: () {
                  Navigator.pop(context);
                  // Implement Pin functionality here
                },
              ),
              title: Text('Pin'),
            ),
            Divider(),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.download),
                onPressed: () {
                  Navigator.pop(context);
                  // Implement Export functionality here
                },
              ),
              title: Text('Export'),
            ),
            Divider(),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.select_all),
                onPressed: () {
                  Navigator.pop(context);
                  _toggleSelect(index);
                },
              ),
              title: Text('Select'),
            ),
            Divider(),
            ListTile(
              leading: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Navigator.pop(context);
                  // Implement Delete functionality here
                },
              ),
              title: Text('Delete'),
            ),
          ],
        );
      },
    );
  }


  void _pinSelectedItems() {
    setState(() {
      for (var chat in chats) {
        if (chat['isSelected']) {
          chat['isPinned'] = true;
          chat['isSelected'] = false;
        }
      }
      isSelecting = false;
    });
  }

  void _exportSelectedItems() {
    // Implement Export functionality here
  }

  void _deleteSelectedItems() {
    setState(() {
      chats.removeWhere((chat) => chat['isSelected']);
      isSelecting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: [
                _buildSection('Pinned Chats'),
                _buildSection('Yesterday'),
                _buildSection('Last 7 Days'),
              ],
            ),
          ),
          if (isSelecting) _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildSection(String sectionTitle) {
    List<Map<String, dynamic>> sectionChats = chats.where((chat) => chat['section'] == sectionTitle).toList();

    if (sectionChats.isEmpty) {
      return Container();
    }

    return Section(
      title: sectionTitle,
      items: sectionChats.map((chat) {
        int index = chats.indexOf(chat);
        return ChatItem(
          title: chat['title'],
          subtitle: chat['subtitle'],
          isPinned: chat['isPinned'],
          isSelected: chat['isSelected'],
          onTap: () {
            if (isSelecting) {
              _toggleSelectionMode(index);
            } else {
              _showOptionsDialog(context, index);
            }
          },
          onLongPress: () {
            _toggleSelectionMode(index);
          },
        );
      }).toList(),
    );
  }
  // Widget _buildAppBar() {
  //
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.red,
  //       borderRadius: BorderRadius.only(
  //         bottomLeft: Radius.circular(5.0),
  //         bottomRight: Radius.circular(5.0),
  //       ),
  //     ),
  //     child: SafeArea(
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               'Conversations',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             Row(
  //               children: [
  //                 IconButton(
  //                   icon: Icon(Icons.add, color: Colors.white),
  //                   onPressed: () {},
  //                 ),
  //                 IconButton(
  //                   icon: Icon(Icons.search, color: Colors.white),
  //                   onPressed: () {},
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildBottomBar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.push_pin),
            onPressed: _pinSelectedItems,
            color: Colors.black45,
          ),
          IconButton(
            icon: Icon(Icons.download),
            onPressed: _exportSelectedItems,
            color: Colors.black45,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _deleteSelectedItems,
            color: Colors.black45,
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isSearching) {
          setState(() {
            isSearching = false;
          });
          return false; // Prevent exiting the app
        }
        return true; // Allow exiting the app
      },
      child: AppBar(
        backgroundColor: Colors.red,
        title: isSearching
            ? TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          autofocus: true,
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            // Handle search functionality
            // You can access the search query from 'value'
          },
        )
            : Text(
          'Conversations',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Add button functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  searchController.clear();
                }
              });
            },
          ),
        ],
      ),
    );
  }
}