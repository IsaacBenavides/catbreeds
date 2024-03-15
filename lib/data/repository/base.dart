import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract class Api {
  final String apiUrl = dotenv.get("API_URL");
  Map<String, String> get headers => _buildHeaders();

  Map<String, String> _buildHeaders() {
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "x-api-key": dotenv.get("X_API_KEY"),
    };
    return headers;
  }

  Future<http.Response> get(
    String path, {
    bool? useFullUrl,
    Map<String, String>? queryParams,
  }) {
    String url = useFullUrl ?? true ? "$apiUrl$path" : path;
    Uri parsedUrl = Uri.parse(url).replace(queryParameters: queryParams);
    return http.get(parsedUrl, headers: headers).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        return http.Response('', 408);
      },
    );
  }
}

class BaseRepository extends Api {}
