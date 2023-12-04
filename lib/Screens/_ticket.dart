import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled1/Screens/ticket%20_view.dart';
import 'package:untitled1/utils/app_styles.dart';

import '../utils/app_info_list.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    double h =  MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
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
          Gap(h*0.04),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(left: 20,),
              child: Column(
                children: flightList.map((Singleflight) => TicketView(flight: Singleflight)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
