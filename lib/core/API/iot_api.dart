import 'package:http/http.dart' as http;

class IotApi {
  static const String esp32Url = 'http://192.168.161.176/add_reminder';

  static Future<bool> sendReminder(String name, String time) async {
    final reminder = '$name,$time';
    try {
      final response = await http.post(Uri.parse(esp32Url), body: reminder);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
