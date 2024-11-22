import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/logo.png'), // Sử dụng AssetImage thay vì Image.asset
                        radius: 17,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                              "Chào ",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              "Hoàng Doãn",
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          Row(
                            children: [
                              Row(children: [
                                const Icon(
                                  Icons
                                      .person_2_outlined, // Icon người dùng mặc định
                                  size: 15, // Kích thước icon
                                  color: Colors.blue, // Màu sắc icon
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "MEMBER",
                                  style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                width: 20,
                              ),
                              Row(children: [
                                const Icon(
                                  Icons
                                      .star_border_rounded, // Icon người dùng mặc định
                                  size: 15, // Kích thước icon
                                  color: Colors.green, // Màu sắc icon
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "0",
                                  style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ]),
                              const SizedBox(
                                width: 20,
                              ),
                              Row(children: [
                                const Icon(
                                  Icons
                                      .confirmation_number, // Icon người dùng mặc định
                                  size: 15, // Kích thước icon
                                  color: Colors.orange, // Màu sắc icon
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "0",
                                  style: GoogleFonts.inter(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/logo.png', // Logo Beta Cinemas
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(
                50.0), // Chiều cao của AppBar (bao gồm cả TabBar)
            child: Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
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
                indicatorColor:
                    Colors.blueAccent, // Màu của indicator (dưới các tab)
                labelColor: Colors.blue, // Màu chữ của tab đang chọn
                unselectedLabelColor:
                    Colors.grey, // Màu chữ của các tab chưa chọn
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Center(child: Text('Nội dung Sắp Chiếu')),
            Center(child: Text('Nội dung Đang Chiếu')),
            Center(child: Text('Nội dung Suất Chiếu Sớm')),
          ],
        ),
        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
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
        ),
      ),
    );
  }
}
