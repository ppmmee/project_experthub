import 'package:flutter/material.dart';

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
          buildLoginButton(),
          const SizedBox(height: 10),
          buildSignUpButton(),
        ],
      ),
    );
  }

  Widget buildCanvas(Widget child) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
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

  Widget buildTitle() {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 256,
        ),
        const SizedBox(height: 30),
        Text(
          'ยินดีต้อนรับ',
          style: TextStyles.textBold,
        ),
        const SizedBox(height: 5),
        Text(
          'โปรดเลือกรายการที่ต้องการ',
          style: TextStyles.textBold,
        ),
      ],
    );
  }

  Widget buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: () => {
          // Add login functionality here
        },
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
          style: TextStyles.textSmall.copyWith(
            color: AppColors.kWhite,
          ),
        ),
      ),
    );
  }

  Widget buildSignUpButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: OutlinedButton(
        onPressed: () => {
          // Add sign-up functionality here
        },
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 40),
          foregroundColor: Colors.grey,
          side: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'สมัครสมาชิก',
          style: TextStyles.textSmall,
        ),
      ),
    );
  }
}