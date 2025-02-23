import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_study_browser/utils/constant.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 背景渐变
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue.shade100, Colors.green.shade100],
                ),
              ),
            ),
          ),
          // 内容
          Center(
            child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.white.withOpacity(0.7),
                child: ResponsiveBuilder(builder: (context, sizingInformation) {
                  if (sizingInformation.isMobile) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _LoginImageCard(
                          device_type: MyDeviceType.mobile,
                        ),
                        _LoginCard(
                          device_type: MyDeviceType.mobile,
                        ),
                      ],
                    );
                  } else {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _LoginImageCard(
                          device_type: MyDeviceType.desktop,
                        ),
                        _LoginCard(
                          device_type: MyDeviceType.desktop,
                        )
                      ],
                    );
                  }
                })),
          ),
        ],
      ),
    );
  }
}

class _LoginImageCard extends StatelessWidget {
  MyDeviceType device_type;

  _LoginImageCard({Key, required this.device_type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: device_type == MyDeviceType.mobile ? 300.w : 600.w,
      height: device_type == MyDeviceType.mobile ? 200.h : 400.h,
      child: Center(
          child: SvgPicture.asset(
        'assets/img/user_login.svg',
        width: 500.w,
        height: 330.h,
      )),
    );
  }
}

class _LoginCard extends StatefulWidget {
  MyDeviceType device_type;

  _LoginCard({Key, required this.device_type});

  @override
  State<StatefulWidget> createState() => _LoginCardState();
}

class _LoginCardState extends State<_LoginCard> {
  bool _isObscure = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.device_type == MyDeviceType.mobile ? 300.w : 600.w,
      height: 400.h,
      child: Column(
        children: [
          Text(
            "Welcome Back :)",
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w900),
          ),
          Text(
              "If you want to use this site, you must first log in to this site using your username and password."),
          SizedBox(
            height: 10.h,
          ),
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Username',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              prefixIcon: Icon(
                Icons.person,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                ),
                suffixIcon: _isObscure
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye_outlined))),
            obscureText: _isObscure,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              _rememberMe
                  ? GestureDetector(
                      child: Icon(
                        Icons.check_circle,
                        size: 25.sp,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        setState(() {
                          _rememberMe = false;
                        });
                      },
                    )
                  : GestureDetector(
                      child: Icon(
                        Icons.circle_outlined,
                        size: 25.sp,
                      ),
                      onTap: () {
                        setState(() {
                          _rememberMe = true;
                        });
                      },
                    ),
              SizedBox(
                width: 5.w,
              ),
              _rememberMe
                  ? GestureDetector(
                      child: Text(
                        'Remember Me',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        setState(() {
                          _rememberMe = false;
                        });
                      },
                    )
                  : GestureDetector(
                      child: Text(
                        'Remember Me',
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        setState(() {
                          _rememberMe = true;
                        });
                      },
                    ),
              Spacer(),
              // Text("Forget Your Password?")
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          GestureDetector(
            child: Container(
              width: 600.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text(
                  'Login Now',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
