import 'dart:async';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class Upcoming extends StatefulWidget {
  final List<Widget> _banners;
  const Upcoming({
    super.key,
    required List<Widget> banners,
  }) : _banners = banners;

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer; // Khai báo Timer để tự động chuyển slide

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    // Thiết lập Timer để chuyển slide tự động sau mỗi 3 giây
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        // Tự động chuyển sang banner tiếp theo
        _currentPage = (_currentPage + 1) % widget._banners.length;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 600), // Tăng thời gian chuyển
        curve: Curves.easeInOut, // Sử dụng hiệu ứng mượt
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); // Hủy Timer khi widget bị hủy
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      color: const Color(0xFFf6f7f7),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Thêm indicator ở trên banner
            SizedBox(
              height: 150, // Kích thước container để chứa indicator và banner
              child: Stack(
                children: [
                  // Banner slider
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        5), // Áp dụng borderRadius cho khung
                    child: SizedBox(
                      height: 130, // Chiều cao của slider banner
                      // margin: const EdgeInsets.only(bottom: 20),
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount:
                            null, // Không giới hạn số lượng items trong PageView
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return widget
                              ._banners[index % widget._banners.length];
                        },
                      ),
                    ),
                  ),
                  // Indicator ở trên banner
                  Positioned(
                    bottom: 30,
                    left: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(widget._banners.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: _currentPage == index ? 12 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? const Color(0xFF3fb7f8)
                                : const Color(0xFFaaaaaa),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            // Các phần tử tiếp theo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildBannerFilm(
                    img: 'assets/upcoming1.png',
                    filmName: 'Hành Trình Của Moana 2',
                    date: '29-11-2024'),
                buildBannerFilm(
                    img: 'assets/upcoming2.jpg',
                    filmName: 'Quỷ Treo Đầu',
                    date: '29-11-2024',
                    age: 18),
                buildBannerFilm(
                    img: 'assets/upcoming3.jpg',
                    filmName: 'Công Tử Bạc Liêu',
                    date: '06-12-2024',
                    age: 18),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildBannerFilm(
                    img: 'assets/upcoming4.png',
                    filmName:
                        'Chúa Tể Của Những Chiếc Nhẫn: Cuộc Chiến Của Rohirrim',
                    date: '13-12-2024',
                    age: 16),
                buildBannerFilm(
                    img: 'assets/upcoming5.png',
                    filmName: 'Mufasa: Vua Sư Tử',
                    date: '20-12-2024'),
                buildBannerFilm(
                  img: '',
                  filmName: '',
                  date: '',
                ),
              ],
            ),

            // buildContentContainer(Colors.black26),
            // buildContentContainer(Colors.black),
          ],
        ),
      ),
    );
  }

  static Widget buildBannerFilm(
      {String? img, String? filmName, String? date, int? age}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: img != ''
                  ? Image.asset(
                      img!,
                      fit: BoxFit
                          .contain, // Lấp đầy khung mà không làm biến dạng ảnh
                      scale: 4.2,
                    )
                  : Container(
                      width: 98,
                      height: 150,
                      color: const Color(0xFFf6f7f7),
                    ),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            right: 55,
            child: Container(
              width: 125,
              height: 15,
              padding: const EdgeInsets.all(1.5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.5),
                  color: age == null
                      ? Colors.transparent
                      : age == 0
                          ? Colors.green
                          : age == 13
                              ? const Color(0xFF6db3e2)
                              : age == 16
                                  ? const Color(0xFFf2ce43)
                                  : const Color(0xFFf193a6)),
              child: Container(
                width: 110,
                height: 5,
                margin: const EdgeInsets.only(bottom: .5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                        color: age == null ? Colors.transparent : Colors.white,
                        width: .8,
                        style: BorderStyle.solid)),
                child: Center(
                  child: Text(
                    age == null
                        ? ''
                        : age == 0
                            ? 'P'
                            : 'T$age',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontSize: 7,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
        Center(
          child: SizedBox(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  date!,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 10, // Chỉnh kích thước font nếu cần
                      fontWeight: FontWeight.w500, // Kiểu font cho mục đã chọn
                      color: (date.isNotEmpty)
                          ? Colors.blue // Màu chữ khi có giá trị
                          : const Color(0xFFf6f7f7),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                SizedBox(
                  width: 90,
                  child: Center(
                    child: Text(
                      filmName!,
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 11, // Chỉnh kích thước font nếu cần
                          fontWeight:
                              FontWeight.w600, // Kiểu font cho mục đã chọn
                          color: Colors.black, // Màu chữ cho mục đã chọn
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget buildContentContainer(Color color) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 10),
      color: color,
    );
  }
}
