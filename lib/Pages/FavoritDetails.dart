

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mvvm_buildrealproject/Model/newsArticle.dart';
import 'package:mvvm_buildrealproject/Pages/NewsArticleDetailsPage.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleViewModel.dart';
import 'package:mvvm_buildrealproject/states/MyProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FavoritDetails extends StatefulWidget {
  final String url;
  final String urlImage;
  final String title;
  final String desc;

  const FavoritDetails({
    this.url,
    this.urlImage,
    this.title,
    this.desc,
    });

  @override
  _FavoritDetailsState createState() => _FavoritDetailsState();
}

class _FavoritDetailsState extends State<FavoritDetails> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return NewsArticleDetailsPage();
        }));
      },
      child: Dismissible(
        key: ValueKey(widget.url),
        direction:  DismissDirection.endToStart,
        background: Container(
          margin: EdgeInsets.symmetric(vertical: 2.4.h),
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: Icon(Icons.delete,size: 38.5.sp,color: Colors.white,),
        ),
        onDismissed: (_)async{
          final provider= Provider.of<myProvider>(context,listen: false);
          await provider.removeFromMyList(NewsArticle(
            description: widget.desc,
            title: widget.title,
            url: widget.url,
          ));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4.0.w,horizontal: 4.5.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0.sp),
          ),
          height: 22.0.h,
          width: double.infinity,
          child: Stack(children: [
             Row(
               children: [
                 Expanded(
                     flex: 3,
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(15.0.sp),
                       child: Image(
                         image: NetworkImage(widget.urlImage),
                         height: double.infinity,
                         fit: BoxFit.cover,
                       ),
                     ),

                 ),
                 Expanded(
                     flex: 4,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                       Container(
                         margin: EdgeInsets.symmetric(
                           vertical: 2.0.h,horizontal: 3.0.w
                         ),
                         child: Text(
                           widget.title,
                           style: TextStyle(
                               fontSize: 11.0.sp,
                               fontWeight: FontWeight.w500),
                         ),
                       )
                     ],))
               ],
             )
          ],),
        ),
      ),
    );
  }
}
