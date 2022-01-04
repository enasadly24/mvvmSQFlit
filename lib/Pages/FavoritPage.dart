import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_buildrealproject/Pages/FavoritDetails.dart';
import 'package:mvvm_buildrealproject/Services/Webservices.dart';
import 'package:mvvm_buildrealproject/main.dart';
import 'package:mvvm_buildrealproject/states/cubit.dart';
import 'package:mvvm_buildrealproject/states/states.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


class FavoritPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back_ios,
          size: 15.0.sp,
        ),
          onPressed: (){
          Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(.8),

            ),
            child: Text(
              'Your Favorite List',
              style: GoogleFonts.oswald(
                  textStyle:TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                      color: Colors.black))),
            ),
          Expanded(
              child: BlocConsumer<FavoriteCubit,FavouriteStates>(
                listener: (context,state){},
                builder: (context,state){
                  FavoriteCubit cubit = FavoriteCubit.get(context);
                  return ListView.builder(
                    itemCount: cubit.myList.length,
                      itemBuilder:(context,index){
                        return FavoritDetails(
                          desc:cubit.myList[index].description,
                          title: cubit.myList[index].title,
                          url: cubit.myList[index].url,
                          urlImage: cubit.myList[index].urlToImage,
                        );
                      } );
                },
              ))
        ],
      ),
    );
  }
}

