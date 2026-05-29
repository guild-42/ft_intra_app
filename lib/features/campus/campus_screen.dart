import 'package:flutter/material.dart';
import 'package:ft_intra/features/campus/active_users_tab.dart';
import 'package:ft_intra/features/campus/friends_tab.dart';
import 'package:ft_intra/features/campus/checkin_tab.dart';

String clusterFromHost(String host) {
  // c1r5p3 -> c1 ; 1A1 -> 1A ; e1r2p1 -> e1
  final match = RegExp(r'^([a-zA-Z]?\d+[a-zA-Z]*|\d*[a-zA-Z]+\d*)').firstMatch(host);
  if (match == null) return host;
  final m = match.group(1)!;
  // strip trailing rN/pN
  final idx = m.indexOf(RegExp(r'[rRpP]'));
  if (idx > 0) return m.substring(0, idx);
  return m;
}

class CampusScreen extends StatelessWidget {
  const CampusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Material(
                child: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.star, size: 20), height: 36),
                    Tab(icon: Icon(Icons.people, size: 20), height: 36),
                    Tab(icon: Icon(Icons.location_on, size: 20), height: 36),
                  ],
                  labelColor: Color(0xFF00BABC),
                  indicatorColor: Color(0xFF00BABC),
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    FriendsTab(),
                    ActiveUsersTab(),
                    CheckinTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
