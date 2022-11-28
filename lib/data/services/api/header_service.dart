class HeadersService {
  /// return headers for API's requests

  Future<Map<String, String>> getHeadersAuth() async => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'cookie' //todo
      };

  Future<Map<String, String>> getUnauthHeaders() async => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Cookie': '', //todo
      };
}
