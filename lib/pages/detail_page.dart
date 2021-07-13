import 'package:pemesanan_hotel/models/space.dart';
import 'package:pemesanan_hotel/pages/error_page.dart';
import 'package:pemesanan_hotel/theme.dart';
import 'package:pemesanan_hotel/widgets/facility_item.dart';
import 'package:pemesanan_hotel/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;
  DetailPage(this.space);
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                space.imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 328,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                        color: whiteColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        //NOTE: TITLE
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    space.name,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text.rich(TextSpan(
                                      text: "\$${space.price}",
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                      children: [
                                        TextSpan(
                                            text: " / month",
                                            style: greyTextStyle.copyWith(
                                                fontSize: 16))
                                      ])),
                                ],
                              ),
                              Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: RatingItem(
                                      index: index,
                                      rating: space.rating,
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        // NOTE: MAIN FACILITIES
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            "Main Facilities",
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: edge,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                name: 'kitchen',
                                imgUrl: 'assets/icon_kitchen.png',
                                total: space.numberOfKitchens,
                              ),
                              FacilityItem(
                                name: 'bathroom',
                                imgUrl: 'assets/icon_bathroom.png',
                                total: space.numberOfBedrooms,
                              ),
                              FacilityItem(
                                name: 'cupcoard',
                                imgUrl: 'assets/icon_cupboard.png',
                                total: space.numberOfCapboards,
                              ),
                            ],
                          ),
                        ),
                        // NOTE: PHOTO
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            "Photos",
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                            height: 88,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: space.photos.map((item) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 24),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.network(
                                        item,
                                        width: 110,
                                        height: 88,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                }).toList())),
                        SizedBox(
                          height: 30,
                        ),
                        // NOTE: LOCATION
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            "Location",
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${space.address}\n${space.city}",
                                style: greyTextStyle,
                              ),
                              InkWell(
                                onTap: () {
                                  //   launchUrl(
                                  //       'https://goo.gl/maps/UfrsQjvwW6TzvdRw7');
                                  launch(space.mapUrl);
                                },
                                child: Image.asset(
                                  "assets/btn_map.png",
                                  width: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: edge),
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          child: RaisedButton(
                            onPressed: () {
                              launch("tel:${space.phone}");
                            },
                            color: purpleColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)),
                            child: Text(
                              "Book Now",
                              style: whiteTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/btn_back.png',
                        width: 40,
                      ),
                    ),
                    Image.asset(
                      'assets/btn_wishlist.png',
                      width: 40,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
