import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatefulWidget {
  final int _selectedIndex;
  final void Function(int) _onItemTapped;
  const BottomNav({
    super.key,
    required int selectedIndex,
    required Function(int) onItemTapped,
  })  : _selectedIndex = selectedIndex,
        _onItemTapped = onItemTapped;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget._selectedIndex,
      onTap: widget._onItemTapped,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 14, // Chỉnh kích thước font nếu cần
          fontWeight: FontWeight.w500, // Kiểu font cho mục đã chọn
        ),
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 14, // Kích thước font cho mục chưa chọn
          fontWeight: FontWeight.w400, // Kiểu font cho mục chưa chọn
        ),
      ),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.film, // Icon Lịch chiếu theo phim
            size: 20.0,
            color: Colors.grey,
          ),
          label: 'Lịch chiếu theo phim',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.locationArrow, // Icon Lịch chiếu theo rạp
            size: 20.0,
            color: Colors.grey,
          ),
          label: 'Lịch chiếu theo rạp',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.ticketAlt, // Icon Voucher
            size: 20.0,
            color: Colors.grey,
          ),
          label: 'Voucher',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.gift, // Icon hộp quà
            size: 20.0,
            color: Colors.grey,
          ),
          label: 'Khuyến mãi',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(
            FontAwesomeIcons.thLarge, // Icon hộp quà
            size: 20.0,
            color: Colors.grey,
          ),
          label: 'Khác',
        ),
      ],
    );
  }
}
