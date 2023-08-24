import 'package:blog/app_constants.dart';
import 'package:blog/mobile/main/main_page.dart';
import 'package:blog/mobile/user/apis/user_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../main/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PageController controller=PageController();
  TextEditingController _email=TextEditingController();
  TextEditingController _emailVerifyCode=TextEditingController();

  TextEditingController _pwd=TextEditingController();

  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffabc6d9), Color(0xffddd7db), Color(0xffeabba7)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: PageView(
          controller: controller,
          onPageChanged: (value){
            currentPage=value;
          },
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 90
              ),
              child: Column(
                children: [
                  KeyboardVisibilityBuilder(builder: (_,v){
                    return SizedBox(
                      height: !v?206:20,
                    );
                  }),
                  Text('让我们开始',style: TextStyle(
                    color: Colors.black,
                    fontSize: 48
                  ),),
                  Text('这是一个让人愉悦放松的计划。我们欢迎屏幕前的你也加入。'),
                  SizedBox(
                    height: 100,
                  ),
                  IconButton(onPressed: (){

                    controller.animateToPage(currentPage+1, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                    // setState(() {
                    //
                    // });
                   }, icon: Icon(Icons.keyboard_double_arrow_right_rounded,size: 36,color: Colors.white,),),
                  TextButton(onPressed: (){

                    controller.animateToPage(currentPage+4, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                    // setState(() {
                    //
                    // });
                  }, child: Text('已有帐号，直接登录'),)
                ],
              ),
            ),
            Padding (
              padding: const EdgeInsets.symmetric(
                  horizontal: 90
              ),
              child: Column(
                children: [
                  KeyboardVisibilityBuilder(builder: (_,v){
                    return SizedBox(
                      height: !v?206:20,
                    );
                  }),
                  Text('我们严格保护你的隐私',style: TextStyle(
                      color: Colors.black,
                      fontSize: 48
                  ),),
                  Text('输入一个有效的邮箱，让我们方便联系你'),
                  SizedBox(
                    height: 100,
                  ),
                  TextField(
                    decoration: InputDecoration(),
                    controller: _email,
                    onSubmitted: (value){
                      controller.animateToPage(currentPage+1, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                      setState(() {

                      });
                    },
                  ),
                ],
              ),
            ),
            Padding (
              padding: const EdgeInsets.symmetric(
                  horizontal: 90
              ),
              child: Column(
                children: [
                  KeyboardVisibilityBuilder(builder: (_,v){
                    return SizedBox(
                      height: !v?206:20,
                    );
                  }),
                  Text('请输入邮箱收到的验证码',style: TextStyle(
                      color: Colors.black,
                      fontSize: 48
                  ),),
                  SizedBox(
                    height: 100,
                  ),
                  TextField(
                    decoration: InputDecoration(),
                    controller: _emailVerifyCode,
                    onSubmitted: (value){
                      controller.animateToPage(currentPage+1, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
                      setState(() {

                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 90
              ),
              child: Column(
                children: [
                  KeyboardVisibilityBuilder(builder: (_,v){
                    return SizedBox(
                      height: !v?206:20,
                    );
                  }),
                  Text('请输入高强度密码',style: TextStyle(
                      color: Colors.black,
                      fontSize: 48
                  ),),
                  Text('一个较为复杂的密码，虽然不好记。但是别人也很难猜出来'),
                  SizedBox(
                    height: 100,
                  ),
                  TextField(
                    decoration: InputDecoration(),
                    controller: _pwd,
                    onSubmitted: (value){

                      UserApis.register(_email.text, _pwd.text,_emailVerifyCode.text).then((value){
                        if(value.isSuccess){
                          UserApis.login(_email.text, _pwd.text).then((value){
                            if(value.isSuccess){
                              userToken=value.data;
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c){
                                return MainPage();
                              }), (route) => false);
                            }
                          });
                        }
                      });

                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 90
              ),
              child: Column(
                children: [
                  KeyboardVisibilityBuilder(builder: (_,v){
                    return SizedBox(
                      height: !v?206:20,
                    );
                  }),
                  Text('欢迎',style: TextStyle(
                      color: Colors.black,
                      fontSize: 48
                  ),),
                  Text('欲买桂花同载酒，终不似，少年游'),
                  SizedBox(
                    height: 100,
                  ),
                  TextField(
                    decoration: InputDecoration(),
                    controller: _email,
                  ),
                  TextField(
                    decoration: InputDecoration(),
                    controller: _pwd,
                  ),
                  TextButton(onPressed: (){

                    UserApis.login(_email.text, _pwd.text).then((value){
                      if(value.isSuccess){
                        userToken=value.data;
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c){
                          return MainPage();
                        }), (route) => false);
                      }
                    });                   // setState(() {
                    //
                    // });
                  }, child: Text('登录'),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
