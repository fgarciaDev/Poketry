class PoketryModel {
  final String id;
  final String createdAt;
  final String userId;
  final String message;

  PoketryModel(
      {required this.id,
      required this.createdAt,
      required this.userId,
      required this.message});

  @override
  String toString() =>
      'PoketryModel(id: $id, createdAt: $createdAt, userId: $userId, message: $message)';

  factory PoketryModel.fromJson(Map<String, dynamic> json) => PoketryModel(
        id: json['id'] as String,
        createdAt: json['created_at'] as String,
        userId: json['user_id'] as String,
        message: json['message'] as String,
      );
}
