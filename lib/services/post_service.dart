import 'package:consume_api/utils/endpoint.dart';
import 'package:consume_api/utils/request_helper.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<http.Response> fetch() async {
    String endPoint = EndPoint.post;
    Uri url = Uri.parse(endPoint);
    return await http.get(
      url,
      headers: RequestHelper.basicHeader(),
    );
  }
}