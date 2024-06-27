import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instargramclone/Static%20Methods/manage/static_method.dart';
import 'package:instargramclone/Static%20Methods/values/strings.dart';
import 'package:instargramclone/views/notificationspage.dart';
import 'package:instargramclone/views/messagespage.dart';
import 'package:instargramclone/views/posts.dart';

import '../Static Methods/values/colors.dart';
import '../Static Methods/values/dimens.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {
  List<dynamic> productList = [];
  List<dynamic> dataList = [
    {
      "username": "adventure_expert",
      "photo_title": "Mountain Majesty",
      "img": "assets/mountain_majesty.jpg"
    },
    {
      "username": "urban_wanderer",
      "photo_title": "City Lights",
      "img": "assets/city_lights.jpg"
    }
    ,
    {
      "username": "nature_lover_22",
      "photo_title": "Sunset Serenity",
      "img": "assets/sunset_serenity.jpg"
    }
    ,
    {
      "username": "travel_dreamer",
      "photo_title": "Desert Dreams",
      "img": "assets/desert_dreams.jpg"
    }
    ,
    {

      "username": "ocean_explorer",
      "photo_title": "Ocean Bliss",
      "img": "assets/ocean_bliss.jpg"
    },
    {
      "username": "wildlife_observer",
      "photo_title": "Jungle Encounter",
      "img": "assets/jungle_encounter.jpg"
    },
    {
      "username": "sky_high_captures",
      "photo_title": "Cloudscape",
      "img": "assets/cloudscape.jpg"
    }
    ,
    {
      "username": "sunset_chaser",
      "photo_title": "Colors of Dusk",
      "img": "assets/colors_of_dusk.jpg"
    },

    {
      "username": "architecture_aficionado",
      "photo_title": "Modern Art",
      "img": "assets/modern_art.jpg"
    },

    {
      "username": "seasons_in_focus",
      "photo_title": "Winter Wonderland",
      "img": "assets/winter_wonderland.jpg"
    },

  ];

  @override
  void initState(){
    _updateAppbar();
    super.initState();
    getProducts();
  }

  void _updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Clr().green));
  }

  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Clr().white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              systemOverlayStyle:SystemUiOverlayStyle(statusBarColor: Clr().white) ,
            backgroundColor: Clr().white,
              elevation: 0,
              leadingWidth: 110,
              centerTitle: true,
              leading: Padding(
                padding: EdgeInsets.all(Dim().d6),
                child: IconButton(highlightColor: Clr().transparent,onPressed: () {

                }, icon:SvgPicture.asset('assets/svgviewer-output.svg',width: 200, height: 100,) ),
              ),

              actions: [
                IconButton(highlightColor: Clr().transparent,onPressed: () {
                  STM().redirect2pageWithAnim(context, NotificationPage(data: [dataList],));
                }, icon:SvgPicture.asset('assets/heart-svgrepo-com.svg',height: 25,width: 25,) ),
                IconButton(highlightColor: Clr().transparent,onPressed: () {
                  STM().redirect2pageWithAnim(context, MessagesPage(list: [dataList],));
                }, icon:SvgPicture.asset('assets/messager.svg') )


              ]),
          SliverList(delegate:SliverChildListDelegate([Column(
            children: [
              SizedBox(
                height: 90,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: Dim().d12),
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
                      width: 12,
                    );
                  },
                ),
              ),
              ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return postLayout(context, index);
                }, separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 50,);
              },
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       CircleAvatar(
              //         backgroundColor: Clr().transparent,
              //         backgroundImage: AssetImage('assets/storydemoIMG.jpg'),
              //         radius: 16,
              //       ),
              //       SizedBox(
              //         width: Dim().d8,
              //       ),
              //       Expanded(child: Text('username\ntitle name')),
              //       Image.asset('assets/more.png'),
              //     ],
              //   ),
              // ),
              // Image.asset('assets/storydemoIMG.jpg'),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       Image.asset('assets/heart.png'),
              //       SizedBox(
              //         width: Dim().d12,
              //       ),
              //       Image.asset('assets/chat.png'),
              //       SizedBox(
              //         width: Dim().d12,
              //       ),
              //       Image.asset('assets/send.png'),
              //       Expanded(
              //           child: SizedBox(
              //         width: Dim().d8,
              //       )),
              //       Image.asset('assets/savepost.png'),
              //     ],
              //   ),
              // )
            ],
          )]))
        ],
      ),
    );
  }

   Widget storyLayout(contex, index) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: Clr().purple)),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: CircleAvatar(
          backgroundColor: Clr().transparent,
          backgroundImage: AssetImage('assets/storydemoIMG.jpg'),
          radius: 33,
        ),
      ),
    );
  }

  Widget postLayout(context, index) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Clr().transparent,
                  backgroundImage: AssetImage(dataList[index]['img']),
                  radius: 16,
                ),
                SizedBox(
                  width: Dim().d8,
                ),
                Expanded(child: Text(dataList[index]['username']+'\n'+dataList[index]['photo_title'])),
                Image.asset('assets/more.png'),
              ],
            ),
          ),
          Image.asset(dataList[index]['img']),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset('assets/heart.png'),
                SizedBox(
                  width: Dim().d12,
                ),
                Image.asset('assets/chat.png'),
                SizedBox(
                  width: Dim().d12,
                ),
                Image.asset('assets/send.png'),
                Expanded(
                    child: SizedBox(
                  width: Dim().d8,
                )),
                Image.asset('assets/savepost.png'),
              ],
            ),
          )
        ],
      ),
    );
  }

  void getProducts() async {
    var result = await STM().get(context, Str().loading, 'products');
    print(result);

    setState(() {

      productList = result['products'];
    });
  }



}
