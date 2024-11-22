// ignore_for_file: unused_import

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key});

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                            Icons.person_2_outlined, // Icon người dùng mặc định
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
    );
  }
}
