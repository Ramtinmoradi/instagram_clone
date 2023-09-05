import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:instagram_app/screens/share_bottomsheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      appBar: AppBar(
        backgroundColor: Color(0xff1C1F2E),
        elevation: 0.0,
        centerTitle: false,
        title: Container(
          width: 128.0,
          height: 24.0,
          child: Image.asset('images/moodinger_logo.png'),
        ),
        actions: [
          Container(
            width: 24.0,
            height: 24.0,
            margin: EdgeInsets.only(right: 19.01),
            child: Image.asset('images/icon_direct.png'),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    barrierColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: DraggableScrollableSheet(
                          initialChildSize: 0.4,
                          minChildSize: 0.2,
                          maxChildSize: 0.9,
                          builder: (context, scrollController) {
                            return ShareBottomSheet(
                              scrollController: scrollController,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Text('Open BottomSheet'),
              ),
            ),
            SliverToBoxAdapter(
              child: _getStoryList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _getPostList(),
                childCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 120.0,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return index == 0 ? _getAddStoryBox() : _getStoryBox();
        },
      ),
    );
  }

  Widget _getPostList() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              _getPostHeader(),
              SizedBox(height: 23.0),
              _getBlogPost(),
              SizedBox(height: 34.0),
            ],
          ),
        );
      },
    );
  }

  Widget _getBlogPost() {
    return Container(
      height: 427.0,
      width: 394.0,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset('images/post_cover.png'),
            ),
          ),
          Positioned(
            top: 15.0,
            right: 15.0,
            child: Image.asset('images/icon_video.png'),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                width: 340.0,
                height: 46.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.5),
                      Color.fromRGBO(255, 255, 255, 0.2),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Image.asset('images/icon_hart.png'),
                          SizedBox(width: 6.0),
                          Text(
                            '2.6 K',
                            style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 42.0),
                      Row(
                        children: [
                          Image.asset('images/icon_comments.png'),
                          SizedBox(width: 6.0),
                          Text(
                            '1.5 K',
                            style: TextStyle(
                              fontFamily: 'GB',
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 42.0),
                      Image.asset('images/icon_share.png'),
                      SizedBox(width: 42.0),
                      Image.asset('images/icon_save.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPostHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          _getProfileImage(),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'amirahmadadibii',
                  style: TextStyle(
                    fontFamily: 'GB',
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  'برنامه نویس موبایل',
                  style: TextStyle(
                    fontFamily: 'SM',
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset('images/icon_menu.png'),
        ],
      ),
    );
  }

  Widget _getProfileImage() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(17.0),
      padding: EdgeInsets.all(4),
      color: Color(0xffF35383),
      strokeWidth: 2.0,
      dashPattern: [1, 0],
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        child: Container(
          height: 38.0,
          width: 38.0,
          child: Image.asset('images/profile.png'),
        ),
      ),
    );
  }

  Widget _getStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(17.0),
            padding: EdgeInsets.all(4),
            color: Color(0xffF35383),
            strokeWidth: 2.0,
            dashPattern: [1, 0],
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: Container(
                height: 58.0,
                width: 58.0,
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'data',
            style: TextStyle(
              fontFamily: 'GS',
              fontSize: 10.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAddStoryBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        children: [
          Container(
            height: 64.0,
            width: 64.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(17.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xff1C1F2E),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
          SizedBox(height: 11.0),
          Text(
            'Your Story',
            style: TextStyle(
              fontFamily: 'GS',
              fontSize: 10.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
