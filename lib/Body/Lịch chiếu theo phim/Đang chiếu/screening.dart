import 'dart:async'; // Thêm thư viện Timer
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class Screening extends StatefulWidget {
  const Screening({super.key});

  @override
  State<Screening> createState() => _ScreeningState();
}

class _ScreeningState extends State<Screening> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer; // Khai báo Timer để tự động chuyển slide

  final List<Widget> _banners = [
    buildBannerContainer(text: 'Banner 1', url: 'assets/banner1.jpg'),
    buildBannerContainer(text: 'Banner 2', url: 'assets/banner2.jpg'),
    buildBannerContainer(text: 'Banner 3', url: 'assets/banner3.png'),
    buildBannerContainer(text: 'Banner 4', url: 'assets/banner4.jpg'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    // Thiết lập Timer để chuyển slide tự động sau mỗi 3 giây
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        // Tự động chuyển sang banner tiếp theo
        _currentPage = (_currentPage + 1) % _banners.length;
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
                          return _banners[index % _banners.length];
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
                      children: List.generate(_banners.length, (index) {
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
                    duration: 109),
                buildBannerFilm(
                    img: 'assets/mv2.jpg',
                    filmName: 'Cười Xuyên Biên Giới',
                    duration: 113),
                buildBannerFilm(
                    img: 'assets/mv1.jpg',
                    filmName: 'Linh Miêu',
                    duration: 109),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildBannerFilm(
                    img: 'assets/mv1.jpg',
                    filmName: 'Linh Miêu',
                    duration: 109),
                buildBannerFilm(
                    img: 'assets/mv2.jpg',
                    filmName: 'Cười Xuyên Biên Giới',
                    duration: 113),
                buildBannerFilm(
                    img: 'assets/mv1.jpg',
                    filmName: 'Linh Miêu',
                    duration: 109),
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
      {String? img, String? filmName, int? duration}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.asset(
            img!,
            fit: BoxFit.contain, // Lấp đầy khung mà không làm biến dạng ảnh
            scale: 3.5,
          ),
        ),
        Center(
          child: SizedBox(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
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
                Text(
                  '${duration!} phút',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 10, // Chỉnh kích thước font nếu cần
                      fontWeight: FontWeight.w500, // Kiểu font cho mục đã chọn
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

  Widget buildContentContainer(Color color) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 10),
      color: color,
    );
  }
}
