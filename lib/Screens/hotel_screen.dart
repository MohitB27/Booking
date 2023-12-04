import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled1/utils/app_layout.dart';
import 'package:untitled1/utils/app_styles.dart';


class HotelScreen extends StatelessWidget {
  final Map<String, dynamic>hotel;
  const HotelScreen({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Hotel price is ${hotel["price"]}');
    final size = AppLayout.getSize(context);

    return Container(
      width: size.width*0.6,
      height: AppLayout.getHeight(350),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(right: 17, top: 5),
      decoration: BoxDecoration(
        color: Styles.primaryColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.red, blurRadius: 2, spreadRadius: 1),
        ],
      ),
      child: Column(
        children: [
          Container(
            height:AppLayout.getHeight(180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Styles.primaryColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/${hotel["image"]}"),
              ),
            ),
          ),
          const Gap(10),
          Text("${hotel["place"]}", style: Styles.headLineStyle2.copyWith(color: Styles.hotelText),),
          Text("${hotel["destination"]}", style: Styles.headLineStyle3.copyWith(color: Colors.white),),
          Text("Rs.${hotel["price"]}/night", style: Styles.headLineStyle.copyWith(color: Styles.hotelText),),
        ],
      ),
    );
  }
}
