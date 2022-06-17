import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PaymentsPage extends StatefulWidget {
  PaymentsPage({Key? key}) : super(key: key);
  final Color givenBlue = HexColor('#314b5c');
  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: widget.givenBlue,
        child: const Icon(
          Icons.keyboard_arrow_left,
          size: 40,
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
                'assets/Images/payments_consumer.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'PAYMENTS',
              style: TextStyle(
                  fontSize: 15,
                  color: widget.givenBlue,
                  fontFamily: 'gillsans',
                  wordSpacing: 2,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Preferred',
                  style: TextStyle(
                      fontSize: 15,
                      color: widget.givenBlue,
                      fontFamily: 'gillsans',
                      wordSpacing: 2,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/Wallets/paytm.png',
                      width: 35,
                      height: 35,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'PayTm',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Wallet  +  Post Paid',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                    ),
                    Image.asset(
                      'assets/Icons/027-link.png',
                      width: 20,
                      height: 20,
                      color: Colors.lightGreen,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/Wallets/amazon-pay.png',
                      width: 35,
                      height: 35,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Amazon Pay',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Wallet  +  Post Paid',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.33,
                    ),
                    Image.asset(
                      'assets/Icons/027-link.png',
                      width: 20,
                      height: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.28,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pay Later',
                  style: TextStyle(
                      fontSize: 15,
                      color: widget.givenBlue,
                      fontFamily: 'gillsans',
                      wordSpacing: 2,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/Wallets/lazy-pay.png',
                      width: 35,
                      height: 35,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    const Text(
                      'Lazy Pay',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.48,
                    ),
                    Image.asset(
                      'assets/Icons/027-link.png',
                      width: 20,
                      height: 20,
                      color: Colors.lightGreen,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/Wallets/simpl.png',
                      width: 35,
                      height: 35,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    const Text(
                      'Simpl',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.53,
                    ),
                    Image.asset(
                      'assets/Icons/027-link.png',
                      width: 20,
                      height: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/Icons/035-qr-code.png',
                      width: 35,
                      height: 35,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Pay At Drop',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Pay cashless - scan QR code',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.18,
                    ),
                    Image.asset(
                      'assets/Icons/027-link.png',
                      width: 20,
                      height: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 30, top: 10, bottom: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Others',
                  style: TextStyle(
                      fontSize: 15,
                      color: widget.givenBlue,
                      fontFamily: 'gillsans',
                      wordSpacing: 2,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/Icons/034-money.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Cash',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Default Payment',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.30,
                    ),
                    Image.asset(
                      'assets/Icons/027-link.png',
                      width: 20,
                      height: 20,
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
