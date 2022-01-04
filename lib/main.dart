import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_buildrealproject/Login_Signup_Widget/Login.dart';
import 'package:mvvm_buildrealproject/Pages/newsListPage.dart';
import 'package:mvvm_buildrealproject/ViewModel/UserViewModel.dart';
import 'package:mvvm_buildrealproject/ViewModel/newsArticleListViewModel.dart';
import 'package:mvvm_buildrealproject/Widget/SplashScreen.dart';
import 'package:mvvm_buildrealproject/states/MyProvider.dart';
import 'package:mvvm_buildrealproject/states/cubit.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(DevicePreview(
  enabled:false,
  builder: (context) {
    return App();
  }
));

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewsArticleListViewModel()..populateTopHeadlines(),
        ),
        ChangeNotifierProvider(create: (_) => NewUserViewMode()),
        ChangeNotifierProvider<myProvider>(
          create: (context) {
            return myProvider();
          },
        )
      ],
      child: Sizer(
        builder: (context, orientation, devicetype) {
          return BlocProvider(
            create: (context) {
              return FavoriteCubit();
            },
            child: MaterialApp(
              locale: DevicePreview.locale(context), // Add the locale here
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              title: "Fresh News",
              theme: ThemeData(
                primarySwatch: Colors.pink,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: Spalsh_Screen(),
            ),
          );
        },
      ),
    );
  }
}
