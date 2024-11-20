import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenwave/model/trending_model.dart';
import 'package:screenwave/vo/movie.dart';

import '../widget/local_app_bar.dart';
import '../widget/movie_placeholder_row.dart';
import '../widget/movie_row.dart';
import '../widget/theme.dart';

class TrendingMovieList extends StatefulWidget {
  final String categoryName;
  const TrendingMovieList({super.key, required this.categoryName});

  @override
  State<TrendingMovieList> createState() => _TrendingMovieListState();
}

class _TrendingMovieListState extends State<TrendingMovieList> {
  bool _isLoading = false;
  List<Movie> _movies = [];

  Future<void> _refresh() async {
    _loadMovies();
  }

  @override
  void initState() {
    _loadMovies();
    super.initState();
  }

  _loadMovies() async {
    try {
      _isLoading = true;
      _movies = await context.read<TrendingModel>().loadAllTrendingMovies();
    } finally {
      _isLoading = false;
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: primaryColor,
        onRefresh: _refresh,
        edgeOffset: kToolbarHeight,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              snap: true,
              flexibleSpace: LocalAppBar(label: widget.categoryName),
            ),
            _isLoading
                ? SliverToBoxAdapter(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        6, (index) => const MoviePlaceholderRow()),
                  ))
                : SliverToBoxAdapter(
                    child: Column(
                        children: _movies.map((e) {
                      return MovieRow(movie: e);
                    }).toList()),
                  ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
      ),
    );
  }
}
