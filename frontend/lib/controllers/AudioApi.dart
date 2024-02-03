import 'package:http/http.dart' as http;

class AudioApi {
  static Future<http.Response> uploadFiles(String name, String file) async {
    try {
      final url = Uri.parse(
          'https://hookworm-heroic-evidently.ngrok-free.app/audio-similarity');
      var request = http.MultipartRequest('POST', url)
        ..files.add(await http.MultipartFile.fromPath("file1", file))
        ..files.add(await http.MultipartFile.fromPath("file2", file));

      var response = await request.send();
      return await http.Response.fromStream(response);
    } catch (e) {
      // print("Error uploading file: $e");
      return http.Response('Error uploading file', 500);
    }
  }
}