import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Utils
import 'package:experthub_app/utils/app_colors.dart';

class TextStyles {

  static final textBold = GoogleFonts.sarabun(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: AppColors.kTitle.withOpacity(0.6),
  );

  static final textMedium = GoogleFonts.sarabun(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.kTitle.withOpacity(0.6),
  );
  
  static final textRegular = GoogleFonts.sarabun(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.kTitle.withOpacity(0.5),
  );

  static final textSmall = GoogleFonts.sarabun(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.kTitle.withOpacity(0.5),
  );

}