import 'package:flutter/material.dart';
import 'package:provider_architecture_example/ui/views/home_view.dart';
import 'package:provider_architecture_example/ui/views/login_view.dart';

class TabContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabs Demo'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            LoginView(),
            HomeView(),
          ],
        ),
      ),
    );
  }
}
