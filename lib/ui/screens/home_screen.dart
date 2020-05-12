import 'package:flutter/material.dart';

import '../../data/models/users.dart';
import '../../data/repositories/user_repository.dart';

class HomeScreen extends StatelessWidget {
  final UserRepository repository;

  HomeScreen({@required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatinhos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: FutureBuilder(
            future: repository.getUsers(),
            builder: (context, snapshot) {
              final List<User> users = snapshot.data;
              if (snapshot.hasData) {
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users.elementAt(index);
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(user.avatar),
                        ),
                      ),
                      title: Text(
                        '${user.firstName} ${user.lastName}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'Flutter é melhor do que RN!',
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text('ONTEM'),
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}
