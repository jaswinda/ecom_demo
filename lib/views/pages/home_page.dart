import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/utils/shared_preds.dart';
import 'package:my_first_flutter_project/views/pages/loader.dart';
import 'package:my_first_flutter_project/views/pages/tabs/tab_one.dart';
import 'package:tabnavigator/tabnavigator.dart';

import '../../controller/authentication_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _tabController = StreamController<AppTab>.broadcast();
  final _initTab = AppTab.feed;
  final AuthService authService = AuthService();

  Stream<AppTab> get tabStream => _tabController.stream;

  final _map = <AppTab, TabBuilder>{
    AppTab.feed: () {
      return TabOne();
    },
    AppTab.colors: () {
      return Column(
        children: const [],
      );
    },
    AppTab.info: () {
      final authentication = Get.find<Authentication>();
      return Column(
        children: [
          Container(
              child: ElevatedButton(
                  onPressed: () async {
                    await authentication.logout();
                    Get.offAll(const Loader());
                  },
                  child: const Text("Logout"))),
        ],
      );
    }
  };

  Widget _buildBody() {
    return TabNavigator(
      initialTab: _initTab,
      selectedTabStream: tabStream,
      mappedTabs: _map,
    );
  }

  logout() async {}

  Widget _buildbottomNavigationBar() {
    return StreamBuilder<AppTab>(
      stream: tabStream,
      initialData: _initTab,
      builder: (context, snapshot) {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Fooo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.color_lens),
              label: 'Colors',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
            ),
          ],
          currentIndex: snapshot.hasData ? snapshot.data!.value : 0,
          onTap: (value) => _tabController.sink.add(AppTab.byValue(value)),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildbottomNavigationBar(),
    );
  }

  @override
  void dispose() {
    _tabController.close();
    super.dispose();
  }
}

class AppTab extends TabType {
  const AppTab._(int value) : super(value);

  static const feed = AppTab._(0);
  static const colors = AppTab._(1);
  static const info = AppTab._(2);

  static AppTab byValue(int value) {
    switch (value) {
      case 0:
        return feed;
      case 1:
        return colors;
      case 2:
        return info;
      default:
        throw Exception('no tab for such value');
    }
  }
}
