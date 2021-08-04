import 'package:flutter/material.dart';
import 'package:stage_prototype/Parametres.dart';
import 'Graph.dart';
import 'VideoPlayerWidget.dart';
import 'Videosurveillance.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  //late List<int>temp;
  //late List<String>date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text(
                  'Vidéosurveillance'
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new VideoSurveillance()));
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                  'Historique'
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new Graph()));
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                  'Notifications'
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new Notifications()));
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                  'Paramètres'
              ),
              onTap: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => new Parametres()));
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ) ,
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
                'Alerte 1 :',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Température: ', style: TextStyle(fontSize: 18)),
                Text('50', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text('Date: ', style: TextStyle(fontSize: 18),),
                Text('12/03/2015', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: Text('Enregistrement')),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Text(
              'Alerte 2 :',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Température: ', style: TextStyle(fontSize: 18),),
                Text('45', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text('Date: ', style: TextStyle(fontSize: 18),),
                Text('05/06/2014', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: Text('Enregistrement')),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Text(
              'Alerte 3 :',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Température: ', style: TextStyle(fontSize: 18),),
                Text('48', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text('Date: ', style: TextStyle(fontSize: 18),),
                Text('15/04/2013', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: Text('Enregistrement')),

          ],
        ),
      ),
    );
  }
}
