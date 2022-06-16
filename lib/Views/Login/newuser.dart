import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Helpers/change.dart';
import 'Home.dart';

class Design extends StatefulWidget {
  const Design({Key? key}) : super(key: key);

  @override
  State<Design> createState() => _DesignState();
}

class _DesignState extends State<Design> {
  final Color givenBlue = HexColor('#314b5c');
  List<Change2> car_detail = <Change2>[];
  List<Change> car_logo = <Change>[
    Change(
      image: 'assets/Car_Make-Brands/Audi.png',
      width: 1.0,
      changecolor: HexColor('#FFFFFF'),
    ),
    Change(
      image: 'assets/Car_Make-Brands/bmw.png',
      width: 1.0,
      changecolor: HexColor('#FFFFFF'),
    ),
    Change(
      image: 'assets/Car_Make-Brands/Ford.png',
      width: 1.0,
      changecolor: HexColor('#FFFFFF'),
    ),
    Change(
      image: 'assets/Car_Make-Brands/Honda.png',
      width: 1.0,
      changecolor: HexColor('#FFFFFF'),
    ),
    Change(
      image: 'assets/Car_Make-Brands/Hyundai.png',
      width: 1.0,
      changecolor: HexColor('#FFFFFF'),
    ),
    Change(
      image: 'assets/Car_Make-Brands/Kia.png',
      width: 1.0,
      changecolor: HexColor('#FFFFFF'),
    ),
    Change(
      image: 'assets/Car_Make-Brands/Maruti-Suzuki.png',
      width: 1.0,
      changecolor: HexColor('#FFFFFF'),
    ),
    Change(
      image: 'assets/Car_Make-Brands/mercedes.png',
      width: 1.0,
      changecolor: HexColor('#FFFFFF'),
    ),
    Change(
      image: 'assets/Car_Make-Brands/Tata.png',
      width: 1.0,
      changecolor: HexColor('#FFFFFF'),
    ),
    Change(
      image: 'assets/Car_Make-Brands/Toyota.png',
      width: 1.0,
      changecolor: HexColor('#FFFFFF'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: TextButton(
          onPressed: () {},
          child: Text(
            'BACK',
            style: TextStyle(
                color: givenBlue,
                fontWeight: FontWeight.w600,
                fontFamily: 'OPTICopperplate',
                fontSize: 15),
          )),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Grid.gridd(car_detail, givenBlue),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.463,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "Please let us known the cars you own so that \nright drivers can be sent to you.Tap and scroll",
                    style: TextStyle(
                        color: givenBlue,
                        fontFamily: 'gillsans',
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  )),
                  Center(
                      child: Text(
                    "to add cars.",
                    style: TextStyle(
                        color: givenBlue,
                        fontFamily: 'gillsans',
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  )),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    color: Colors.white,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: car_logo.length,
                      itemBuilder: (context, counter) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              primary: Colors.white,
                              minimumSize: const Size(10, 10),
                              maximumSize: const Size(50, 50),
                              padding: const EdgeInsets.all(0),
                              side: BorderSide(
                                  color: car_logo[counter].changecolor,
                                  width: car_logo[counter].width),
                            ),
                            onPressed: () {
                              setState(() {
                                car_logo[counter].changecolor =
                                    HexColor('#000000');
                                car_logo[counter].width = 3.0;
                                car_detail.add(
                                  Change2(
                                    image: car_logo[counter].image,
                                    changecolor: HexColor('#00FF00'),
                                  ),
                                );
                                car_detail.add(
                                  Change2(
                                    image: car_logo[counter].image,
                                    changecolor: HexColor('#808080'),
                                  ),
                                );
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                car_logo[counter].image,
                                width: 50,
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Home(logo: car_detail),
                      ));
                    },
                    child: SizedBox(
                      width: 130,
                      height: 40,
                      child: Center(
                        child: Text(
                          "COMPLETE",
                          style: TextStyle(
                              color: givenBlue,
                              fontSize: 14,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              fontFamily: "OPTICopperplate"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Grid {
  static Widget gridd(List car_detail, Color givenBlue) {
    if (car_detail.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
              child: Text(
            'Once you select, the cars will',
            style: TextStyle(
                fontSize: 15, fontFamily: 'gillsans', color: Colors.grey),
          )),
          Center(
              child: Text(
            'appear here',
            style: TextStyle(
                fontSize: 15, fontFamily: 'gillsans', color: Colors.grey),
          )),
        ],
      );
    }
    else {
      return GridView.builder(
        itemCount: car_detail.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2.8,
          mainAxisSpacing: 20,
          crossAxisSpacing: 30,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color.fromRGBO(128, 128, 128, 0.1),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset(
                    car_detail[index].image,
                    height: 40,
                    width: 40,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Image.asset(
                  'assets/Icons/001-gearshift.png',
                  color: car_detail[index].changecolor,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Image.asset(
                  'assets/Icons/002-options.png',
                  color: givenBlue,
                  height: 20,
                  width: 20,
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
