import 'package:blog/mobile/creation/creation_blog.dart';
import 'package:blog/mobile/routes.dart';
import 'package:blog/mobile/user/login_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'app_constants.dart';
import 'mobile/main/main_page.dart';
import 'mobile/user/user_provider.dart';
import 'util/auth_interceptor.dart';
import 'util/dio_util.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox(userBox);
  initDioInterceptors();
  runApp(const MyApp());
}
void initDioInterceptors() {
  dio.interceptors.add(AuthInterceptor());
  dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseBody: true
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (c)=>UserProvider()),
      ],
      child: RefreshConfiguration(
        footerTriggerDistance: 15,
        dragSpeedRatio: 0.91,
        headerBuilder: () => MaterialClassicHeader(),
        footerBuilder: () => ClassicFooter(),
        enableLoadingWhenNoData: false,
        enableRefreshVibrate: false,
        enableLoadMoreVibrate: false,
        shouldFooterFollowWhenNotFull: (state) {
          // If you want load more with noMoreData state ,may be you should return false
          return true;
        },
        child: MaterialApp(
          title: 'Rhymes IO',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: userToken.isNotEmpty?MainPage():LoginPage(),
          routes: <String, WidgetBuilder>{
            // '/':(c)=>MainPage(),
            CreationBlog.routeName:(c)=>CreationBlog(),
          },
          // routerConfig: goRouter,
        ),
      ),

    );
  }
}
