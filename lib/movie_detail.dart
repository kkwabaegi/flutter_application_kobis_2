import 'package:flutter/material.dart';
import 'package:flutter_application_kobis_2/detail_view.dart';
import 'package:flutter_application_kobis_2/kobis_api.dart';

class MovieDetail extends StatelessWidget {
  String movieCd;
  MovieDetail({super.key, required this.movieCd});
  final kobisApi = KobisApi(apiKey: '68e44fd6eab931b1a515299e75d9562e');

  @override
  Widget build(BuildContext context) {
    var movie = kobisApi.getMovieDetail(movieCd: movieCd);

    return Scaffold(
        appBar: AppBar(title: const Text('영화 상세정보')),
        body: FutureBuilder(
          future: movie,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var movieData = snapshot.data;
              return DetailView(movieData: movieData);
            } else if (snapshot.hasError) {
              //오류남
              return Text(snapshot.error.toString());
            } else {
              //로딩중
              var msg = '데이터 로드중입니다';
              return Center(
                  child: Text(
                msg,
                style: const TextStyle(fontSize: 50),
              ));
            }
          },
        ));
  }
}
