import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              _getSliverAppBar(),
              _getProfileContentHeader(),
              _getSliverPersitentHeader(),
            ];
          },
          body: TabBarView(
            children: [
              _getCustomScrollViewTabBarView(),
              _getCustomScrollViewTabBarView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCustomScrollViewTabBarView() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            top: 20,
            left: 17,
            right: 17,
          ),
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
              repeatPattern: QuiltedGridRepeatPattern.same,
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              pattern: const [
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getSliverPersitentHeader() {
    return SliverPersistentHeader(
      floating: true,
      pinned: true,
      delegate: TabBarViewDelegate(
        TabBar(
          indicatorColor: Color(0xffF35383),
          indicatorWeight: 2,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 17.5),
          tabs: [
            Tab(
              child: Image.asset('images/icon_tab_posts.png'),
            ),
            Tab(
              child: Image.asset('images/icon_tab_bookmark.png'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getSliverAppBar() {
    return SliverAppBar(
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 18.0, top: 18.0),
          child: Icon(Icons.menu),
        ),
      ],
      bottom: PreferredSize(
        child: _getProfileHeader(),
        preferredSize: Size.fromHeight(14),
      ),
      backgroundColor: Color(0xff1C1F2E),
      expandedHeight: 173.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'images/item1.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _getProfileHeader() {
    return Container(
      width: double.infinity,
      height: 14.0,
      decoration: BoxDecoration(
        color: Color(0xff1C1F2E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
    );
  }

  Widget _getProfileContentHeader() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 17),
      sliver: SliverToBoxAdapter(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getProileImage(),
            SizedBox(width: 15.0),
            _getUserID(),
            Spacer(),
            Image.asset('images/icon_profile_edit.png'),
          ],
        ),
      ),
    );
  }

  Widget _getUserID() {
    return Container(
      height: 70,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'رامتین مرادی برنامه نویس موبایل',
              style: TextStyle(
                fontFamily: 'SM',
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'ramtinmoradiii',
              style: TextStyle(
                fontFamily: 'GB',
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getProileImage() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(17),
        ),
        border: Border.all(
          width: 2,
          color: Color(0xffF35383),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset('images/me.png'),
          ),
        ),
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xff1C1F2E),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
