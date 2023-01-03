import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_side_sheet/modal_side_sheet.dart';

import '../itemsModal/items_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String itemName;
 Future<List<ItemsList>>_getItemsList()async{
  final String res= await rootBundle.loadString('assets/jsonfile/itemsList.json');
    final data =await json.decode(res);
  print("object");
itemName=data[0]["itam"][0]["item_name"];
print(data[0]["itam"][0]["item_name"]);
List<ItemsList>items=[];
for (var u in data) {
  ItemsList itemsList=ItemsList(u["itam"]);
  items.add(itemsList);
  
}
print("kkkkkkkkkkkkkkkkk"+items.length.toString());
return items;
 }
   @override
   void initState(){
    _getItemsList();
   }
 
  List _items=[];
  Future<void> readJsonFile() async{
    final String res= await rootBundle.loadString('assets/jsonfile/itemsList.json');
    final data =await json.decode(res);
    setState(() {
      _items=data['itam'];
    });
  }
  bool isVisible = false;
  bool isOpen = false;
  Widget closeBtn() {
    return TextButton(
      onPressed: () {
        setState(() {
          isOpen = false;
        });
      },
      child: const Text("Close"),
    );
  }

  Widget openBtn() {
    return TextButton(
      onPressed: () {
        setState(() {
          isOpen = true;
        });
      },
      child: const Text("Open"),
    );
  }

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

  void visible() {
    setState(() {
      isVisible = !isVisible;
    });
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
    return Center(
      child: SvgPicture.asset(
        "assets/svg/ethioStarLogo.svg",
        alignment: Alignment.center,
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
                ignoreAppBar: false,
                body: Container(
                  // margin: const EdgeInsets.only(left: 20, top: 7),
                  // margin: const EdgeInsets.all(25),
                  // padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 39, 72, 184)),
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
                  // Icon(Icons.settings),
                  // title: Text('this all about the man'),
                  //  trailing: Icon(Icons.safety_divider),
                ));
          },
          // child: Text("Show Modal Side Sheet")
        ),

        // IconButton(
        //     color: Colors.white,
        //     //alignment: Alignment.centerRight,
        //     icon: const Icon(Icons.menu),
        //     onPressed: () {
        //       showModalSideSheet<void>(
        //         context: context,
        //         builder: (BuildContext context) {
        //           return Container(
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(15),
        //                 color: Color.fromARGB(255, 109, 106, 106)),
        //             height: 900,
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               // mainAxisSize: MainAxisSize.max,
        //               children: <Widget>[
        //                 IconButton(
        //                   //padding: const EdgeInsets.symmetric(horizontal: 10),
        //                   alignment: Alignment.topCenter,
        //                   icon: const Icon(Icons.close),
        //                   onPressed: () => Navigator.pop(context),
        //                 ),

        //               ],
        //             ),
        //           );
        //         },
        //       );
        //     },
        //   ),
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
          margin: const EdgeInsets.only(left: 20, top: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Favorate",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: const Text(
                  'open',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget visibWiget() {
    return SizedBox(
        height: 280.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Visibility(
            visible: isVisible,
            child: isOpen
                ? GridView(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 100,
                            childAspectRatio: 40,
                            crossAxisSpacing: 15),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.home,
                              size: 50,
                              color: Color.fromARGB(255, 54, 178, 194),
                            ),
                            Text('Home')
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.home,
                              size: 50,
                              color: Color.fromARGB(255, 54, 178, 194),
                            ),
                            Text('Home')
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.home,
                              size: 50,
                              color: Color.fromARGB(255, 54, 178, 194),
                            ),
                            Text('Home')
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.home,
                              size: 50,
                              color: Color.fromARGB(255, 54, 178, 194),
                            ),
                            Text('Home')
                          ],
                        ),
                      )
                    ],
                  )
                : Container(),
          ),
        ));
  }

  Widget cheackStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 0),
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
    return Container(
          child: FutureBuilder(future: _getItemsList(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if (snapshot.data == null) {
              return Container(
                child: Text("Lodding..."),
              );
            }else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder:(BuildContext context,int index){
          
                return ListTile(
                  title: Text(itemName),
                );
              } );
          }}
          ));
    //  Card(
    //   margin: const EdgeInsets.all(15),
    //   // padding: const EdgeInsets.all(5),
    //   // decoration: BoxDecoration(
    //   //     borderRadius: BorderRadius.circular(20), color: Colors.white),
    //   child: ExpansionTile(
    //     title: const Text(
    //       'Rotgrupp',
    //       style: TextStyle(
    //         fontSize: 25,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //     ),
    //     children: <Widget>[
    //     //  const Card(
    //     //     shadowColor: Colors.grey,
    //     //     margin:  EdgeInsets.all(5),
    //     //    // padding: const EdgeInsets.all(0),
    //     //     // decoration: BoxDecoration(
    //     //     //     borderRadius: BorderRadius.circular(20),
    //     //     //     color: Colors.white,),
    //         ExpansionTile(
    //           title: const Text(
    //             'XXXxxx',
    //             style: TextStyle(
    //               fontSize: 15,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.black,
    //             ),
    //           ),
              
    //           children: [
    //             if (_items.isNotEmpty) ListView.builder(
    //               itemCount: _items.length,
    //               itemBuilder: (BuildContext context,index){
    //                 return Card(
    //                   child: ListTile(
                        
    //                     title: Text(_items[index].item_name),
    //                   ),
    //                 );
    //               }
    //               ) else const Text('Pleas fill the data')
    //           ],
    //           // children: <Widget>[


                
    //           //   // Card(
    //           //   //    margin:  EdgeInsets.all(5),
    //           //   //   // padding: const EdgeInsets.all(0),
    //           //   //   // decoration: BoxDecoration(
    //           //   //   //   borderRadius: BorderRadius.circular(20),
    //           //   //   //   color: Colors.white,
    //           //   //   // ),
    //           //   //   child:  ListTile(
    //           //   //     title: Text(
    //           //   //       'This is tile number 1',
    //           //   //     ),
    //           //   //   ),
    //           //   // ),
    //           //   //  Card(
    //           //   //   margin:  EdgeInsets.all(5),
    //           //   //   // padding: const EdgeInsets.all(0),
    //           //   //   // decoration: BoxDecoration(
    //           //   //   //   borderRadius: BorderRadius.circular(20),
    //           //   //   //   color: Colors.white,
    //           //   //   // ),
    //           //   //   child:  ListTile(
    //           //   //     title: Text(
    //           //   //       'This is tile number 1',
    //           //   //     ),
    //           //   //   ),
    //           //   // ),
    //           //   // Card(
    //           //    // margin:  EdgeInsets.all(5),
    //           //     // padding: const EdgeInsets.all(0),
    //           //     // decoration: BoxDecoration(
    //           //     //   borderRadius: BorderRadius.circular(20),
    //           //     //   color: Colors.white,
    //           //    // ),
    //           //   //   child:  ListTile(
    //           //   //  //   title: Text(
    //           //   //       'This is tile number 1',
    //           //   //     ),
    //           //   //   ),
    //           //   // ),
    //           // ],
        
    //         ),
          
    //      Card(
    //         margin: const EdgeInsets.all(5),
    //         // padding: const EdgeInsets.all(0),
    //         // decoration: BoxDecoration(
    //         //     borderRadius: BorderRadius.circular(20),
    //         //     color: Color.fromARGB(255, 175, 172, 172)),
    //         child: ExpansionTile(
    //           title: const Text(
    //             'VVVvvv',
    //             style: TextStyle(
    //               fontSize: 15,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.black,
    //             ),
    //           ),
    //           children: <Widget>[
    //             Container(
    //               margin: const EdgeInsets.all(5),
    //               padding: const EdgeInsets.all(0),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //                 color: Colors.white,
    //               ),
    //               child: const ListTile(
    //                 title: Text(
    //                   'This is tile number 1',
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               margin: const EdgeInsets.all(5),
    //               padding: const EdgeInsets.all(0),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //                 color: Colors.white,
    //               ),
    //               child: const ListTile(
    //                 title: Text(
    //                   'This is tile number 1',
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               margin: const EdgeInsets.all(5),
    //               padding: const EdgeInsets.all(0),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //                 color: Colors.white,
    //               ),
    //               child: const ListTile(
    //                 title: Text(
    //                   'This is tile number 1',
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         margin: const EdgeInsets.all(5),
    //         padding: const EdgeInsets.all(0),
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20),
    //             color: const Color.fromARGB(255, 175, 172, 172)),
    //         child: ExpansionTile(
    //           title: const Text(
    //             'VVVvvv',
    //             style: TextStyle(
    //               fontSize: 15,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.black,
    //             ),
    //           ),
    //           children: <Widget>[
    //             Container(
    //               margin: const EdgeInsets.all(5),
    //               padding: const EdgeInsets.all(0),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //                 color: Colors.white,
    //               ),
    //               child: const ListTile(
    //                 title: Text(
    //                   'This is tile number 1',
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               margin: const EdgeInsets.all(5),
    //               padding: const EdgeInsets.all(0),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //                 color: Colors.white,
    //               ),
    //               child: const ListTile(
    //                 title: Text(
    //                   'This is tile number 1',
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               margin: const EdgeInsets.all(5),
    //               padding: const EdgeInsets.all(0),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //                 color: Colors.white,
    //               ),
    //               child: const ListTile(
    //                 title: Text(
    //                   'This is tile number 1',
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //         margin: const EdgeInsets.all(5),
    //         padding: const EdgeInsets.all(0),
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20),
    //             color: const Color.fromARGB(255, 175, 172, 172)),
    //         child: ExpansionTile(
    //           title: const Text(
    //             'VVVvvv',
    //             style: TextStyle(
    //               fontSize: 15,
    //               fontWeight: FontWeight.bold,
    //               color: Colors.black,
    //             ),
    //           ),
    //           children: <Widget>[
    //             Container(
    //               margin: const EdgeInsets.all(5),
    //               padding: const EdgeInsets.all(0),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //                 color: Colors.white,
    //               ),
    //               child: const ListTile(
    //                 title: Text(
    //                   'This is tile number 1',
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               margin: const EdgeInsets.all(5),
    //               padding: const EdgeInsets.all(0),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //                 color: Colors.white,
    //               ),
    //               child: const ListTile(
    //                 title: Text(
    //                   'This is tile number 1',
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               margin: const EdgeInsets.all(5),
    //               padding: const EdgeInsets.all(0),
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20),
    //                 color: Colors.white,
    //               ),
    //               child: const ListTile(
    //                 title: Text(
    //                   'This is tile number 1',
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  
  }
}
