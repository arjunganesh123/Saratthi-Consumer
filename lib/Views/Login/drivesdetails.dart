import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DrivesDetails extends StatefulWidget {

  const DrivesDetails({Key? key}) : super(key: key);

  @override
  State<DrivesDetails> createState() => _DrivesDetailsState();
}

class _DrivesDetailsState extends State<DrivesDetails> {
  var _myColorOne = Colors.grey;
  var _myColorTwo = Colors.grey;
  var _myColorThree = Colors.grey;
  var _myColorFour = Colors.grey;
  var _myColorFive = Colors.grey;
  final Color givenBlue = HexColor('#314b5c');

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
          backgroundColor: givenBlue,
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
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.22,
                  bottom: MediaQuery.of(context).size.height * 0.06),
              child: Text(
                'DRIVERS DETAILS',
                style: TextStyle(
                    color: givenBlue,
                    fontSize: 12,
                    fontFamily: 'OPTICopperplate'),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                primary: Colors.white,
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {},
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
                            color: givenBlue,
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
          ),
          const Padding(
              padding: EdgeInsets.only(left: 15,top: 10,bottom: 5),
              child: Text('Drive ID:\t\t\t\t'+'12364758936475',style: TextStyle(color: Colors.grey,fontFamily: 'gillsans',fontSize: 15),)),
          const Padding(
              padding: EdgeInsets.only(left: 15,top: 5,bottom: 5),
              child: Text('Start time:\t\t'+'12 Feb,2022 1 PM',style: TextStyle(color: Colors.grey,fontFamily: 'gillsans',fontSize: 15),)),
          const Padding(
              padding: EdgeInsets.only(left: 15,top: 5,bottom: 10),
              child: Text('End time:\t\t\t\t'+'12 Feb,2022 3:23 PM',style: TextStyle(color: Colors.grey,fontFamily: 'gillsans',fontSize: 15),)),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10,left: 5,right: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                       CircleAvatar(
                         radius: 40,
                         child: Image.asset('assets/Icons/061-driver-1.png',fit: BoxFit.fitWidth,),
                       ),
                       Column(
                        children: const [
                          SizedBox(height: 7,),
                          Text('Surendar Joshi',style: TextStyle(color: Colors.black87,fontSize: 15,fontFamily: 'gillsans'),),
                          Text('36 yrs\t\t\t'+'double vaccine',style: TextStyle(color: Colors.grey,fontSize: 10,fontFamily: 'gillsans'),),
                        ],
                      ),
                       const SizedBox(width: 20,),
                       IconButton(
                         padding: EdgeInsets.zero,
                         constraints: const BoxConstraints(),
                         icon: const Icon(Icons.star,size: 20,),
                         onPressed: ()=>setState((){
                           _myColorOne=Colors.orange;
                           _myColorTwo=Colors.grey;
                           _myColorThree=Colors.grey;
                           _myColorFour=Colors.grey;
                           _myColorFive=Colors.grey;
                         }),color: _myColorOne,),
                       IconButton(icon:  const Icon(Icons.star,size: 20,),
                         padding: EdgeInsets.zero,
                         constraints: const BoxConstraints(),
                         onPressed: ()=>setState((){
                           _myColorOne=Colors.orange;
                           _myColorTwo=Colors.orange;
                           _myColorThree=Colors.grey;
                           _myColorFour=Colors.grey;
                           _myColorFive=Colors.grey;
                         }),color: _myColorTwo,),
                       IconButton(
                         padding: EdgeInsets.zero,
                         constraints: const BoxConstraints(),
                         icon: const Icon(Icons.star,size: 20,), onPressed: ()=>setState((){
                         _myColorOne=Colors.orange;
                         _myColorTwo=Colors.orange;
                         _myColorThree=Colors.orange;
                         _myColorFour=Colors.grey;
                         _myColorFive=Colors.grey;
                       }),color: _myColorThree,),
                       IconButton(
                         padding: EdgeInsets.zero,
                         constraints: const BoxConstraints(),
                         icon: const Icon(Icons.star,size: 20,), onPressed: ()=>setState((){
                         _myColorOne=Colors.orange;
                         _myColorTwo=Colors.orange;
                         _myColorThree=Colors.orange;
                         _myColorFour=Colors.orange;
                         _myColorFive=Colors.grey;
                       }),color: _myColorFour,),
                       IconButton(
                         padding: EdgeInsets.zero,
                         constraints: const BoxConstraints(),
                         icon: const Icon(Icons.star,size: 20,), onPressed: ()=>setState((){
                         _myColorOne=Colors.orange;
                         _myColorTwo=Colors.orange;
                         _myColorThree=Colors.orange;
                         _myColorFour=Colors.orange;
                         _myColorFive=Colors.orange;
                       }),color: _myColorFive,),
                    ],

                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '25 kms',
                        style: TextStyle(color: Colors.black45,fontSize: 20,fontFamily: 'gillsans'),
                      ),
                      const SizedBox(width: 50,),
                      Container(
                        height: 70,width: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 30,),
                      const Text(
                        '2 hrs 23 min',
                        style: TextStyle(color: Colors.black45,fontSize: 20,fontFamily: 'gillsans'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(15),
              child: Text('Check ticket history for the drive',style: TextStyle(color: Colors.blue,fontSize: 15,fontFamily: 'gillsans'),)),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.12,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/Icons/032-chat-box.png',
                            width: 20,
                            height: 20,
                          ),
                          const Text(
                            'Facing issues? Get help',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'View all tickets',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}