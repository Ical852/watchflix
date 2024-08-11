import 'package:flutter/material.dart';
import 'package:watchflix/models/fetch_response.dart';
import 'package:watchflix/screens/detail_pages/movie/detail_movie.dart';
import 'package:watchflix/screens/detail_pages/tv/detail_tv.dart';
import 'package:watchflix/shared/constants.dart';
import 'package:watchflix/view_models/detail/detail_view_model.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  bool isTv;
  Results detail;

  DetailPage({
    required this.detail,
    this.isTv = false
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailViewModel detailVM = DetailViewModel(context);

  @override
  void initState() {
    super.initState();
    if (this.widget.isTv) {
      detailVM.getDetailTv(this.widget.detail.id.toString());
      detailVM.getRecommendationsTv(this.widget.detail.id.toString());
      detailVM.getCastsTv(this.widget.detail.id.toString());
      detailVM.getTrailerTv(this.widget.detail.id.toString());
    } else {
      detailVM.getDetail(this.widget.detail.id.toString());
      detailVM.getRecommendations(this.widget.detail.id.toString());
      detailVM.getCasts(this.widget.detail.id.toString());
      detailVM.getTrailer(this.widget.detail.id.toString());
    }
  }

  Widget MainContent() {
    if (this.widget.isTv) {
      return DetailTv(
        mainDetail: this.widget.detail,
        onDetailFetch: () => detailVM.getDetailTv(this.widget.detail.id.toString()),
        onRecommendFetch: () => detailVM.getRecommendationsTv(this.widget.detail.id.toString()),
        onCastFetch: () => detailVM.getCastsTv(this.widget.detail.id.toString()),
        onTrailerFetch: () => detailVM.getTrailerTv(this.widget.detail.id.toString()),
      );
    }
    return DetailMovie(
      onDetailFetch: () => detailVM.getDetail(this.widget.detail.id.toString()),
      onRecommendFetch: () => detailVM.getRecommendations(this.widget.detail.id.toString()),
      onCastFetch: () => detailVM.getCasts(this.widget.detail.id.toString()),
      onTrailerFetch: () => detailVM.getTrailer(this.widget.detail.id.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: MainContent()
      ),
    );
  }
}
