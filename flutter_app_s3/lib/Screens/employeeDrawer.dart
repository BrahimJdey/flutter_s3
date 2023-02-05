import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_s3/Model/EmployeeModel.dart';
import 'package:flutter_app_s3/Screens/registerEmployee.dart';
import 'package:flutter_app_s3/login/MyStatefulWidget.dart';

import 'iconSearch.dart';

class employeeDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return employeeDrawerState();
  }
}

Future<List<coursModel>> fetchcours() async {
  String? token;
  Response response = await Dio().get('http://localhost:9090/cours/all',
      );
  if (response.statusCode == 200) {
    var getUsersData = response.data as List;
    var listcours = getUsersData.map((i) => coursModel.fromJSON(i)).toList();
    print('hwn-----'+response.data.toString());
    return Future.value(listcours) ;
  } else {
    throw Exception('Failed to load cours');
  }
}
class employeeDrawerState extends State<employeeDrawer> {
  final minimumPadding = 5.0;



  @override
  Widget build(BuildContext context) {
    print('haddemine');
    var listCours=fetchcours();
    print(listCours.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('emplois du temps'),
          centerTitle: true,

          actions:<Widget>[
            IconButton(icon: Icon(Icons.search),tooltip: 'Search',
              onPressed:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => iconSearch()));
              }
            )

          ]
      ),
      body: Container(
        child:FutureBuilder<List<coursModel>>(
          future: listCours,
          builder: (context, snapshot) {
          if (snapshot.hasData) {
          return ListView.separated(
              itemBuilder: (context, index) {
                var user = (snapshot.data as List<coursModel>)[index];

                int? id=user.id;

                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                            ),

                            // SizedBox(height: 15,),
                            Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      softWrap: false,
                                      user.matiere.toString(), style:
                                  TextStyle( fontWeight: FontWeight.bold, fontSize: 22)
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(user.salle.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  textAlign: TextAlign.center,),
                                SizedBox(height: 5),
                                Text(user.professeurheure.toString(),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,),
                                SizedBox(height: 5),
                                Text(user.heuretravailleparjourByProfesseurheure.toString(),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),

                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.heart,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {

                            },
                          ),
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.bookmark,
                              color: Colors.black54,
                            ),
                            onPressed: () {},
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.hand_thumbsdown,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.hand_thumbsup,
                              color: Colors.blueAccent,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),

                    ],
                  ),

                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: (snapshot.data as List<coursModel>).length);
        }
        else if (snapshot.hasError) {
          return Center( child: Text("${snapshot.error}"));
        }
        return Center(
          child: CircularProgressIndicator(backgroundColor: Colors.cyanAccent),
        );
      },
    ),
    ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            const DrawerHeader(
              child: Text('Management'),
              decoration: BoxDecoration(
                color: Colors.blue,


              ),
            ),
            ListTile(
              title: Text('ajouter cours'),
              leading: Icon(Icons.folder ),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('afficher cours'),
              leading: Icon(Icons.folder   ),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('ajouter prof'),
              leading:   Icon(Icons.group ),
              onTap: () {


              },
            ),
            ListTile(
              title: Text('afficher prof'),
              leading:   Icon(Icons.supervisor_account ),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('ajouter salle'),
              leading:   Icon(Icons.school ),

              onTap: () {

              },
            ),
            ListTile(
              title: Text('afficher salle'),
              leading:   Icon(Icons.school ),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('ajouter fliere'),
              leading: Icon(Icons.archive),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('afficher fliere'),
              leading: Icon(Icons.archive),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('ajouter matier'),
              leading: Icon(Icons.book ),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('afficher matier'),
              leading: Icon(Icons.book ),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('ajouter heurtravailparjour'),
              leading: Icon(Icons.calendar_today ),
              onTap: () {

              },
            ),
            ListTile(
              title: Text('afficher heurtravailparjour'),
              leading: Icon(Icons.calendar_today ),
              onTap: () {

              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  MaterialButton(
                      minWidth: 90,
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => employeeDrawer()));
                        setState(() {

                        });
                      },
                      child: Column (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Icon(
                            Icons.home,
                            color: Colors.blueAccent,
                          )
                        ],

                      )

                  ),
                    MaterialButton(
                        minWidth: 90,
                        onPressed: (){
                          setState(() {

                          });
                        },
                        child: Column (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat,
                              color: Colors.blueAccent,
                            )
                          ],

                        )

                    ),
                    MaterialButton(
                        minWidth: 90,
                        onPressed: (){
                          setState(() {

                          });
                        },
                        child: Column (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.east,
                              color: Colors.blueAccent,
                            )
                          ],

                        )

                    ),
                    MaterialButton(
                        minWidth: 90,
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyStatefulWidget()));
                          setState(() {

                          });
                        },
                        child: Column (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.blueAccent,
                            )
                          ],

                        )

                    )


                  ],
              )
                ],
            ),
            )


        ),

    );


  }
}
