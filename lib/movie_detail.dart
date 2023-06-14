import 'package:flutter/material.dart';
import 'package:flutter_application_kobis_2/kobis_api.dart';

class MovieDetail extends StatelessWidget {
  String movieCd;
  MovieDetail({super.key, required this.movieCd});
  final kobisApi = KobisApi(apiKey: '68e44fd6eab931b1a515299e75d9562e');

  void asd() {
    var movie = kobisApi.getMovieDetail(movieCd: movieCd);
  }

  @override
  Widget build(BuildContext context) {
    asd();
    return Scaffold(
      appBar: AppBar(title: const Text('영화 상세정보')),
      body: Text(movieCd),
    );
  }
}
