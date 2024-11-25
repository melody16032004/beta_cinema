// Thêm thư viện Timer
import 'dart:async';

import 'package:beta_cinema/Body/L%E1%BB%8Bch%20chi%E1%BA%BFu%20theo%20phim/book_film.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class Screening extends StatefulWidget {
  // final int _currentPage;
  final List<Widget> _banners;
  const Screening({
    super.key,
    required List<Widget> banners,
  }) : _banners = banners;

  @override
  State<Screening> createState() => _ScreeningState();
}

class _ScreeningState extends State<Screening> {
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
    // int _index = widget._currentPage;
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
                    img: 'assets/mv1.jpg',
                    filmName: 'Linh Miêu',
                    duration: 109,
                    age: 18,
                    isHot: true),
                buildBannerFilm(
                    img: 'assets/mv2.jpg',
                    filmName: 'Cười Xuyên Biên Giới',
                    duration: 113,
                    age: 13,
                    isHot: true),
                buildBannerFilm(
                  img: 'assets/mv3.jpg',
                  filmName: 'Red One: Mật Mã Đỏ',
                  duration: 123,
                  age: 13,
                  isHot: false,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildBannerFilm(
                    img: 'assets/mv4.png',
                    filmName: 'Thần Dược',
                    duration: 138,
                    age: 18,
                    isHot: false),
                buildBannerFilm(
                    img: 'assets/mv5.jpg',
                    filmName: 'Võ Sĩ Giác Đấu II',
                    duration: 148,
                    age: 16,
                    isHot: false),
                buildBannerFilm(
                  img: 'assets/mv6.jpg',
                  filmName: 'Hồn Ma Mae Nak',
                  duration: 101,
                  age: 18,
                  isHot: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBannerFilm(
      {String? img, String? filmName, int? duration, int? age, bool? isHot}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration:
                const Duration(milliseconds: 500), // Thời gian chuyển
            reverseTransitionDuration:
                const Duration(milliseconds: 500), // Thời gian quay lại
            pageBuilder: (context, animation, secondaryAnimation) => BookFilm(
              img: img!,
              title: filmName!,
              duration: duration!,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.decelerate;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return FadeTransition(
                opacity: animation, // Thêm hiệu ứng mờ dần
                child: SlideTransition(
                  position: offsetAnimation,
                  child: child,
                ),
              );
            },
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
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
                          color: Colors.blueGrey,
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
                            color:
                                age == null ? Colors.transparent : Colors.white,
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
              if (isHot!)
                Positioned(
                  top: -3,
                  right: -31,
                  child: Transform.rotate(
                    angle: 0.785398, // Xoay -45 độ (rad)
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 10, bottom: 0),
                      color: const Color(0xFFf95903),
                      child: Text(
                        "HOT",
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Center(
            child: Container(
              color: Colors.transparent,
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 90,
                    child: Center(
                      child: Text(
                        filmName != '' ? filmName! : 'Không rõ',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 10, // Chỉnh kích thước font nếu cần
                            fontWeight:
                                FontWeight.w600, // Kiểu font cho mục đã chọn
                            color: Colors.black, // Màu chữ cho mục đã chọn
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    duration != null ? '$duration phút' : '?? phút',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontSize: 10, // Chỉnh kích thước font nếu cần
                        fontWeight:
                            FontWeight.w500, // Kiểu font cho mục đã chọn
                        color: Colors.grey, // Màu chữ cho mục đã chọn
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
      ),
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
