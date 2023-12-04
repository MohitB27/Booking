import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:untitled1/Widgets/thick_container.dart';
import 'package:untitled1/utils/app_layout.dart';
import 'package:untitled1/utils/app_styles.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic>flight;
  const TicketView({Key? key, required this.flight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width*0.85,
      height: AppLayout.getHeight(200),
      child: Container(
        margin: EdgeInsets.only(right: 16,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*blue part of card*/
            Container(
              decoration:  BoxDecoration(
                color: Color(0xFF526799),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(21),), topRight: Radius.circular(21)),
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16),),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("${flight["place1"]}", style: Styles.headLineStyle3.copyWith(color: Colors.white),),

                      const Spacer(),
                      ThickCont(),
                      Expanded(
                          child: Stack(
                            children: [
                              SizedBox(
                              height: AppLayout.getHeight(24),
                              child: LayoutBuilder(

                                builder: (BuildContext , BoxConstraints ) {
                                  print("The Width is ${BoxConstraints.constrainWidth()}");
                                  return Flex(direction: Axis.horizontal,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate((BoxConstraints.constrainWidth()/6).floor(), (index) => SizedBox(
                                      width: 3, height: 1, child: DecoratedBox(decoration: BoxDecoration(color: Colors.white),),
                                    )),
                                  );
                                },
                              ),
                            ),
                              Center(child: Transform.rotate(angle: 1.5, child: Icon(Icons.local_airport_rounded, color: Colors.white,),)),
                        ],
                          ),
                      ),
                      ThickCont(),
                      const Spacer(),
                      Text("${flight["place2"]}", style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                    ],
                  ),
                  Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text("${flight["destination1"]}", style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                      ),
                      Text("${flight["duration"]}", style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                      SizedBox(
                        width: 100,
                        child: Text("${flight["destination2"]}", textAlign: TextAlign.end ,style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                      ),
                    ],
                  ),
                ],
              ) 
            ),
            /*red part of card*/
            Container(
              color: Styles.orangeColor,
              child: Row(
                children: [
                    SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: LayoutBuilder(
                        builder: (BuildContext , BoxConstraints ) {
                          return Flex(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            direction: Axis.horizontal,
                            children: List.generate((BoxConstraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                              width: 5, height: 1,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                          );
                      },

                  ),
                    ),
                  ),
                   SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*bottom red part of card*/
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF37B67),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(21), bottomRight: Radius.circular(21)),
              ),
              padding: const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${flight["date"]}", style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          const Gap(5),
                          Text("Date", style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${flight["time"]}", style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          const Gap(5),
                          Text("Departure Time", style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("${flight["seat"]}", style: Styles.headLineStyle3.copyWith(color: Colors.white),),
                          const Gap(5),
                          Text("Number", style: Styles.headLineStyle4.copyWith(color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
