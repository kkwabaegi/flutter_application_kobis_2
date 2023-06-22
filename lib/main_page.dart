import 'package:flutter/material.dart';
import 'package:flutter_application_kobis_2/rank_page.dart';
import 'package:flutter_application_kobis_2/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var menus = [const MainPage(), const RankPage(), const SearchPage()];
  int _idx = 0;
  dynamic loadPage = const Text('검색 please');
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [];
    items
        .add(const BottomNavigationBarItem(label: '홈', icon: Icon(Icons.home)));
    items.add(const BottomNavigationBarItem(
        label: '박스오피스', icon: Icon(Icons.stacked_bar_chart_outlined)));
    items.add(
        const BottomNavigationBarItem(label: '영화검색', icon: Icon(Icons.search)));

    return Scaffold(
      body: loadPage,
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _idx,
        onTap: (value) {
          setState(() {
            _idx = value;
            loadPage = menus[_idx];
          });
        },
      ),
    );
  }
}
