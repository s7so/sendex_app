import 'package:http/http.dart' as http;
import 'dart:convert';

class WhatsappService {
  // Vonage API credentials
  final String apiKey = '5459f10f';
  final String apiSecret = 'mKSdrcbfNAcqHo3v';

  // Vonage WhatsApp number
  final String vonageWhatsappNumber = '+14157386102';

  Future<bool> sendWhatsappOtp(
      {required String recipientPhoneNumber, required String otpCode}) async {
    final String apiUrl = 'https://messages-sandbox.nexmo.com/v1/messages';

    // Create request body as per Vonage API specification
    final Map<String, dynamic> requestBody = {
      "from": vonageWhatsappNumber,
      "to": recipientPhoneNumber,
      "message_type": "text",
      "text": 'رمز التحقق الخاص بك هو: $otpCode',
      "channel": "whatsapp"
    };

    // Convert request body to JSON
    final String jsonBody = jsonEncode(requestBody);

    // Create Basic Auth header
    final String basicAuth = 
        'Basic ' + base64Encode(utf8.encode('$apiKey:$apiSecret'));

    try {
      // Make POST request to Vonage API
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': basicAuth,
        },
        body: jsonBody,
      );

      // Handle response
      if (response.statusCode == 202) {
        print('Message sent successfully to: $recipientPhoneNumber');
        return true;
      } else {
        print('Failed to send message. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error sending WhatsApp message: $e');
      return false;
    }
  }
}
