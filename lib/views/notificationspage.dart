import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instargramclone/Static%20Methods/manage/static_method.dart';
import 'package:instargramclone/Static%20Methods/values/colors.dart';
import 'package:instargramclone/Static%20Methods/values/dimens.dart';
import 'package:instargramclone/Static%20Methods/values/styles.dart';

class NotificationPage extends StatefulWidget {
  final List<dynamic> data;
  const NotificationPage({super.key,  required this.data,});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    List list= widget.data[0];
    return Scaffold(
      backgroundColor: Clr().white,
      appBar: AppBar(

        backgroundColor: Clr().white,
        elevation: 0,
        leading: IconButton(onPressed: (){STM().back2Previous(context);}, icon: Icon(Icons.arrow_back,color: Clr().black,)),
        title: Text('Notifications', style: TextStyle(color: Clr().black)),

      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dim().d16),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Last 30 Days',
                  style: TextStyle(
                      color: Clr().black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: Dim().d12,
              ),
              // Row(children: [
              //   CircleAvatar(
              //     backgroundColor: Clr().transparent,
              //     backgroundImage: AssetImage('assets/storydemoIMG.jpg'),
              //     radius: 20,
              //   ),
              //   Flexible(
              //     child: Padding(
              //       padding: EdgeInsets.symmetric(horizontal: Dim().d8),
              //       child: RichText(
              //           text: TextSpan(style: Sty().smallText, children: <TextSpan>[
              //         TextSpan(
              //             text: 'username',
              //             style: Sty()
              //                 .smallText
              //                 .copyWith(fontWeight: FontWeight.bold)),
              //         TextSpan(text: ',who you might know, is on Instagram.'),
              //       ])),
              //     ),
              //   ),
              //   SizedBox(
              //     width:70,
              //     height: Dim().d28,
              //     child: ElevatedButton(
              //         onPressed: () {},
              //         child: Text('Follow',style: TextStyle(fontSize: 14),),
              //         style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(5)),
              //             elevation: MaterialStatePropertyAll(0),
              //             shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(7))),
              //          )),
              //   )
              // ]),

              ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    print(widget.data);
                return notificationLayout(context, index, list);
              }, separatorBuilder: (context, index) {
                return SizedBox(height: Dim().d36,);
              }, itemCount: list.length)

            ]),
          ),
        ),

    );
  }

  Widget notificationLayout(context,index, var listdata){
    return Container(
      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        CircleAvatar(
          backgroundColor: Clr().transparent,
          backgroundImage: AssetImage(listdata[index]['img']),
          radius: 24,
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dim().d8),
            child: RichText(
                text: TextSpan(style: Sty().mediumText.copyWith(height: 1.4,fontSize: 16), children: <TextSpan>[
                  TextSpan(
                      text:listdata[index]['username'],
                      style: Sty()
                          .mediumText
                          .copyWith(fontWeight: FontWeight.bold,fontSize: 16)),
                  TextSpan(text: ',who you might know, is on Instagram.'),
                ])),
          ),
        ),
        SizedBox(
          width:70,
          height: Dim().d28,
          child: ElevatedButton(
              onPressed: () {},
              child: Text('Follow',style: TextStyle(fontSize: 14),),
              style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(5)),
                elevation: MaterialStatePropertyAll(0),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7))),
              )),
        )
      ]) ,
    );
  }
}
