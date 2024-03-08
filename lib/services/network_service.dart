import 'package:dio/dio.dart';

import '../models/post_model.dart';

class NetworkService {

  /// Base Url */
  static bool isTester = true;

  static String DEVELOPMENT = "https://6554a27063cafc694fe6bbeb.mockapi.io";
  static String DEPLOYMENT = "https://6554a27063cafc694fe6bbeb.mockapi.io";

  static String get baseApiUrl {
    if (isTester) return DEVELOPMENT;
    return DEPLOYMENT;
  }

  /// Apis
  static const String apiGetAllPosts = "/posts";


  /// Headers
  static Map<String, String> get headers => const <String, String>{
    'Content-Type': 'application/json',
  };

  /// BaseOptions */
  static final BaseOptions _baseDioOptions = BaseOptions(
    baseUrl: baseApiUrl,
    headers: headers,
    connectTimeout: const Duration(seconds: 4000),
    receiveTimeout: const Duration(seconds: 4000),
    contentType: 'application/json',
    responseType: ResponseType.json,
  );

  static final Dio _dio = Dio(_baseDioOptions);


  /// Methods
  static Future<List<dynamic>?> getData(String api, Map<String, dynamic> param)async{
    Response response = await _dio.get(api, queryParameters: param);
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.data;
    }else{
      return null;
    }
  }


  /// Params
  static Map<String, dynamic> paramEmpty() => const<String, dynamic>{};



  /// Parsing
  static List<Post> parsePostList(List json) {
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }


}