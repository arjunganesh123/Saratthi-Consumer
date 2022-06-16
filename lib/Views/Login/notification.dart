import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationPage extends StatefulWidget {
  int listnumber=6;
  final Color givenBlue = HexColor('#314b5c');
  NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SizedBox(
        height: 40,width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () { Navigator.pop(context); },
              backgroundColor:widget.givenBlue,
              child: const Icon(Icons.keyboard_arrow_left,size: 40,),),
            SizedBox(width: MediaQuery.of(context).size.width*0.65,),
            IconButton(onPressed: () {
              setState(() {
                  showMenu<String>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    context: context,
                    position: const RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
                    items: [
                      const PopupMenuItem<String>(
                          value: 'clear',
                          child: Text('Clear All',style: TextStyle(color: Colors.blue,fontFamily: 'gillsans'),)),
                    ],
                    elevation: 8.0,
                  ).then<void>((String? itemSelected) {
                    if (itemSelected == null) return;
                    if (itemSelected=='clear') { setState(() {
                      widget.listnumber=0;
                    });}
                  });
                }
                );
            },
            icon: Image.asset('assets/Icons/036-menu.png',),
            )
          ],
        ),),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 10,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.25,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset('assets/Images/notifications_consumer.png',fit: BoxFit.fill,),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Text('NOTIFICATIONS',style: TextStyle(fontSize: 15,color: widget.givenBlue,fontFamily: 'gillsans',wordSpacing: 2),),
          ),
          const SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.6,
            color: Colors.white,
            child: listnotification(widget.listnumber),
          ),
        ],
      ),
    );
  }
  Widget listnotification(int value){
    if(value==0){
      return Center(child: Text('No Notifications',style: TextStyle(color: Colors.grey,fontSize: 25,fontFamily: 'gillsans'),),);
    }
    else{
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.listnumber,
        itemBuilder: (context, counter) {
          return Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                primary: Colors.white,
                padding: const EdgeInsets.all(0),
              ), onPressed: () {  },
              child: Container(
                padding: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height*0.2,width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/Icons/038-notification-bell-1.png',width: 30,height: 30,),
                          SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                          const Text('This is the heading(60 Chars)',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17,fontFamily: 'gillsans'),)
                        ],
                      ),
                      const SizedBox(height: 20,),
                      const Padding(
                          padding: EdgeInsets.only(left: 20,right: 10),
                          child: Text('It is a body of the notification and it will be \nof 2 lines.',style: TextStyle(color: Colors.black,fontSize: 17,fontFamily: 'gillsans'),)),
                      const SizedBox(height: 20,),
                      const Padding(
                          padding: EdgeInsets.only(left: 20,right: 10),
                          child: Text('2 hrs  ago',style: TextStyle(color: Colors.grey,fontSize: 15,fontFamily: 'gillsans'),)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}


