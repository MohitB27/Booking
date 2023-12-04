import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled1/Screens/hotel_screen.dart';
import 'package:untitled1/Screens/ticket%20_view.dart';
import 'package:untitled1/utils/app_styles.dart';

import '../utils/app_info_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20 ),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome!!", style: Styles.headLineStyle3,),
                        const Gap(5),
                        Text("Book Tickets", style: Styles.headLineStyle,),
                      ],
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/img_3.jpg"),

                        ),
                      ),
                    ),
                  ],
                ),
                Gap(20),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(children: [
                        IconButton(onPressed: () => {
                          showSearch(context: context, delegate: Search())
                        },
                          icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                        ),
                        Text("Search        ", style: Styles.headLineStyle2.copyWith(color: Colors.blueGrey, fontStyle: FontStyle.italic))
                      ],
                      ),
                    ),
                  ],
                ),
                Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Upcoming Flights", style: Styles.headLineStyle2,),
                    InkWell(
                      onTap: (){
                        print("YOU ARE TAPPED");
                      },
                      child: Text("View All", style: Styles.textStyle.copyWith(color: Styles.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: flightList.map((Singleflight) => TicketView(flight: Singleflight)).toList(),
            ),
          ),
          const Gap(15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hotels", style: Styles.headLineStyle2,),
                InkWell(
                  onTap: (){
                    print("YOU ARE TAPPED");
                  },
                  child: Text("View All", style: Styles.textStyle.copyWith(color: Styles.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: hotelList.map((Singlehotel) => HotelScreen(hotel: Singlehotel)).toList(),
              ),
          ),
        ],
      ),
    );
  }
}

class Search extends SearchDelegate{
  List<String> searchTerms = [
    "Pune to  Narita",
    "NYC to Mumbai",
    "NYC to Thailand",
    "HANEDA to Hawaii",
    "Denmark to Wales",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var flight in searchTerms) {
      if (flight.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(flight);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var flight in searchTerms) {
      if (flight.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(flight);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

