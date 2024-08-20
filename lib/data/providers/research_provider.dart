import 'package:flutter/material.dart';
import 'package:poketry/views/poketry/mock_data.dart';
import 'package:poketry/data/models/research_model.dart';

const String researchBotId = 'bot.support.id';
const String mockUserId = 'mock.user.id';

class ResearchProvider extends ChangeNotifier {
  final List<ResearchModel> _researchMessages = getMockAiDecksMessages();
  List<ResearchModel> get researchMessages => _researchMessages;

  void postResearchMessage(String message, String senderId) {
    final newMessage = ResearchModel(
      id: _researchMessages.length.toString(),
      createdAt: DateTime.now().toIso8601String(),
      userId: senderId,
      message: message,
    );
    _researchMessages.insert(0, newMessage);
    notifyListeners();
  }
}
