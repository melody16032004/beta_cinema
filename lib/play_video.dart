import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key});

  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    // Lấy ID từ URL YouTube
    const videoUrl =
        "https://www.youtube.com/watch?v=QBMhv3FLW_Q"; // Thay URL của bạn
    final videoId = YoutubePlayer.convertUrlToId(videoUrl)!;

    // Khởi tạo YoutubePlayerController
    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false, // Không tự động phát video
        mute: false, // Không tắt tiếng
      ),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose(); // Giải phóng tài nguyên
    super.dispose();
  }

  void _showVideoDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: YoutubePlayer(
            controller: _youtubeController,
            showVideoProgressIndicator: true, // Hiển thị thanh tiến trình
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Đóng"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết phim'),
      ),
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.play_circle_fill,
              size: 50, color: Colors.white70),
          onPressed: _showVideoDialog,
        ),
      ),
    );
  }
}
