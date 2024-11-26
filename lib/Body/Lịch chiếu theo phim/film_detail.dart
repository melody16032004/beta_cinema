import 'package:beta_cinema/line.dart';
import 'package:beta_cinema/play_video.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class FilmDetail extends StatefulWidget {
  final String _img;
  final String _title;
  final int? _age;
  const FilmDetail({
    super.key,
    required String img,
    required String title,
    required int? age,
  })  : _img = img,
        _title = title,
        _age = age;

  @override
  State<FilmDetail> createState() => _FilmDetailState();
}

class _FilmDetailState extends State<FilmDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header với gradient và nút back
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF5A92E3), // Màu gradient trên
                  Color(0xFFB8D5F5), // Màu gradient dưới
                ],
              ),
            ),
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      size: 17, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  "Chi tiết phim",
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

          // Nội dung chi tiết phim
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Ảnh poster và nút play
                  Stack(
                    children: [
                      Image.asset(
                        widget._img, // Thay bằng đường dẫn ảnh của bạn
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      const Positioned(
                        bottom: 0,
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      Center(
                        child: IconButton(
                          icon: const Icon(Icons.play_circle_fill,
                              size: 50, color: Colors.white70),
                          onPressed: () {
                            // Xử lý khi nhấn nút Play
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: const Duration(
                                    milliseconds: 500), // Thời gian chuyển
                                reverseTransitionDuration: const Duration(
                                    milliseconds: 500), // Thời gian quay lại
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const PlayVideo(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;
                                  const curve = Curves.decelerate;

                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
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
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Tên phim và độ tuổi
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                widget._img, // Thay bằng ảnh poster nhỏ
                                width: 80,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget._title,
                                      style: GoogleFonts.inter(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          style: BorderStyle.solid,
                                          width: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: Text(
                                        "Chỉ dành cho người trên ${widget._age} tuổi",
                                        style: GoogleFonts.inter(
                                          fontSize: 10,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Column(
                            children: [
                              // Thông tin phim
                              _buildFilmDetailRow("Đạo diễn", "Lưu Thành Luân"),
                              _buildFilmDetailRow("Diễn viên",
                                  "Hồng Đào, Thiên An, Thùy Tiên, Văn Anh, Samuel An,..."),
                              _buildFilmDetailRow("Thể loại", "Kinh dị"),
                              _buildFilmDetailRow("Thời lượng", "109 phút"),
                              _buildFilmDetailRow("Ngôn ngữ", "Tiếng Việt"),
                              _buildFilmDetailRow(
                                  "Ngày khởi chiếu", "22/11/2024"),

                              const SizedBox(height: 8),
                              const Line(
                                height: 1.3,
                                width: 285,
                                color: Color.fromARGB(255, 231, 231, 231),
                              ),
                              const SizedBox(height: 8),

                              // Mô tả
                              Text(
                                "Linh Miêu: Quỷ Nhập Tràng lấy cảm hứng từ truyền thuyết dân gian về “quỷ nhập tràng” để xây dựng cốt truyện. Phim lồng ghép những nét văn hóa đặc trưng của Huế như nghệ thuật khảm sành - một văn hóa đặc sắc của thời nhà Nguyễn, đề cập đến các vấn đề về giai cấp và quan điểm trọng nam khinh nữ. Đặc biệt, hình ảnh rước kiệu thây ma và những hình nhân giấy không chỉ biểu trưng cho tai ương hay điềm dữ mà còn là hiện thân của nghiệp quả.",
                                style: GoogleFonts.inter(fontSize: 12),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Nút Chia sẻ
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Xử lý khi nhấn nút Chia sẻ
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF5A92E3),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "CHIA SẺ",
                              style: GoogleFonts.inter(
                                fontSize: 16,
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
          ),
        ],
      ),
    );
  }

  Widget _buildFilmDetailRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Phần tiêu đề (title) với chiều rộng cố định
          Expanded(
            flex: 4, // Tùy chỉnh tỷ lệ để phần tiêu đề chiếm không gian hợp lý
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              textAlign: TextAlign.left, // Canh trái tiêu đề
            ),
          ),

          // Phần nội dung (content) chiếm phần còn lại
          Expanded(
            flex: 6, // Chiếm nhiều không gian hơn cho phần nội dung
            child: Text(
              content,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.left, // Canh trái nội dung
            ),
          ),
        ],
      ),
    );
  }
}
