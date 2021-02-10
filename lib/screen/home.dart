
import 'package:api_storage/model/user_model2.dart';
import 'package:api_storage/provider/db_helper.dart';
import 'package:api_storage/provider/provider1.dart';
import 'package:api_storage/screen/splash.dart';
import 'package:api_storage/service/user_service.dart';
import 'package:flutter/material.dart';
class User_Api1 extends StatefulWidget {
  const User_Api1 ({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<User_Api1> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api to sqlite'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.settings_input_antenna),
              onPressed: () async {
                await _loadFromApi();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await _deleteData();
              },
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : _buildEmployeeListView(),
    );
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = EmployeeApiProvider();
    await apiProvider.getAllEmployees();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  _deleteData() async {
    setState(() {
      isLoading = true;
    });

    await DBProvider.db.deleteAllEmployees();

    // wait for 1 second to simulate loading of data
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

    print('All employees deleted');
  }

  _buildEmployeeListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllEmployees(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {

          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
               return ListTile(
                      leading: Text(
                        "${index + 1}",
                        style: TextStyle(fontSize: 20.0),
                     ),
                      onTap: () async{
                        await DBProvider.db.update(snapshot.data[index]);
                      },
                      title: Text(
                          "Name: ${snapshot.data[index].name} ${snapshot.data[index].username} "),
                      subtitle: Text('EMAIL: ${snapshot.data[index].address.city}'),
                    );
              // Card(
               //   elevation: 5,
               //   child: Column(
               //     children: [
               //       Container(
               //         child: Text("User Details",style: TextStyle(fontWeight: FontWeight.bold),),
               //       ),
               //       Row(
               //         children: [
               //           Text( "Name: ${snapshot.data[index].name}"),
               //         ],
               //       ),
               //       Row(
               //         children: [
               //           Text( "User Name: ${snapshot.data[index].username}"),
               //         ],
               //       ),
               //       Row(
               //         children: [
               //           Text( "Email: ${snapshot.data[index].email}"),
               //         ],
               //       ),
               //       Row(
               //         children: [
               //           Text( "Phone: ${snapshot.data[index].phone}"),
               //         ],
               //       ),
               //       Row(
               //         children: [
               //           Text( "Website: ${snapshot.data[index].website}"),
               //         ],
               //       ),
               //       Row(
               //         children: [
               //           Text( "City: ${snapshot.data[index].address.city}"),
               //         ],
               //       ),
               //       Row(
               //         children: [
               //           Text( "Zipcode: ${snapshot.data[index].address.zipcode}"),
               //         ],
               //       )
               //     ],
               //   ),
               // );
              // ListTile(
              //   leading: Text(
              //     "${index + 1}",
              //     style: TextStyle(fontSize: 20.0),
              //   ),
              //   title: Text(
              //       "Name: ${snapshot.data[index].name} ${snapshot.data[index].username} "),
              //   subtitle: Text('EMAIL: ${snapshot.data[index].phone}'),
              // );
            },
          );
        }
      },
    );
  }
}
// class User_Api extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//           body: Center(
//               child: JSONListView()
//           ),
//         ));
//   }
// }
// class JSONListView extends StatefulWidget {
//   CustomJSONListView createState() => CustomJSONListView();
// }
//
// class CustomJSONListView extends State {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child:Scaffold(
//       appBar: AppBar(
//         title: Text('JSON ListView in Flutter'),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<Employee>>(
//         future: fetchJSONData(),
//         builder: (context, snapshot) {
//
//           if (!snapshot.hasData) return Center(child: splash_data());
//
//           return ListView(
//             children: snapshot.data
//                 .map((user) => ListTile(
//               title: Text(user.name),
//               trailing: Text(user.email),
//               onTap: ()
//               { print(user.name); },
//               subtitle: Text(user.address.city + '\n' + user.address.street +'\n'+user.phone),
//
//             ),
//
//             )
//                 .toList()
//           );
//         },
//       ),
//       ),
//     );
//   }
