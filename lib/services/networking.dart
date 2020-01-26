import 'package:dio/dio.dart';

class GetHttp {
  final String url;

  GetHttp(this.url);

  Future getData() async {
    Response response = await Dio().get(url);
    return response.data;
  }
}
