import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Support extends StatelessWidget {
  final Color givenBlue = HexColor('#314b5c');
  final List<String> text=<String>['Safety & security','Billing','Services','Account & App','Referral','Payment Method'];
  Support({Key? key}) : super(key: key);

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
          Card(
            elevation: 15,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/Images/support_consumer.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'SUPPORT',
              style: TextStyle(
                  fontSize: 15,
                  color: givenBlue,
                  fontFamily: 'gillsans',
                  wordSpacing: 2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5, bottom: 10),
            child: Card(
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Icons/006-loupe.png',
                      width: 20,
                      height: 20,
                      color: givenBlue,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'Search issues',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Luxia Regular',
                          color: Colors.black38),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              children: [
                Text(
                  'Your Last Booking',
                  style: TextStyle(color: givenBlue),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                const Text(
                  'View All',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ),
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
          Padding(
              padding: const EdgeInsets.only(left: 15,top: 5,bottom: 5),
              child: Text('FAQ\'s',style: TextStyle(color: givenBlue,fontSize: 15),)),
          Container(
            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5),
            height: MediaQuery.of(context).size.height*0.25,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount:6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                    ),
                    primary: Colors.white,
                    padding: const EdgeInsets.all(0),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.08,),
                        Container(width: MediaQuery.of(context).size.width,height: 1,color: Colors.black,),
                        const SizedBox(height: 5,),
                        Text(text[index],style: TextStyle(fontSize: 10,color: givenBlue),),
                      ],
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
