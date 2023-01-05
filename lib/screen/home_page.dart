import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';

import '../Widget/visiblWidget.dart';
import '../itemsModal/items_data.dart';
import 'build_exapand.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(179, 6, 34, 197),
              Color.fromARGB(255, 122, 139, 194)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: initWidget(),
          ),
        ),
      ),
    );
  }
  Widget initWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        logo(),
        notify(),
        buildDate(),
        favoriteCategories(),
        visibWiget(),
        cheackStatus(),
       _buildExpandableTile(),
      ],
    );
  }

  Widget logo() {
    return Container(
      child: Center(
        child: SvgPicture.asset(
          "assets/svg/ethioStarLogo.svg",
          alignment: Alignment.center,
        ),
      ),
    );
  }

  Widget notify() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Positioned(
            child: Container(
          width: 0,
          height: 50,
          margin: const EdgeInsets.only(left: 0),
        )),

        const Text("Welcome Back ",
            style: TextStyle(color: Colors.white, fontSize: 32)),
        //notification
        IconButton(
          color: Colors.white,
          //alignment: Alignment.centerRight,
          icon: const Icon(Icons.notifications),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 192, 188, 188)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          IconButton(
                            //padding: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.topCenter,
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          ListTile(
                              horizontalTitleGap: 50,
                              
                              title: Text(
                                'DashBord',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                          ListTile(
                              horizontalTitleGap: 50,
                              title: Text(
                                'DashBord',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                          ListTile(
                              horizontalTitleGap: 50,
                              title: Text(
                                'DashBord',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),

        IconButton(
          color: Colors.white,
          icon: Icon(Icons.menu),
          onPressed: () {
            showModalSideSheet(
                width: 500,
                elevation: 8.0,
                context: context,
              //  ignoreAppBar: false,
                body: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 39, 72, 184)),
                  height: 900,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      ListTile(
                          horizontalTitleGap: 50,
                          leading: Icon(
                            Icons.desktop_windows_sharp,
                            size: 50,
                            color: Colors.white,
                          ),
                          title: Text(
                            'DashBord',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      ListTile(
                          horizontalTitleGap: 50,
                          leading: Icon(
                            Icons.settings,
                            size: 50,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Setting',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      ListTile(
                          horizontalTitleGap: 50,
                          leading: Icon(
                            Icons.support,
                            size: 50,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Support',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      ListTile(
                          horizontalTitleGap: 50,
                          leading: Icon(
                            Icons.report,
                            size: 50,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Authomatic Report',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ));
          },
          ),
        ],
    );
  }

  Widget buildDate() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Positioned(
              //position at top
              // top: 0,
              // left: 0,
              // right: 0, //set left right to 0 for 100% width
              child: Container(
            width: 20,
            height: 50,
            margin: const EdgeInsets.only(left: 20),
          )),
          const Text("Novambere ,24, 2022",
              style: TextStyle(
                  color: Colors.white,
                  //fontFamily: GoogleFonts.mulish().fontFamily,
                  fontSize: 12)),
        ]);
  }

  Widget favoriteCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, top: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
               Text(
                "Favorate",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // TextButton(
              //   onPressed: () {
              //     setState(() {
              //       isVisible = !isVisible;
              //     });
              //   },
              //   child: const Text(
              //     'open',
              //     style: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Widget visibWiget() {
    return VisibleWidget();
    // SizedBox(
    //     height: 280.0,
    //     child: Padding(
    //       padding: const EdgeInsets.all(20.0),
    //       child: Visibility(
    //         visible: isVisible,
    //         child: isOpen
    //             ? GridView(
    //                 padding: const EdgeInsets.symmetric(vertical: 0),
    //                 gridDelegate:
    //                     const SliverGridDelegateWithFixedCrossAxisCount(
    //                         crossAxisCount: 2,
    //                         mainAxisSpacing: 20,
    //                         mainAxisExtent: 100,
    //                         childAspectRatio: 40,
    //                         crossAxisSpacing: 15),
    //                 children: [
    //                   Container(
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(15),
    //                         color: Colors.white),
    //                     child: Column(
    //                       children: const [
    //                         Icon(
    //                           Icons.home,
    //                           size: 50,
    //                           color: Color.fromARGB(255, 54, 178, 194),
    //                         ),
    //                         Text('Home')
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(20),
    //                         color: Colors.white),
    //                     child: Column(
    //                       children: const [
    //                         Icon(
    //                           Icons.home,
    //                           size: 50,
    //                           color: Color.fromARGB(255, 54, 178, 194),
    //                         ),
    //                         Text('Home')
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(20),
    //                         color: Colors.white),
    //                     child: Column(
    //                       children: const [
    //                         Icon(
    //                           Icons.home,
    //                           size: 50,
    //                           color: Color.fromARGB(255, 54, 178, 194),
    //                         ),
    //                         Text('Home')
    //                       ],
    //                     ),
    //                   ),
    //                   Container(
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(20),
    //                         color: Colors.white),
    //                     child: Column(
    //                       children: const [
    //                         Icon(
    //                           Icons.home,
    //                           size: 50,
    //                           color: Color.fromARGB(255, 12, 69, 76),
    //                         ),
    //                         Text('Home')
    //                       ],
    //                     ),
    //                   )
    //                 ],
    //               )
    //             : Container(),
    //       ),
    //     ));
  
  }

  Widget cheackStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
        //  margin: const EdgeInsets.only(left: 20, top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Check Status",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExpandableTile() {
    return const Card(
      margin:  EdgeInsets.all(15),
      // padding: const EdgeInsets.all(5),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: ExpansionTile(
        title:  Text(
          'Rotgrupp',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        children: <Widget>[
          BuildExpandeds(),
        ]
      )
    );
     }}
    