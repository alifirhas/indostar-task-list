import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../utils/my_color.dart';

class HeroTanggalHariIni extends StatelessWidget {
  final DateTime tanggalHariIni;
  final double heroWidth;
  final double heroHeight;

  const HeroTanggalHariIni({
    super.key,
    required this.tanggalHariIni,
    required this.heroWidth,
    required this.heroHeight,
  });

  @override
  Widget build(BuildContext context) {
    var numberFormatter = NumberFormat('00');
    var dayFormatter = DateFormat('EEEE');

    final String suffixTanggal = buatSuffixTanggal(tanggalHariIni.day);
    final String tanggalSekarang =
        numberFormatter.format(tanggalHariIni.day).toString();
    final String tanggalStringSekarang = dayFormatter.format(tanggalHariIni);

    return Container(
      decoration: const BoxDecoration(
        color: MyColors.purple,
      ),
      width: heroWidth,
      height: heroHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                tanggalSekarang,
                style: GoogleFonts.inter(
                  fontSize: 48,
                  color: MyColors.white,
                ),
              ),
              Text(
                suffixTanggal,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: MyColors.white,
                ),
              ),
            ],
          ),
          Text(
            tanggalStringSekarang,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: MyColors.white,
            ),
          ),
        ],
      ),
    );
  }

  String buatSuffixTanggal(int number) {
    if (number >= 11 && number <= 13) {
      return "th";
    }
    switch (number % 10) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }
}
