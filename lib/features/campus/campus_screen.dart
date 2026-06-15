import 'package:flutter/material.dart';
import 'package:ft_intra/features/campus/active_users_tab.dart';
import 'package:ft_intra/features/campus/friends_tab.dart';
import 'package:ft_intra/features/campus/checkin_button.dart';

export 'package:ft_intra/features/campus/campus_helpers.dart' show clusterFromHost;

class CampusScreen extends StatelessWidget {
  const CampusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Two tabs: friends and campus presence. Check-in is no longer a separate
    // tab — geofence check-ins are merged into the presence list, and the
    // check-in control sits atop that list.
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const Material(
                child: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.star, size: 20), height: 36),
                    Tab(icon: Icon(Icons.location_on, size: 20), height: 36),
                  ],
                  labelColor: Color(0xFF00BABC),
                  indicatorColor: Color(0xFF00BABC),
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
              ),
              // Shared compact check-in button — visible on both tabs.
              const CheckinButton(),
              const Expanded(
                child: TabBarView(
                  children: [
                    FriendsTab(),
                    ActiveUsersTab(),
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
