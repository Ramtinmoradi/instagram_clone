import 'package:flutter/material.dart';
import 'package:instagram_app/model/enums/activity_type_enum.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Column(
          children: [
            _getTabBar(),
            _getTabBarView(),
          ],
        ),
      ),
    );
  }

  Widget _getTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          _getSampleSliverList(),
          _getSampleSliverList(),
        ],
      ),
    );
  }

  Widget _getSampleSliverList() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(top: 20.0, left: 30.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Today',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 2,
            (context, index) {
              return _getFollowingContent(ActivityStatus.following);
            },
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 20.0, left: 30.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              'New',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 5,
            (context, index) {
              return _getFollowingContent(ActivityStatus.followback);
            },
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(top: 20.0, left: 30.0),
          sliver: SliverToBoxAdapter(
            child: Text(
              'This Week',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'GB',
                color: Colors.white,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) {
              return _getFollowingContent(ActivityStatus.likes);
            },
          ),
        ),
      ],
    );
  }

  Widget _getFollowingContent(ActivityStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 17),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: Color(0xffF35383),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 7.0),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'amirahmadadibii',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'started following',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'you',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '3min',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getActionActivityRow(status),
        ],
      ),
    );
  }

  Widget _getYouContent(ActivityStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 17),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: Color(0xffF35383),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 7.0),
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'amirahmadadibii',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    'started following',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'you',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '3min',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12,
                      color: Color(0xffC5C5C5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          _getActionActivityRow(status),
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followback:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            minimumSize: Size(70.0, 36.0),
          ),
          onPressed: () {},
          child: Text(
            'Follow',
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 12,
            ),
          ),
        );
      case ActivityStatus.likes:
        return SizedBox(
          width: 40.0,
          height: 40.0,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item4.png'),
            ),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: Size(70.0, 36.0),
            side: BorderSide(
              color: Color(0xffC5C5C5),
              width: 2.0,
            ),
          ),
          onPressed: () {},
          child: Text(
            'Following',
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 12,
              color: Color(
                0xffC5C5C5,
              ),
            ),
          ),
        );
      default:
        return SizedBox(
          height: 36,
          width: 70,
        );
    }
  }

  Widget _getTabBar() {
    return Container(
      height: 60.0,
      width: double.infinity,
      color: Color(0xff1C1F2E),
      child: TabBar(
        controller: _tabController,
        labelStyle: TextStyle(
          fontFamily: 'GB',
          fontSize: 16,
        ),
        indicatorColor: Color(0xffF35383),
        indicatorWeight: 3,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 40.0),
        tabs: [
          Tab(
            text: 'Following',
          ),
          Tab(
            text: 'You',
          ),
        ],
      ),
    );
  }
}
