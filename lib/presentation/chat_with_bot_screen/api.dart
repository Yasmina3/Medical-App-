import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../core/utils/api_urls.dart';

Future<String> fetchChatbotResponse(String message) async {
  try {
    final response = await http.post(
      Uri.parse(Endpoints.chatbotResponse),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'message': message}),
    );

    print("response: ${response.statusCode}");

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      String botResponse = data['response'];
      print("botResponse : $botResponse");
      return botResponse;
    } else {
      print("Error: ${response.body}");
      return "No response from chatbot";
    }
  } catch (error) {
    print("Error: ${error.toString()}");
    return "Error occurred";
  }
}