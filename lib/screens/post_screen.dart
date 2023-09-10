import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SafeArea(
            child: _getWholeScrollingPart(),
          ),
          _getBottomScreen(),
        ],
      ),
    );
  }

  Widget _getSelectedImageContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
      height: 394.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('images/item8.png'),
        ),
      ),
    );
  }

  Widget _getWholeScrollingPart() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            bottom: 20.0,
          ),
          sliver: SliverToBoxAdapter(
            child: _getHeaderScreen(),
          ),
        ),
        SliverToBoxAdapter(
          child: _getSelectedImageContainer(),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            left: 17.0,
            right: 17.0,
            bottom: 60.0,
          ),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Container(
                      child: Image.asset('images/item$index.png'),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getBottomScreen() {
    return Container(
      height: 100.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff272B40),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 17.0,
          left: 17.0,
          bottom: 57.0,
          top: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Draft',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Color(0xffF35383),
              ),
            ),
            Text(
              'Gallery',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Text(
              'Take',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getHeaderScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Row(
        children: [
          Text(
            'Post',
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 15),
          Image.asset('images/icon_arrow_down.png'),
          Spacer(),
          Text(
            'Next',
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 15),
          Image.asset('images/icon_arrow_right_box.png'),
        ],
      ),
    );
  }
}
