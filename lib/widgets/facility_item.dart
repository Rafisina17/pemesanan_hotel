import 'package:pemesanan_hotel/theme.dart';
import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imgUrl;
  final int total;

  FacilityItem({this.imgUrl, this.name, this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imgUrl,
          width: 32,
        ),
        SizedBox(
          height: 28,
        ),
        Text.rich(TextSpan(
            text: "$total",
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                  text: " $name", style: greyTextStyle.copyWith(fontSize: 14))
            ])),
      ],
    );
  }
}
