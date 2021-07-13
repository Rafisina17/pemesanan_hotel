import 'package:pemesanan_hotel/models/city.dart';
import 'package:pemesanan_hotel/models/space.dart';
import 'package:pemesanan_hotel/models/tips.dart';
import 'package:pemesanan_hotel/providers/space_provider.dart';
import 'package:pemesanan_hotel/theme.dart';
import 'package:pemesanan_hotel/widgets/city_card.dart';
import 'package:pemesanan_hotel/widgets/space_card.dart';
import 'package:pemesanan_hotel/widgets/tips_card.dart';
import 'package:pemesanan_hotel/widgets/buttom_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: ListView(
            // NOTE: TITLE/HEADER
            children: [
              SizedBox(
                height: edge,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Find Hotel Now",
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Mencari Hotel Yang Nyaman",
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE: POPULAR CITIES
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Kota Populer",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    CityCard(City(
                        id: 1,
                        name: "Jakarta",
                        imageUrl: "assets/wisata_populer1.png")),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 2,
                        name: "Bandung",
                        imageUrl: "assets/wisata_populer2.png",
                        isPopular: true)),
                    SizedBox(
                      width: 20,
                    ),
                    CityCard(City(
                        id: 3,
                        name: "Surabaya",
                        imageUrl: "assets/wisata_populer3.png")),
                    SizedBox(
                      width: 24,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // NOTE: RECOMMENDED SPACE
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  "Rekomendasi Hotel Tersedia",
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: FutureBuilder(
                    future: spaceProvider.getRecommendedSpaces(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Space> data = snapshot.data;
                        int index = 0;

                        return Column(
                          children: data.map((item) {
                            index++;
                            return Container(
                              margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                              child: SpaceCard(item),
                            );
                          }).toList(),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )),
              // NOTE: TIPS N GUIDANCE
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 80 + edge,
              ),
            ],
          )),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
            color: Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: "assets/icon_home.png",
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: "assets/icon_email.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/icon_card.png",
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: "assets/icon_love.png",
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
