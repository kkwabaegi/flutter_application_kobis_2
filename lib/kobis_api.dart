import 'dart:convert';

import 'package:http/http.dart' as http;

class KobisApi {
  final String apiKey;
  final String _site = 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/';
  KobisApi({required this.apiKey});

  Future<List<dynamic>> getDailyBoxOffice({required String targetDt}) async {
    var uri = '${_site}boxoffice/searchDailyBoxOfficeList.json';
    uri = '$uri?key=$apiKey';
    uri = '$uri&targetDt=$targetDt';
    //http에서 get으로 받으면 주소창에 정보가 보이고, post로 받으면 보이지 않는다
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      //정상 boxOfficeResult.dailyBoxOfficeList
      try {
        var movies = jsonDecode(response.body)['boxOfficeResult']
            ['dailyBoxOfficeList'] as List<dynamic>;
        return movies;
      } catch (e) {
        print('try catch에서 걸림');
        return [];
      }
    } else {
      //에러
      return [];
    }
  }

  Future<dynamic> getMovieDetail({required String movieCd}) async {
    var uri = '${_site}movie/searchMovieInfo.json';
    uri = '$uri?key=$apiKey';
    uri = '$uri&movieCd=$movieCd';
    //http에서 get으로 받으면 주소창에 정보가 보이고, post로 받으면 보이지 않는다
    var response = await http.get(Uri.parse(uri));
    print(response.body);
    if (response.statusCode == 200) {
      //정상 movieInfoResult.movieInfo
      try {
        var movie = jsonDecode(response.body)['movieInfoResult']['movieInfo']
            as dynamic;
        //movie[0] a[1] => 배열, 리스트 (index = 주소) 보기에 안편함
        //movie['name'] => Map
        return movie;
      } catch (e) {
        print('try catch에서 걸림');
        return [];
      }
    } else {
      //에러
      return [];
    }
  }

  Future<dynamic> getCompanyDetail({required String companyCd}) async {
    var uri = '${_site}company/searchCompanyInfo.json';
    uri = '$uri?key=$apiKey';
    uri = '$uri&movieCd=$companyCd';
    //http에서 get으로 받으면 주소창에 정보가 보이고, post로 받으면 보이지 않는다
    var response = await http.get(Uri.parse(uri));
    print(response.body);
    if (response.statusCode == 200) {
      //정상 movieInfoResult.movieInfo
      try {
        var movie = jsonDecode(response.body)['companyInfoResult']
            ['companyInfo'] as dynamic;
        //movie[0] a[1] => 배열, 리스트 (index = 주소) 보기에 안편함
        //movie['name'] => Map
        return movie;
      } catch (e) {
        print('try catch에서 걸림');
        return [];
      }
    } else {
      //에러
      return [];
    }
  }

  Future<List<dynamic>> getSearchMovieList(
      {required String searchType, required String searchValue}) async {
    var uri = '${_site}movie/searchMovieList.json';
    uri = '$uri?key=$apiKey';
    uri = '$uri&$searchType=$searchValue';
    //http에서 get으로 받으면 주소창에 정보가 보이고, post로 받으면 보이지 않는다
    var response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      //정상 boxOfficeResult.dailyBoxOfficeList
      try {
        var movies = jsonDecode(response.body)['movieListResult']['movieList']
            as List<dynamic>;
        return movies;
      } catch (e) {
        print('try catch에서 걸림');
        return [];
      }
    } else {
      //에러
      return [];
    }
  }
}
