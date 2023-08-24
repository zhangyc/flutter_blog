import 'package:blog/mobile/main/beans/article.dart';
import 'package:blog/mobile/main/person_page.dart';
import 'package:blog/mobile/main/providers/home_provider.dart';
import 'package:blog/util/ex_buildcontext.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../creation/blog_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName='lib/mobile/main/home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final articles=context.select<HomeProvider,List<Article>>((value) => value.articles);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffabc6d9), Color(0xffddd7db), Color(0xffeabba7)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,

          header: WaterDropHeader(),
          onLoading: context.read<HomeProvider>().loadMore,
          onRefresh: context.read<HomeProvider>().initDate,
          controller:context.read<HomeProvider>().refreshController,
          child: ListView.separated(itemBuilder: (_,i){
            Article article=articles[i];
            // https://qianp.com/uploads/images/kind/20221025/20221025101907_38470.jpg
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                    width: 2
                  ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.6),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],

              ),

              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  GestureDetector(child: ExtendedImage.network('https://qianp.com/uploads/images/kind/20221025/20221025101907_38470.jpg',
                    height: 350,
                    fit: BoxFit.cover,

                   ),
                    onTap: (){
                      context.goName(BlogDetail(article: article,));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(article.articleTitle??'',style: TextStyle(
                          fontSize: 30
                        ),),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Text('${dateFormat.format(DateTime.parse(article.createTime!))}|'),
                            Text('${article.categoryName}|'),
                            Wrap(
                              children: article.tagDTOList!.map((e) => Text(e.tagName??'')).toList(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text('${article.articleContent}')
                      ],
                    ),
                  )
                ],
              ),
            );
          }, separatorBuilder: (_,i){
            return SizedBox(height: 10,);
          }, itemCount: articles.length,
           padding: EdgeInsets.symmetric(
             horizontal: 8
           ),
          ),
        ),
      ),
    );
  }
}
DateFormat dateFormat=DateFormat("yyyy-MM-dd");