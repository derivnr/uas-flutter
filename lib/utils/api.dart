import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl =
      'https://api-flutter-deri.000webhostapp.com/api-v2/';

  static Future<void> login(String username, String password) async {
    var headers = {
      'Cookie': 'PHPSESSID=nr8gopthkfkpjdt91r2kub5l5s',
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/login.php'),
    );

    request.fields.addAll({
      'username': username,
      'password': password,
    });

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
