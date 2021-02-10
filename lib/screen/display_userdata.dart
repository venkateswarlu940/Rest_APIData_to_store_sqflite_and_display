import 'package:api_storage/model/fetch_api.dart';
import 'package:api_storage/model/user_model2.dart';
import 'package:api_storage/service/user_service.dart';
import 'package:flutter/material.dart';

class User_Api extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: Center(
              child: JSONListView()
          ),
        ));
  }
}
class JSONListView extends StatefulWidget {
  CustomJSONListView createState() => CustomJSONListView();
}

class CustomJSONListView extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON ListView in Flutter'),
      ),
      body: FutureBuilder<List<Employee>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView(
            children: snapshot.data
                .map((user) => ListTile(
              title: Text(user.name),
              trailing: Text(user.email),
              onTap: ()
              { print(user.name); },
              subtitle: Text(user.address.city + '\n' + user.address.street +'\n'+user.phone),

              // leading: CircleAvatar(
              //   backgroundColor: Colors.green,
              //   child: Text(user.name[0],
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20.0,
              //       )),
              // ),
            ),

            )
                .toList(),




          );
        },
      ),
    );
  }
}