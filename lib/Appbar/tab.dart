import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class TabCustom extends StatefulWidget {
  final TabController _tabController;
  const TabCustom({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  @override
  State<TabCustom> createState() => _TabCustomState();
}

class _TabCustomState extends State<TabCustom> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(
          50.0), // Chiều cao của AppBar (bao gồm cả TabBar)
      child: Container(
        color: Colors.white,
        child: TabBar(
          controller: widget._tabController,
          tabs: [
            Tab(
              child: Text(
                "SẮP CHIẾU",
                style: GoogleFonts.inter(
                  // color: Colors.grey,
                  fontSize: 10.3,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Tab(
              child: Text(
                "ĐANG CHIẾU",
                style: GoogleFonts.inter(
                  // color: Colors.grey,
                  fontSize: 10.3,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Tab(
              child: Text(
                "XUẤT CHIẾU SỚM",
                style: GoogleFonts.inter(
                  // color: Colors.grey,
                  fontSize: 10.3,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
          indicatorColor: Colors.blueAccent, // Màu của indicator (dưới các tab)
          labelColor: Colors.blue, // Màu chữ của tab đang chọn
          unselectedLabelColor: Colors.grey, // Màu chữ của các tab chưa chọn
        ),
      ),
    );
  }
}
