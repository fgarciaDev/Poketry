const String supportBotId = 'bot.support.id';
const String mockUserId = 'mock.user.id';

class ResearchModel {
  final String id;
  final String createdAt;
  final String userId;
  final String message;

  ResearchModel(
      {required this.id,
      required this.createdAt,
      required this.userId,
      required this.message});

  @override
  String toString() =>
      'ResearchModel(id: $id, createdAt: $createdAt, userId: $userId, message: $message)';

  factory ResearchModel.fromJson(Map<String, dynamic> json) => ResearchModel(
        id: json['id'] as String,
        createdAt: json['created_at'] as String,
        userId: json['user_id'] as String,
        message: json['message'] as String,
      );
}
