import 'package:flutter/material.dart';
import 'package:uit_hackathon/features/authentication/screens/forgetpass_page.dart';
import 'package:uit_hackathon/features/authentication/screens/signup_page.dart';
import 'package:uit_hackathon/features/authentication/services/auth_services.dart';
import 'package:uit_hackathon/utils/app_assets.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/widgets/loader.dart';
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
  bool isLoading = false;
  void signInUser() async {
    setState(() {
      isLoading = true;
    });
    await authServices.signInUser(
      context: context,
      phoneNumber: phoneController.text,
      password: passController.text,
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: SingleChildScrollView(
          child: Form(
            key: _signinformKey,
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
                              'ENVISER',

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
                          Container(
                              height: 140,
                              width: 140,
                              child: Image.asset(
                                AppAssets.login,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Ch??o m???ng ???? tr??? l???i',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                    width: size.width * 0.8,
                    child: const Text(
                      'ENVISER n???n t???ng thu mua r??c th???i v?? k???t n???i Challenge l??m s???ch m??i tr?????ng ?????u ti??n t???i Vi???t Nam',
                      style: TextStyle(
                          color: Color(0xff0D0D26),
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: size.height * 0.03),
                CustomTextField(
                  controller: phoneController,
                  type: TextInputType.phone,
                  hintText: 'S??? ??i???n tho???i',
                ),
                const SizedBox(height: 15),
                TextFormField(
                    controller: passController,
                    obscureText: isPasswordVisibleOld,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: 'M???t kh???u',
                      filled: true,
                      fillColor: const Color(0xfff7f8f9),
                      hintStyle: const TextStyle(
                        fontFamily: 'AvertaStdCY-Regular',
                        color: Color(0xff616161),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black38,
                        ),
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
                                image: AssetImage('assets/images/eyeOff.png')),
                        onPressed: () => setState(
                            () => isPasswordVisibleOld = !isPasswordVisibleOld),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '??i???n m???t kh???u';
                      }
                      return null;
                    }),
                SizedBox(height: size.height * 0.03),
                isLoading
                    ? const Loader()
                    : PrimaryButton(
                        text: '????ng nh???p',
                        color: AppColors.primaryColor,
                        onPress: () {
                          if (_signinformKey.currentState!.validate()) {
                            signInUser();
                          }
                        },
                      ),
                SizedBox(height: size.height * 0.05),
                SizedBox(
                  height: size.height * 0.1,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgetPassScreen()),
                        );
                      },
                      child: const Text(
                        'Qu??n m???t kh???u?',
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
                        'B???n ch??a c?? t??i kho???n? ',
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
                                builder: (context) => const SignUpScreen()),
                          );
                        },
                        child: const Text(
                          '????ng k??',
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
      ),
    );
  }
}
