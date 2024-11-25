import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class BookFilm extends StatefulWidget {
  final String _img;
  final String _title;
  final int _duration;
  const BookFilm({
    super.key,
    required String img,
    required String title,
    required int duration,
  })  : _img = img,
        _title = title,
        _duration = duration;

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
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back,
                                  color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            const Text(
                              'Đặt vé theo phim',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
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
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.blue,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text('Chi tiết phim'),
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
                children: const [
                  Text('Nội dung tiếp theo'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
