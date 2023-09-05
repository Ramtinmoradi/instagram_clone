import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getSearchBox(),
            ),
            SliverToBoxAdapter(
              child: _getCategoryList(),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.asset('images/item$index.png'),
                        ),
                      ),
                    );
                  },
                ),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  pattern: const [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCategoryList() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 17.0),
      child: Container(
        height: 23.0,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _getCategoryBox();
          },
        ),
      ),
    );
  }

  Widget _getCategoryBox() {
    return Container(
      margin: EdgeInsets.only(right: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        child: Container(
          height: 23.0,
          width: 60.0,
          decoration: BoxDecoration(
            color: Color(0xff272B40),
          ),
          child: Center(
            child: Text(
              'Test',
              style: TextStyle(
                fontFamily: 'GS',
                fontSize: 10.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getSearchBox() {
    return Container(
      height: 46.0,
      width: 460.0,
      margin: const EdgeInsets.only(
        left: 17.0,
        right: 17.0,
        top: 12.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xff272B40),
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
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'GB',
                  color: Colors.white,
                ),
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
            Image.asset('images/icon_scan.png'),
          ],
        ),
      ),
    );
  }
}
