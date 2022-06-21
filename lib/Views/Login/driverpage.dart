import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saratthi_consumer/Views/Login/drivesdetails.dart';

class DriverPage extends StatefulWidget {
  final Color givenBlue = HexColor('#314b5c');
  DriverPage({Key? key}) : super(key: key);

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  int listnumber=10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SizedBox(
        height: 40,
        child: FloatingActionButton(
          onPressed: () { Navigator.pop(context); },
          backgroundColor:widget.givenBlue,
          child: const Icon(Icons.keyboard_arrow_left,size: 40,),),),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 15,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.25,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset('assets/Images/drives_consumer.png',fit: BoxFit.cover,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 20),
            child: Row(
              children: [
                Text('DRIVES',style: TextStyle(fontSize: 15,color: widget.givenBlue,fontFamily: 'gilconst lsans',wordSpacing: 2),),
                const SizedBox(width: 150,),
                const Text('ONGOING DRIVE',style: TextStyle(fontSize: 10,color: Colors.blue,fontFamily: 'OPTICopperplate',wordSpacing: 1),),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.65,
            color: Colors.white,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: listnumber,
              itemBuilder: (context, counter) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: Colors.white,
                      padding: const EdgeInsets.all(0),
                    ),
                    onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DrivesDetails()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/Car_Make-Brands/Ford.png',
                                  width: 30,
                                  height: 30,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.02,
                                ),
                                const Text(
                                  '12 Feb 2022',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 10,
                                      fontFamily: 'gillsans'),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'PayTm',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 10,
                                          fontFamily: 'gillsans'),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/Icons/028-rupee.png',
                                          width: 17,
                                          height: 17,
                                        ),
                                        const Text(
                                          '567',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: 'gillsans'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Image.asset(
                                  'assets/Icons/030-download.png',
                                  width: 17,
                                  height: 17,
                                  color: widget.givenBlue,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.green,
                                    ),
                                    Container(
                                      color: Colors.black45,
                                      height: 35,
                                      width: 2,
                                    ),
                                    const CircleAvatar(
                                      radius: 5.0,
                                      backgroundColor: Colors.red,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.03,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '''I,street Address,Main Road Address,Landmark,State,\nPin-234567,New Delhi''',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      'I,street Address,Main Road Address,Landmark,State,\nPin-234567,New Delhi',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
