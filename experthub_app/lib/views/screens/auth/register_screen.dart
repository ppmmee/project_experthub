import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Utils
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';
import '../../../utils/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void clearDataField() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
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
            buildRegisterButton(),
            buildLoginLabel(),
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
          'สร้างบัญชีผู้ใช้',
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
          const SizedBox(height: 20),
          buildEntryField(Icons.lock, 'ยืนยันรหัสผ่าน', _confirmPasswordController, isPassword: true),
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

  Widget buildRegisterButton() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
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
          'สร้างบัญชีผู้ใช้',
          style: TextStyles.textSmall.copyWith(
            color: AppColors.kWhite,
          ),
        ),
      ),
    );
  }

  Widget buildLoginLabel() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'มีบัญชีผู้ใช้แล้ว? ',
              style: TextStyles.textVerySmall,
            ),
            TextSpan(
              text: 'เข้าสู่ระบบ',
              style: TextStyles.textVerySmall.copyWith(
                color: AppColors.kBlack.withOpacity(0.6),
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = () {
                Navigator.pushNamed(context, loginRoute);
                clearDataField();
              },
            ),
          ],
        ),
      ),
    );
  }
}