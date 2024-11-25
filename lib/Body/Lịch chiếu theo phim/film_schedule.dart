import 'dart:async';

import 'package:beta_cinema/Appbar/app_bar.dart';
import 'package:beta_cinema/Appbar/tab.dart';
import 'package:beta_cinema/Body/L%E1%BB%8Bch%20chi%E1%BA%BFu%20theo%20phim/%C4%90ang%20chi%E1%BA%BFu/screening.dart';
import 'package:beta_cinema/Body/L%E1%BB%8Bch%20chi%E1%BA%BFu%20theo%20phim/S%E1%BA%AFp%20chi%E1%BA%BFu/upcoming.dart';
import 'package:beta_cinema/Body/L%E1%BB%8Bch%20chi%E1%BA%BFu%20theo%20phim/Su%E1%BA%A5t%20chi%E1%BA%BFu%20s%E1%BB%9Bm/early.dart';
import 'package:flutter/material.dart';

class FilmSchedule extends StatefulWidget {
  const FilmSchedule({super.key});

  @override
  State<FilmSchedule> createState() => _FilmScheduleState();
}

class _FilmScheduleState extends State<FilmSchedule>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 1,
    ); // 3 tabs: Sắp Chiếu, Đang Chiếu, Suất Chiếu Sớm
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  // ------------------------------------------
  final List<Widget> _banners = [
    buildBannerContainer(text: 'Banner 1', url: 'assets/banner1.jpg'),
    buildBannerContainer(text: 'Banner 2', url: 'assets/banner2.jpg'),
    buildBannerContainer(text: 'Banner 3', url: 'assets/banner3.png'),
    buildBannerContainer(text: 'Banner 4', url: 'assets/banner4.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: TabBarView(
        controller: _tabController,
        children: [
          Upcoming(
            banners: _banners,
          ),
          Screening(
            banners: _banners,
          ),
          Early(
            banners: _banners,
          ),
        ],
      ),
    );
  }

  static Widget buildBannerContainer(
      {String? text, String? url, Color? color}) {
    return Container(
      height: 200, // Đặt chiều cao của khung
      width: double.infinity, // Chiều rộng của khung sẽ lấp đầy màn hình
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Thêm border radius cho khung
        color: color,
      ),
      child: url?.isNotEmpty ?? false
          ? ClipRRect(
              borderRadius:
                  BorderRadius.circular(5), // Giữ border radius của ảnh
              child: Image.asset(
                url!,
                fit: BoxFit.cover, // Lấp đầy khung mà không làm biến dạng ảnh
              ),
            )
          : Center(
              child: Text(
                text!,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
    );
  }
}
