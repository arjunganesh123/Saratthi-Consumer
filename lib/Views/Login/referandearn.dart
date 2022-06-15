import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saratthi_consumer/Helpers/change.dart';

class ReferAndEarn extends StatelessWidget {
  List<Refer> refer=<Refer>[Refer(image: 'assets/Images/coupon_consumer.png'),Refer(image: 'assets/Images/gift-card_consumer.png'),Refer(image: 'assets/Images/gift-card_consumer.png'),Refer(image: 'assets/Images/coupon_consumer.png'),Refer(image: 'assets/Images/coupon_consumer.png'),];
  ReferAndEarn({Key? key}) : super(key: key);
  final Color givenBlue = HexColor('#314b5c');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: SizedBox(
          height: 40,width: 40,
          child: FloatingActionButton(
            onPressed: () { Navigator.pop(context); },
            backgroundColor:givenBlue,
            child: const Icon(Icons.keyboard_arrow_left,size: 40,),),),
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
              child: Image.asset('assets/Images/refer-earn_consumer.png',fit: BoxFit.fill,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 20),
              child: Text('REFER AND WIN',style: TextStyle(fontSize: 15,color: givenBlue,fontFamily: 'gillsans',wordSpacing: 2),)),
          Padding(
            padding: const EdgeInsets.only(left: 15,top: 10,bottom: 30),
            child: Card(
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.06,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Image.asset('assets/Icons/024-gift-box.png',width: 20,height: 20,color: givenBlue,),
                    const SizedBox(width: 20,),
                    const Text('Invite Friends And Family on Saathi',style: TextStyle(fontSize: 15,fontFamily: 'Luxia Regular',color: Colors.blue),),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
            height: MediaQuery.of(context).size.height*0.5,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: refer.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 2,
            ),
              itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5,
                    child: Container(
                          decoration: BoxDecoration(
                          border: Border.all(color:givenBlue,width: 4.0),
                        ),
                        child: Image.asset(refer[index].image,fit: BoxFit.cover,)),
                  );
        },
      ),
          ),
        ],
      ),
    );
  }
}
