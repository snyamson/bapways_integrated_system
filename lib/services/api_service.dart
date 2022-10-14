import 'package:bapways_integrated_system/constants/api_url.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect implements GetxService {
  ApiService() {
    baseUrl = ApiUrl.baseUrl;
    timeout = const Duration(seconds: 30);
  }

// FETCH DATA
  Future<Response> fetchData({required String uri}) async {
    final Response response = await get(ApiUrl.baseUrl + uri,
        headers: {'Content-Type': 'application/json'});

    if (response.status.hasError) {
      return Future.error(response.statusText as Object);
    }

    return response;
  }

  Future<Response> getData({required String uri}) async {
    try {
      Response response = await get(uri,
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

// POST DATA
  Future<Response> postData(
      {required String uri, required dynamic body}) async {
    try {
      Response response =
          await post(uri, body, headers: {'Content-Type': 'application/json'});
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

// UPDATE DATA
  Future<Response> updateData(
      {required String uri, required dynamic body}) async {
    try {
      Response response =
          await patch(uri, body, headers: {'Content-Type': 'application/json'});
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

// DELETE DATA
  Future<Response> deleteData(String uri) async {
    Response response =
        await delete(uri, headers: {'Content-Type': 'application/json'});
    return response;
  }
}
