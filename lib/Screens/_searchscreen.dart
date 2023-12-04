import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled1/Screens/hotel_screen.dart';
import 'package:untitled1/Screens/ticket%20_view.dart';

import '../utils/app_info_list.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double h =  MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      blurRadius: 20,
                        offset: Offset(1, 1)
                    ),
                  ],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      label: const Text("Search" ),
                      prefixIcon: const Icon(Icons.search_rounded),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.white,
                        )
                      ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Colors.white,
                            )
                        ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                  ),
                ),
              ),
              Gap(h*0.06),
              Container(
                padding: EdgeInsets.only(left: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                    width: w*0.6,
                    height: AppLayout.getHeight(150),
                      child: Center(child: Text("Book Hotels", style: Styles.headLineStyle.copyWith(color: Colors.white),)),
                    decoration: BoxDecoration(
                    color: Styles.orangeColor,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                    BoxShadow(color: Colors.red, blurRadius: 2, spreadRadius: 1),
                    ],
                    ),
                    ),
                    Gap(w*0.05),
                    Container(
                      width: w*0.25,
                      height: AppLayout.getHeight(150),
                      child: Center(child: Text("Book Flights", style: Styles.headLineStyle.copyWith(color: Colors.white),)),
                      decoration: BoxDecoration(
                        color: Styles.orangeColor,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(color: Colors.red, blurRadius: 2, spreadRadius: 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(h*0.04),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: hotelList.map((Singlehotel) => HotelScreen(hotel: Singlehotel)).toList(),
                  ),
                ),
              Gap(h*0.06),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: flightList.map((Singleflight) => TicketView(flight: Singleflight)).toList(),
                ),
              ),
            ],
          ),
        ),
    ],
      ),
    );
  }
}
