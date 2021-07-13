import 'package:pemesanan_hotel/pages/home_page.dart';
import 'package:pemesanan_hotel/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/splash_wisata.png')),
          Padding(
            padding: EdgeInsets.only(top: 50, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 30),
                Text("HOTEL INDONESIA",
                    style: blackTextStyle.copyWith(fontSize: 24)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Pesan Hotel Sesuai Keinginanmu\nBanyak Tempat Menarik Yang Akan Kamu Nikmati",
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: 210,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    color: purpleColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17)),
                    child: Text(
                      "Find Now",
                      style: whiteTextStyle.copyWith(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
