import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

// Utils
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void clearDataField() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return buildCanvas(
      Form(
        key: _formKey,
        child: Column(
          children: [
            buildTitle(),
            buildForm(),
            buildForgotPasswordLabel(),
            buildLoginButton(),
            buildCreateAccountLabel(),
          ],
        ),
      )
    );
  }

  Widget buildCanvas(Widget child) {
    return Scaffold(
      backgroundColor: AppColors.kAuth,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
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
        Text(
          'เข้าสู่ระบบ',
          style: TextStyles.textBold,
        ),
      ],
    );
  }

  Widget buildForm() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          buildEntryField(Icons.email, 'อีเมล', _emailController),
          const SizedBox(height: 20),
          buildEntryField(Icons.lock, 'รหัสผ่าน', _passwordController, isPassword: true),
        ],
      ),
    );
  }

  Widget buildEntryField(IconData icon, String title, TextEditingController controller, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyles.textSmall.copyWith(
        color: AppColors.kBlack.withOpacity(0.6),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        labelText: title,
        labelStyle: TextStyles.textSmall.copyWith(
          color: AppColors.kBlack.withOpacity(0.6),
        ),
        prefixIcon: Icon(
          icon,
          color: AppColors.kBlack.withOpacity(0.6),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.kBlack.withOpacity(0.6),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.kBlack.withOpacity(0.6),
            width: 1.5,
          ),
        ),
      ),
    );
  }

  Widget buildForgotPasswordLabel() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () => {
            // Add forgot password functionality here
          },
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            padding: WidgetStateProperty.all(EdgeInsets.zero),
          ),
          child: Text(
            'ลืมรหัสผ่าน?',
            style: TextStyles.textVerySmall.copyWith(
              color: AppColors.kPrimary,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return Container(
      margin: const EdgeInsets.only(top: 0),
      child: ElevatedButton(
        onPressed: () => {
          Navigator.pushNamed(context, loginRoute),
          clearDataField(),
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 40),
          foregroundColor: AppColors.kWhite,
          backgroundColor: AppColors.kPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
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

  Widget buildCreateAccountLabel() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'ยังไม่มีบัญชีผู้ใช้? ',
              style: TextStyles.textVerySmall,
            ),
            TextSpan(
              text: 'สมัครสมาชิก',
              style: TextStyles.textVerySmall.copyWith(
                color: AppColors.kBlack.withOpacity(0.6),
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {
                clearDataField();
              },
            ),
          ],
        ),
      ),
    );
  }
}