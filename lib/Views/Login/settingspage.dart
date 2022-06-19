import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saratthi_consumer/Views/Login/preferencespage.dart';

class SettingsPage extends StatefulWidget {
  final Color givenBlue = HexColor('#314b5c');

  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SizedBox(
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: widget.givenBlue,
          child: const Icon(
            Icons.keyboard_arrow_left,
            size: 40,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 15,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/Images/settings_consumer.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Row(
              children: [
                Text(
                  'SETTINGS',
                  style: TextStyle(
                      fontSize: 15,
                      color: widget.givenBlue,
                      fontFamily: 'gillsans',
                      wordSpacing: 2),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                ),
                TextButton(
                  onPressed: () {  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFFAD02C),
                        fontFamily: 'gillsans',
                        wordSpacing: 2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                  child: Text('General',style: TextStyle(fontSize: 15,fontFamily: 'gillsans'),)),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2,top: 10,right: 10,bottom: 10),
                child: MaterialButton(
                  onPressed: () {  },
                  child: SizedBox(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Profile',style: TextStyle(fontSize: 15,fontFamily: 'gillsans'),),
                        Text('+91-9874569872',style: TextStyle(fontSize: 12,fontFamily: 'gillsans',color: Colors.black54),),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2,top: 10,right: 10,bottom: 10),
                child: MaterialButton(
                  onPressed: () {  },
                  child: SizedBox(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Favourites',style: TextStyle(fontSize: 15,fontFamily: 'gillsans'),),
                        Text('Manage favourites locations',style: TextStyle(fontSize: 12,fontFamily: 'gillsans',color: Colors.black54),),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2,top: 10,right: 10,bottom: 10),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PreferencesPage()));
                  },
                  child: SizedBox(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Preferences',style: TextStyle(fontSize: 15,fontFamily: 'gillsans'),),
                        Text('Manage preferences',style: TextStyle(fontSize: 12,fontFamily: 'gillsans',color: Colors.black54),),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2,top: 10,right: 10,bottom: 10),
                child: MaterialButton(
                  onPressed: () {  },
                  child: SizedBox(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Language',style: TextStyle(fontSize: 15,fontFamily: 'gillsans'),),
                        Text('Current English',style: TextStyle(fontSize: 12,fontFamily: 'gillsans',color: Colors.black54),),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2,top: 10,right: 10,bottom: 10),
                child: MaterialButton(
                  onPressed: () {  },
                  child: SizedBox(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('About',style: TextStyle(fontSize: 15,fontFamily: 'gillsans'),),
                        Text('Version:1.2.3',style: TextStyle(fontSize: 12,fontFamily: 'gillsans',color: Colors.black54),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
