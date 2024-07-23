import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Utils
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return buildCanvas(
      Column(
        children: [
          buildTitle(),

          const SizedBox(height: 30),
          
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 40),
              foregroundColor: AppColors.kGrey,
              backgroundColor: AppColors.kPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'เข้าสู่ระบบ',
              style: GoogleFonts.sarabun(
                color: AppColors.kWhite,
                fontSize: 16,
              )
            ),
          ),

          OutlinedButton(
            onPressed: () => {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 40),
              foregroundColor: Colors.grey,
              side: BorderSide(
                color: AppColors.kBlack.withOpacity(0.5),
                width: 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'สมัครสมาชิก',
              style: GoogleFonts.sarabun(
                color: AppColors.kBlack.withOpacity(0.5),
                fontSize: 16,
              )
            ),
          )
        ],
      ),
    );
  }

  buildCanvas(Widget child) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 60,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTitle() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 200,
        ),
        const SizedBox(height: 30),
        Text(
          'ยินดีต้อนรับ',
          style: TextStyles.titleBold,
        ),
        const SizedBox(height: 10),
        Text(
          'โปรดเลือกรายการที่ต้องการ',
          style: TextStyles.titleBold,
        ),
      ],
    );
  }
}