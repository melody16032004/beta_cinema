import 'package:beta_cinema/Body/L%E1%BB%8Bch%20chi%E1%BA%BFu%20theo%20phim/film_schedule.dart';
import 'package:beta_cinema/Body/L%E1%BB%8Bch%20chi%E1%BA%BFu%20theo%20r%E1%BA%A1p/theater_schedule.dart';
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
  int _selectedIndex = 0;

  // Hàm để thay đổi nội dung dựa trên tab chọn từ Bottom Navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const FilmSchedule(),
      const TheaterSchedule(),
      const Center(child: Text('Voucher')),
      const Center(child: Text('Khuyến mãi')),
      const Center(child: Text('Khác')),
    ];

    return SafeArea(
      child: Scaffold(
        body: pages[_selectedIndex],
        // Bottom Navigation Bar
        bottomNavigationBar: BottomNav(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
