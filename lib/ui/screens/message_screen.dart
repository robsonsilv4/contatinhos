import 'package:flutter/material.dart';

import '../../data/models/users.dart';

class MessageScreen extends StatelessWidget {
  final List<User> users;

  MessageScreen({@required this.users});

  @override
  Widget build(BuildContext context) {
    final user = users.first;
    final name = user.firstName + ' ' + user.lastName;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
            ),
            SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  'VISTO POR ÚLTIMO ÁS ...',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          Icon(Icons.attach_file),
          Icon(Icons.more_vert),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(),
        ),
        Card(
          margin: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.tag_faces,
                  size: 32.0,
                  color: Colors.grey,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.attach_file,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.photo_camera,
                      size: 30.0,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4.0),
                    Container(
                      height: 45.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.mic,
                        ),
                        iconSize: 30.0,
                        color: Colors.grey.shade200,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
