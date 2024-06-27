import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instargramclone/Static%20Methods/manage/static_method.dart';
import 'package:instargramclone/Static%20Methods/values/colors.dart';
import 'package:instargramclone/Static%20Methods/values/dimens.dart';
import 'package:instargramclone/Static%20Methods/values/styles.dart';
import 'package:instargramclone/views/homepage.dart';

class MessagesPage extends StatefulWidget {
  final List<dynamic> list;
  const MessagesPage({super.key, required this.list});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    List data = widget.list[0];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Clr().white,
          leading: IconButton(onPressed: (){STM().back2Previous(context);}, icon: Icon(Icons.arrow_back,color: Clr().black,)),
          elevation: 0,
          title: Text(
            'username_id',
            style: Sty().mediumText,
          ),
          actions: [
            Image.asset('assets/video-camera.png'),
            SvgPicture.asset('assets/edit_icon.svg')
          ]),
      backgroundColor: Clr().white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dim().d16),
          child: Column(children: [
            SizedBox(
              height: 32,
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Clr().blackgrey),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dim().d12),
                            bottomLeft: Radius.circular(Dim().d12))),
                    fillColor: Clr().blackgrey,
                    filled: true,
                    hintText: 'Search',
                    hintStyle: Sty()
                        .mediumText
                        .copyWith(color: Clr().grey, fontSize: 17),
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(Icons.search, color: Clr().grey, size: 22),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dim().d12),
                            bottomLeft: Radius.circular(Dim().d12)))),
                onTap: () {
                  STM().redirect2page(context, HomePage());
                },
              ),
            ),
            SizedBox(height: Dim().d36),
            SizedBox(
              height: 90,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: Dim().d8),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 50,
                itemBuilder: (context, index) {
                  // var v = resultList[index];
                  return storyLayout(context, index);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: Dim().d28,
                  );
                },
              ),
            ),

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Messages', style: Sty().mediumText),
              Text('Requests',
                  style: Sty().mediumText.copyWith(color: Colors.lightBlue))
            ]),
            SizedBox(height: Dim().d14,),
            ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                // var v = resultList[index];
                return messageLayout(context, index, data);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: Dim().d16,
                );
              },
            )
          ]),
        ),
      ),
    );
  }

  Widget storyLayout(context, index) {
    return Container(
        child: Column(
      children: [
        CircleAvatar(
          backgroundColor: Clr().transparent,
          backgroundImage: AssetImage('assets/storydemoIMG.jpg'),
          radius: 33,
        ),
        Text('username')
      ],
    ));
  }

  Widget messageLayout(context, index, var data) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(Dim().d2),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Clr().transparent,
              backgroundImage: AssetImage(data[index]['img']),
              radius: 25,
            ),
            SizedBox(width: Dim().d12),
            RichText(
                text: TextSpan(
                    style: Sty().mediumText,
                    text: data[index]['username']+'\n',
                    children: <TextSpan>[
                  TextSpan(
                      text: 'seen',
                      style: Sty().mediumText.copyWith(color: Clr().grey))
                ])),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Clr().grey,
                    )))
          ],
        ),
      ),
    );
  }
}
