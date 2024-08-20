import 'package:poketry/data/models/research_model.dart';

/// MOCK RESEARCH DATA
///
List<ResearchModel> getMockAiDecksMessages() {
  return [
    {
      'id': '2',
      'created_at': '2024-06-17T08:50:06.605Z',
      'user_id': supportBotId,
      'message':
          'Give me a Pokémon character and I\'ll create a haiku for you!',
    },
    {
      'id': '1',
      'created_at': '2024-06-17T08:50:06.105Z',
      'user_id': supportBotId,
      'message': 'Hey there!',
    },
  ].map((json) => ResearchModel.fromJson(json)).toList();
}
