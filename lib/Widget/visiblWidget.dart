import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../list_of_barchart/tab_bar.dart';

class VisibleWidget extends StatefulWidget {
  const VisibleWidget({super.key});

  @override
  State<VisibleWidget> createState() => _VisibleWidgetState();
}

class _VisibleWidgetState extends State<VisibleWidget> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      TextButton(
        onPressed: (() {
          setState(() {
            isVisible = !isVisible;
          });
        }),
        child: const Text(
          'Open/Close',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // Visibility(
      //     visible: isVisible,
      Visibility(
          visible: isVisible,
          child: SizedBox(
            height: 250.0,
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 100,
                      childAspectRatio: 40,
                      crossAxisSpacing: 10),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.white),
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.dashboard,
                                    size: 30,
                                    color: Color.fromARGB(255, 54, 178, 194),
                                  ),

                                  Text('Item A',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    
                                  ),),
                                ],
                              ),
                              CarouselSlider(
                                items: [
                                  InkWell(
                                    child: Container(
                                      height: 250,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(11),
                                          color: Colors.white),
                                      child: Column(
                                        children: const [
                                          Text('Object A'),
                                        Text('6.75*C',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        ),)],
                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>
                                      const NewBar()
                                      )
                                      );
                                    },
                                  ),
                                  Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: Colors.white),
                                    child: Column(
                                      children: const [
                                        Text('Object B'),
                                      Text('9.75*C',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),)],
                                    ),
                                  ),
                                  Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: Colors.white),
                                    child: Column(
                                      children: const [
                                        Text('Object C'),
                                      Text('9.05*C',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),)],
                                    ),
                                  ),
                                ],
                                options: CarouselOptions(
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                      Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.white),
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.dashboard,
                                    size: 30,
                                    color: Color.fromARGB(255, 54, 178, 194),
                                  ),
                                  // SvgPicture.asset(
                                  //   "assets/svg/box 1.svg",
                                  //   alignment: Alignment.center,
                                  // ),

                                  Text('Item B',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    
                                  ),),
                                ],
                              ),
                              CarouselSlider(
                                items: [
                                  Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: Colors.white),
                                    child: Column(
                                      children: const [
                                        Text('Object A'),
                                      Text('6.75*C',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),)],
                                    ),
                                  ),
                                  Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: Colors.white),
                                    child: Column(
                                      children: const [
                                        Text('Object B'),
                                      Text('9.75*C',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),)],
                                    ),
                                  ),
                                  Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: Colors.white),
                                    child: Column(
                                      children: const [
                                        Text('Object C'),
                                      Text('9.05*C',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),)],
                                    ),
                                  ),
                                ],
                                options: CarouselOptions(
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ), Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.white),
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.dashboard,
                                    size: 30,
                                    color: Color.fromARGB(255, 54, 178, 194),
                                  ),
                                  // SvgPicture.asset(
                                  //   "assets/svg/box 1.svg",
                                  //   alignment: Alignment.center,
                                  // ),

                                  Text('Item C',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    
                                  ),),
                                ],
                              ),
                              CarouselSlider(
                                items: [
                                  Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: Colors.white),
                                    child: Column(
                                      children: const [
                                        Text('Object A'),
                                      Text('6.75*C',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),)],
                                    ),
                                  ),
                                  Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: Colors.white),
                                    child: Column(
                                      children: const [
                                        Text('Object B'),
                                      Text('9.75*C',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),)],
                                    ),
                                  ),
                                  Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: Colors.white),
                                    child: Column(
                                      children: const [
                                        Text('Object C'),
                                      Text('9.05*C',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),)],
                                    ),
                                  ),
                                ],
                                options: CarouselOptions(
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                     Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.white),
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.dashboard,
                                    size: 30,
                                    color: Color.fromARGB(255, 54, 178, 194),
                                  ),

                                  Text('Item D',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    
                                  ),),
                                ],
                              ),
                              CarouselSlider(
                                items: [
                                  Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: Colors.white),
                                    child: Column(
                                      children: const [
                                        Text('Object A'),
                                      Text('6.75*C',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),)],
                                    ),
                                  ),
                                  Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: Colors.white),
                                    child: Column(
                                      children: const [
                                        Text('Object B'),
                                      Text('9.75*C',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),)],
                                    ),
                                  ),
                                  Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(11),
                                        color: Colors.white),
                                    child: Column(
                                      children: const [
                                        Text('Object C'),
                                      Text('9.05*C',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),)],
                                    ),
                                  ),
                                ],
                                options: CarouselOptions(
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                     ],
                )),
          ))
    ]));
  }
}
