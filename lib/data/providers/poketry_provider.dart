import 'package:flutter/material.dart';
import 'package:gemini_flutter/gemini_flutter.dart';
import 'package:poketry/data/models/poketry_model.dart';

const String geminiId = 'gemini.id';
const String userId = 'user.id';

class PoketryProvider extends ChangeNotifier {
  final List<PoketryModel> _poketryMessages = _initPoketryMessages();
  List<PoketryModel> get poketryMessages => _poketryMessages;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _poketryCompletion(String? poketry) {
    if (poketry != null && poketry.isNotEmpty) {
      _isLoading = false;
      postPoketryMessage(poketry, geminiId);
    }
    ;
  }

  void postPoketryMessage(String message, String senderId) {
    final newMessage = PoketryModel(
      id: _poketryMessages.length.toString(),
      createdAt: DateTime.now().toIso8601String(),
      userId: senderId,
      message: message,
    );

    _poketryMessages.insert(0, newMessage);

    if (senderId == userId) {
      _isLoading = true;
      _getPoketry('subject').then(_poketryCompletion);
    }

    notifyListeners();
  }
}

Future<String?> _getPoketry(String prompt) async {
  debugPrint('_getPoketry: Entry');

  final response = await GeminiHandler().geminiPro(
    text: 'Write a haiku about Pokemon and $prompt',
    logCountTokens: true,
    temprature: 0.9,
    topP: 0.95,
    topK: 40,
    outputLength: 1024,
  );

  if (response != null) {
    debugPrint('Response: $response');
    final result = response.candidates?.first.content?.parts?.first.text;
    debugPrint('Generated Text: $result');
    return result ??
        'Gemini could not procees your request. Adjust your prompt and try again.';
  }

  debugPrint('ERROR: _getPoketry: response is null');
  return 'Gemini could not procees your request. Adjust your prompt and try again.';
}

List<PoketryModel> _initPoketryMessages() {
  final date1 = DateTime.now().toIso8601String();
  final date2 = DateTime.now().toIso8601String();
  return [
    {
      'id': '2',
      'created_at': date2,
      'user_id': geminiId,
      'message':
          'Give me a Pokémon character and I\'ll create a haiku for you!',
    },
    {
      'id': '1',
      'created_at': date1,
      'user_id': geminiId,
      'message': 'Hey there!',
    },
  ].map((json) => PoketryModel.fromJson(json)).toList();
}
