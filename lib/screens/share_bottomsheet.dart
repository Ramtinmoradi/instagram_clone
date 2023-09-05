import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key, this.scrollController});
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 25.0,
          sigmaY: 25.0,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(255, 255, 255, 0.5),
                Color.fromRGBO(255, 255, 255, 0.2),
              ],
            ),
          ),
          child: _getContent(context),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 5.0,
                    width: 67.0,
                    margin: EdgeInsets.only(
                      top: 10.0,
                      bottom: 22.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Share',
                        style: TextStyle(
                          fontFamily: 'GB',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset('images/icon_share_bottomsheet.png'),
                    ],
                  ),
                  SizedBox(height: 32.0),
                  Container(
                    height: 46.0,
                    width: 460.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(13.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Image.asset('images/icon_search.png'),
                          SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                hintStyle: TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: 'GB',
                                  color: Colors.white,
                                ),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 100,
                (context, index) {
                  return _getItemGrid();
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                mainAxisExtent: 110.0,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 70),
            ),
          ],
        ),
        Positioned(
          bottom: 25.0,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Send'),
          ),
        ),
      ],
    );
  }

  Widget _getItemGrid() {
    return Column(
      children: [
        Container(
          height: 64.0,
          width: 64.0,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
            child: Image.asset('images/profile.png'),
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'amirahmadadibii',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'GB',
            fontSize: 12.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
