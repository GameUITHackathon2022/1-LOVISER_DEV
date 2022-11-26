import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uit_hackathon/features/authentication/screens/forgetpass_page.dart';
import 'package:uit_hackathon/features/authentication/screens/signup_page.dart';
import 'package:uit_hackathon/features/authentication/services/auth_services.dart';
import 'package:uit_hackathon/utils/app_assets.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/utils/global_variables.dart';
import 'package:uit_hackathon/widgets/primary_button.dart';
import 'package:uit_hackathon/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisibleOld = true;
  final _signinformKey = GlobalKey<FormState>();
  final AuthServices authServices = AuthServices();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void signInUser(){
      authServices.signInUser(context: context, email: phoneController.text, password: passController.text);
    }
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[
                          Text(
                            'MyApp',
                            style: TextStyle(
                                color: Color(0xff356899),
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(AppAssets.login),
                      ],
                    ),
                  ],
                ),
              ),
              const Text(
                'Chào mừng đã trở lại',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
              ),
              SizedBox(height: size.height * 0.01),
              SizedBox(
                  width: size.width * 0.8,
                  child: const Text(
                    'Loviser nền tảng việc làm tự do về tình cảm đầu tiên tại Việt Nam',
                    style: TextStyle(
                        color: Color(0xff0D0D26), fontWeight: FontWeight.w400),
                  )),
              SizedBox(height: size.height * 0.03),
              Form(
                key: _signinformKey,
                child: CustomTextField(
                  controller: phoneController,
                  hintText: 'Số điện thoại',
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                child: TextFormField(
                    controller: passController,
                    obscureText: isPasswordVisibleOld,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color(0xffe8ecf4)), //<-- SEE HERE
                        ),
                        filled: true,
                        fillColor: const Color(0xfff7f8f9),
                        hintText: 'Mật khẩu',
                        hintStyle: const TextStyle(
                          fontFamily: 'AvertaStdCY-Regular',
                          color: Color(0xff616161),
                        ),
                        suffixIcon: IconButton(
                          icon: isPasswordVisibleOld
                              ? const Image(
                                  color: Color(0xFF60778C),
                                  width: 24,
                                  height: 24,
                                  image: AssetImage('assets/images/eyeOn.png'))
                              : const Image(
                                  color: Color(0xFF60778C),
                                  width: 24,
                                  height: 24,
                                  image:
                                      AssetImage('assets/images/eyeOff.png')),
                          onPressed: () => setState(() =>
                              isPasswordVisibleOld = !isPasswordVisibleOld),
                        ),
                        border: const OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Điền mật khẩu';
                      }
                      return null;
                    }),
              ),
              SizedBox(height: size.height * 0.03),
              PrimaryButton(
                  text: 'Đăng nhập',
                  color: AppColors.primaryColor,
                  onPress: (){
                    if(_signinformKey.currentState!.validate()){
                      signInUser();
                    }
                  },),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                height: size.height * 0.1,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassScreen()),
                      );
                    },
                    child: const Text(
                      'Quên mật khẩu?',
                      style: TextStyle(
                        fontFamily: 'AvertaStdCY-Semibold',
                        color: AppColors.primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                height: size.height * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Bạn chưa có tài khoản?',
                      style: TextStyle(
                        fontFamily: 'AvertaStdCY-Semibold',
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: const Text(
                        'Đăng ký',
                        style: TextStyle(
                          fontFamily: 'AvertaStdCY-Semibold',
                          color: AppColors.primaryColor,
                          fontSize: 16,
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
    );
  }
}
