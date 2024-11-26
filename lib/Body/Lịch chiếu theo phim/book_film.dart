import 'package:beta_cinema/Body/L%E1%BB%8Bch%20chi%E1%BA%BFu%20theo%20phim/film_detail.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class BookFilm extends StatefulWidget {
  final String _img;
  final String _title;
  final int _duration;
  final int _age;
  const BookFilm({
    super.key,
    required String img,
    required String title,
    required int duration,
    required int age,
  })  : _img = img,
        _title = title,
        _duration = duration,
        _age = age;

  @override
  State<BookFilm> createState() => _BookFilmState();
}

class _BookFilmState extends State<BookFilm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Phần AppBar tùy chỉnh
            Stack(
              children: [
                // Gradient nền
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF5A92E3), // Màu xanh gradient trên
                        Color(0xFFB8D5F5), // Màu nhạt gradient dưới
                      ],
                    ),
                  ),
                ),
                // Nội dung bên trong AppBar
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nút quay lại và tiêu đề
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 10),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios,
                                  size: 17, color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Text(
                              'Đặt vé theo phim',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Ảnh và thông tin chi tiết phim
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Ảnh phim
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                widget._img, // Đổi bằng URL ảnh phim
                                width: 115,
                                height: 175,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Chi tiết phim
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget._title,
                                    // overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Kinh dị | ${widget._duration} Phút',
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Điều hướng đến trang chi tiết phim
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          transitionDuration: const Duration(
                                              milliseconds:
                                                  500), // Thời gian chuyển
                                          reverseTransitionDuration:
                                              const Duration(
                                                  milliseconds:
                                                      500), // Thời gian quay lại
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              FilmDetail(
                                            img: widget._img,
                                            title: widget._title,
                                            age: widget._age,
                                          ),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            const begin = Offset(1.0, 0.0);
                                            const end = Offset.zero;
                                            const curve = Curves.decelerate;

                                            var tween = Tween(
                                                    begin: begin, end: end)
                                                .chain(
                                                    CurveTween(curve: curve));
                                            var offsetAnimation =
                                                animation.drive(tween);

                                            return FadeTransition(
                                              opacity:
                                                  animation, // Thêm hiệu ứng mờ dần
                                              child: SlideTransition(
                                                position: offsetAnimation,
                                                child: child,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black45,
                                      foregroundColor: Colors.white10,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: const BorderSide(
                                            style: BorderStyle.solid,
                                            color: Colors.blueAccent,
                                            width: 1.5),
                                      ),
                                    ),
                                    child: Text(
                                      'Chi tiết phim',
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Phần nội dung khác (ngày giờ, khu vực, v.v.)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Chọn khu vực'),
                      Row(
                        children: [
                          Text(
                            'Tất cả',
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Icon(Icons.arrow_right),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
