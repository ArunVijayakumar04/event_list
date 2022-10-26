
import 'package:file_picker/file_picker.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'HomeScreen.dart';
import 'MyCustomFormState.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/':(context) => const HomeScreen(),
    '/ShowEvent':(context) =>  ShowEventScreen(),
  },
)
);


// Home screen


// +Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.

class Event {
  final String eventName;
  final String staffName;
  final String eventDate;

  const Event({required this.eventName,required this.staffName,required this.eventDate});
}
class ShowEventScreen extends StatelessWidget {
   ShowEventScreen({Key? key}) : super(key: key);
  List<Event> eventList = [
    Event(eventName: faker.person.name(), staffName: faker.person.name(), eventDate: faker.date.toString()),
    Event(eventName: faker.person.name(), staffName: faker.person.name(), eventDate: faker.date.toString()),
    Event(eventName: faker.person.name(), staffName: faker.person.name(), eventDate: faker.date.toString()),
    Event(eventName: faker.person.name(), staffName: faker.person.name(), eventDate: faker.date.toString()),
    Event(eventName: faker.person.name(), staffName: faker.person.name(), eventDate: faker.date.toString()),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(child: Stack(
                children: <Widget>[
                  // Stroked text as border.
                  Text(
                    'Event List',
                    style: TextStyle(
                      fontSize: 40,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.blue,
                    ),
                  ),
                  // Solid text as fill.
                  Text(
                    'Event List',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add List'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Show List'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(eventList[index].eventName),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> EventShowPage(event:eventList[index]),));
              },
            );
          }),
    );
  }
}
