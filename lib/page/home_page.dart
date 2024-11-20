import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenwave/page/trending_movie_list.dart';
import 'package:screenwave/widget/movie_placeholder_row.dart';
import 'package:screenwave/widget/theme.dart';
import 'package:screenwave/widget/util.dart';

import '../model/home_model.dart';
import '../model/screening_model.dart';
import '../model/trending_model.dart';
import '../widget/movie_row.dart';
import 'screening_movie_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  final isLoading = false;

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _refresh() async {
    context.read<HomeModel>().load();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var trendingModel = context.watch<TrendingModel>();
    var screeningModel = context.watch<ScreeningModel>();
    bool isLoading = context.watch<HomeModel>().isLoading;

    final trendingTitle = Padding(
        padding: const EdgeInsets.only(left: 5.0, bottom: 2, right: 5),
        child: titleWidget(
          context,
          label: trendingModel.category?.header ?? '',
          onPressed: () {
            if (isLoading) return;
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => TrendingMovieList(
                        categoryName: trendingModel.category?.header ?? "")));
          },
        ));

    final screeningTitle = Padding(
        padding: const EdgeInsets.only(left: 5.0, bottom: 2, right: 5),
        child: titleWidget(
          context,
          label: screeningModel.category?.header ?? '',
          onPressed: () {
            if (isLoading) return;
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) =>
                         ScreeningMovieList(categoryName: screeningModel.category?.header ?? '')));
          },
        ));

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: RefreshIndicator(
            color: primaryColor,
            onRefresh: _refresh,
            edgeOffset: kToolbarHeight,
            child: CustomScrollView(
              physics: isLoading
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                    floating: true,
                    snap: true,
                    backgroundColor: backgroundColor,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            getGreeting(),
                            style: const TextStyle(
                                fontSize: 20,
                                color: textColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )),
                isLoading
                    ? SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                              6, (index) => const MoviePlaceholderRow()),
                        ),
                      )
                    : SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              trendingTitle,
                              trendingModel.category != null
                                  ? Column(
                                      children: trendingModel.category!.movies
                                          .map((e) {
                                      return MovieRow(movie: e);
                                    }).toList())
                                  : const SizedBox(),
                              const SizedBox(height: 15),
                              screeningTitle,
                              screeningModel.category != null
                                  ? Column(
                                      children: screeningModel.category!.movies
                                          .map((e) {
                                      return MovieRow(movie: e);
                                    }).toList())
                                  : const SizedBox(),
                              const SizedBox(height: 30),
                            ],
                          ),
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
