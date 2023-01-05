import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListsView(),
    );
  }

  Widget ListsView(){
    return ListView.separated(itemBuilder: (context, index) {
      return ListViewItems(index);
    }, separatorBuilder: (context,index){
      return Divider(height: 0,);
    }, itemCount: 6);
  }

  Widget ListViewItems(int index){
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                message(index),
                timeAndDate(index)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget message(int index){
    double textSize=24;
    return Container(
      color: Color.fromARGB(255, 196, 68, 68),
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text:TextSpan(
          text: 'Message',
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          children:const [
            TextSpan(
              text: "Message Description",
              style: TextStyle(
                fontWeight:FontWeight.bold, 
              )
            )
          ]
        )
        ),
    );
  }

  Widget timeAndDate(int index){
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:const [
          Text('2-01-2023',
          style: TextStyle(
            fontSize: 10,
          ),
          ),
          Text('1-01-2023',
          style: TextStyle(
            fontSize: 10,
          ),
          ),
          
        ],
      ),
    );
  }
}