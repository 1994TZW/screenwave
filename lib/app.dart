import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/home_page.dart';
import 'model/home_model.dart';
import 'model/screening_model.dart';
import 'model/trending_model.dart';
import 'widget/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final HomeModel homeModel;
  final ScreeningModel screeningModel = ScreeningModel();
  final TrendingModel trendingModel = TrendingModel();

  @override
  void initState() {
    super.initState();
    homeModel =
        HomeModel(screeningModel: screeningModel, trendingModel: trendingModel);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: homeModel),
          ChangeNotifierProvider.value(value: screeningModel),
          ChangeNotifierProvider.value(value: trendingModel),
        ],
        child: MaterialApp(
            title: 'Screen Wave Demo',
            theme: ThemeData(
                scaffoldBackgroundColor: backgroundColor,
                appBarTheme: const AppBarTheme(
                    surfaceTintColor: backgroundColor,
                    backgroundColor: backgroundColor,
                    elevation: 0)),
            home: const HomePage()));
  }
}
