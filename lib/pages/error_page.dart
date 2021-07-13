import 'package:pemesanan_hotel/pages/home_page.dart';
import 'package:pemesanan_hotel/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/error.png",
                width: 300,
              ),
              SizedBox(
                height: 70,
              ),
              Text("Where Are You Going ? ",
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                  )),
              SizedBox(
                height: 14,
              ),
              Text(
                "Seems like the page that you were\nrequested is already gone",
                style: greyTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 210,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false);
                  },
                  color: purpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Text(
                    "Back to Home",
                    style: whiteTextStyle.copyWith(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
