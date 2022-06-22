import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class planJourney extends StatefulWidget {
  const planJourney({Key? key}) : super(key: key);

  @override
  State<planJourney> createState() => _planJourneyState();
}

class _planJourneyState extends State<planJourney> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var givenBlue = const Color(0xFF314b5c);
    var givenBg = const Color(0xFFF7F7F7);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: h * .325,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 12.0,
                        spreadRadius: .5,
                        offset: Offset(0.7, 0.7),
                      )
                    ]),
                child: Column(children: [
                  const SizedBox(
                    height: 1.0,
                  ),
                  Container(
                    width: .99 * w,
                    height: .1 * h,
                    decoration: BoxDecoration(
                      color: givenBg,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Icons/014-telephone-call.png",
                          height: 30,
                          width: 30,
                          color: givenBlue,
                        ),
                        SizedBox(
                          width: w * .03,
                        ),
                        Text(
                          "Call",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'gillsans',
                              color: givenBlue),
                        ),
                        SizedBox(width: w * .12),
                        Image.asset(
                          "assets/Icons/016-chat.png",
                          height: 30,
                          width: 30,
                          color: givenBlue,
                        ),
                        SizedBox(
                          width: w * .03,
                        ),
                        Text(
                          "Message",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'gillsans',
                              color: givenBlue),
                        ),
                        SizedBox(width: w * .12),
                        Text(
                          "PIN\n1234",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'gillsans',
                              color: givenBlue),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: .99 * w,
                    height: .23 * h,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/Icons/061-driver-1.png",
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Surendra Joshi\n36yrs    Double Vaccine",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontFamily: 'gillsans',
                                      fontWeight: FontWeight.bold,
                                      color: givenBlue),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 15,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * .07,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "4min\nAway",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'gillsans',
                                    fontWeight: FontWeight.bold,
                                    color: givenBlue),
                              ),
                              VerticalDivider(
                                color: givenBlue,
                                thickness: 2,
                              ),
                              Text(
                                "On Way",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'gillsans',
                                    fontWeight: FontWeight.bold,
                                    color: givenBlue),
                              ),
                              VerticalDivider(
                                color: givenBlue,
                                thickness: 2,
                                width: 10,
                              ),
                              Text(
                                "- Hrs\nService",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'gillsans',
                                    fontWeight: FontWeight.bold,
                                    color: givenBlue),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ])),
          )
        ],
      ),
    );
  }
}
