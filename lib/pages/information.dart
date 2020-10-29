import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maps_up/home.dart';

import '../mapsup.dart';
import 'event.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  final _formKeytwo = GlobalKey<FormState>();
  final _formKeythree = GlobalKey<FormState>();
  final _formKeyfour = GlobalKey<FormState>();
  final _formKeyfive = GlobalKey<FormState>();
  String build_name;
  String room_name;
  String aj_name;
  String num_room;
  String latlong;

  Widget saveButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        'Save',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        createData();
      },
    );
  }

  Widget logoutButton() {
    return RaisedButton(
      color: Colors.red[800],
      child: Text(
        'Log Out',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return HomePage2();
          }),
        );
        print('click logOut');
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        saveButton(),
        SizedBox(
          width: 170.0,
        ),
        logoutButton(),
      ],
    );
  }

  // Method
  Widget mapsButton() {
    return IconButton(
        icon: Icon(Icons.map),
        onPressed: () {
          print('click maps');

          MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => MapsUPPage());
          Navigator.of(context).push(materialPageRoute);
        });
  }

  Widget eventButton() {
    return IconButton(
        icon: Icon(Icons.event_available),
        onPressed: () {
          print('click event');

          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => EventPage());
          Navigator.of(context).push(materialPageRoute);
        });
  }

  Widget nameBuildingText() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        icon: Icon(
          Icons.business,
          color: Colors.purple,
          size: 48.0,
        ),
        labelText: 'ชื่อตึก/ชื่ออาคาร : ',
        labelStyle: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'กรอกชื่อตึก/ชื่ออาคาร',
        helperStyle:
            TextStyle(color: Colors.purple, fontStyle: FontStyle.italic),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'กรุณาใส่ชื่ออาคาร / " - "';
        }
      },
      onSaved: (value) => build_name = value,
    );
  }

  Widget nameRoomText() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        icon: Icon(
          Icons.room,
          color: Colors.purple,
          size: 48.0,
        ),
        labelText: 'ชื่อห้อง : ',
        labelStyle: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'กรอกชื่อห้อง',
        helperStyle:
            TextStyle(color: Colors.purple, fontStyle: FontStyle.italic),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'กรุณาใส่ชื่อห้อง / " - "';
        }
      },
      onSaved: (value) => room_name = value,
    );
  }

  Widget nameTeacherText() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        icon: Icon(
          Icons.text_fields,
          color: Colors.purple,
          size: 48.0,
        ),
        labelText: 'ชื่ออาจารย์ : ',
        labelStyle: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'กรอกชื่ออาจารย์',
        helperStyle:
            TextStyle(color: Colors.purple, fontStyle: FontStyle.italic),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'กรุณาใส่ชื่ออาจารย์ / " - "';
        }
      },
      onSaved: (value) => aj_name = value,
    );
  }

  Widget roomnumberText() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        icon: Icon(
          Icons.format_list_numbered,
          color: Colors.purple,
          size: 48.0,
        ),
        labelText: 'เลขห้อง : ',
        labelStyle: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'กรอกเลขห้อง',
        helperStyle:
            TextStyle(color: Colors.purple, fontStyle: FontStyle.italic),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'กรุณาใส่เลขห้อง / " - "';
        }
      },
      onSaved: (value) => num_room = value,
    );
  }

  Widget locationText() {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        icon: Icon(
          Icons.local_library,
          color: Colors.purple,
          size: 48.0,
        ),
        labelText: 'ละติจูด/ลองติจูด : ',
        labelStyle: TextStyle(
          color: Colors.purple,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'กรอกละติจูด/ลองติจูด',
        helperStyle:
            TextStyle(color: Colors.purple, fontStyle: FontStyle.italic),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'กรุณาใส่ละติจูด/ลองติจูด';
        }
      },
      onSaved: (value) => latlong = value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('ผู้ดูแล'),
        actions: <Widget>[mapsButton(),eventButton()],
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          // nameBuildingText(),
          // nameRoomText(),
          // nameTeacherText(),
          // roomnumberText(),
          // locationText(),
          // SizedBox(
          //   height: 30.0,
          // ),

          Form(
            key: _formKey,
            child: nameBuildingText(),
          ),
          Form(
            key: _formKeytwo,
            child: nameRoomText(),
          ),
          Form(
            key: _formKeythree,
            child: nameTeacherText(),
          ),
          Form(
            key: _formKeyfour,
            child: roomnumberText(),
          ),
          Form(
            key: _formKeyfive,
            child: locationText(),
          ),

          showButton(),
        ],
      ),
    );
  }

  void createData() async {
    // var number =
    // int.parse(saleVal);

    if (_formKey.currentState.validate() &&
        _formKeytwo.currentState.validate() &&
        _formKeythree.currentState.validate() &&
        _formKeyfour.currentState.validate() &&
        _formKeyfive.currentState.validate()) {
      _formKey.currentState.save();
      _formKeytwo.currentState.save();
      _formKeythree.currentState.save();
      _formKeyfour.currentState.save();
      _formKeyfive.currentState.save();

      // DocumentReference ref = await db.collection('sales').add({
      //   // 'saleVal': '$number ',
      //   'saleVal': '$saleVal ',
      //   'saleYear': '$saleYear',
      // });
      // setState(() => id = ref.documentID);
      // print(ref.documentID);
      Firestore.instance.collection('database').document().setData({
        'building name': build_name,
        'room name': room_name,
        'AJ name': aj_name,
        'Number of room': num_room,
        'lat long': latlong,
      });
    }
  }

  // Future signOut() {
  //   FirebaseAuth.instance.signOut();
  // }
}
