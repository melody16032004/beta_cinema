import 'package:beta_cinema/Appbar/app_bar.dart';
import 'package:beta_cinema/Appbar/tab.dart';
import 'package:beta_cinema/BottomMenu/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex =
      0; // Dùng để theo dõi tab được chọn trên Bottom Navigation Bar

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3,
        vsync: this); // 3 tabs: Sắp Chiếu, Đang Chiếu, Suất Chiếu Sớm
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Hàm để thay đổi nội dung dựa trên tab chọn từ Bottom Navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60, // Tăng chiều cao AppBar
          backgroundColor: const Color.fromARGB(255, 249, 249, 249),
          // elevation: 5,
          title: const AppBarCustom(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(
                50.0), // Chiều cao của AppBar (bao gồm cả TabBar)
            child: TabCustom(tabController: _tabController),
          ),
        ),
        // Bottom Navigation Bar
        bottomNavigationBar: BottomNav(
            selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Center(child: Text('Nội dung Sắp Chiếu')),
            Center(child: Text('Nội dung Đang Chiếu')),
            Center(child: Text('Nội dung Suất Chiếu Sớm')),
          ],
        ),
      ),
    );
  }
}
