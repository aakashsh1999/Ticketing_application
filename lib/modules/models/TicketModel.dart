import 'dart:convert';

class TicketModel {
   int ticketId;
   int accountId;
   int userId;
   int assignedUserId;
   String description;
   DateTime date;
   
  TicketModel({
    required this.ticketId,
    required this.accountId,
    required this.userId,
    required this.assignedUserId,
    required this.description,
    required this.date,
  });


  TicketModel copyWith({
    int? ticketId,
    int? accountId,
    int? userId,
    int? assignedUserId,
    String? description,
    DateTime? date,
  }) {
    return TicketModel(
      ticketId: ticketId ?? this.ticketId,
      accountId: accountId ?? this.accountId,
      userId: userId ?? this.userId,
      assignedUserId: assignedUserId ?? this.assignedUserId,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ticketId': ticketId,
      'accountId': accountId,
      'userId': userId,
      'assignedUserId': assignedUserId,
      'description': description,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      ticketId: map['ticketId']?.toInt() ?? 0,
      accountId: map['accountId']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      assignedUserId: map['assignedUserId']?.toInt() ?? 0,
      description: map['description'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketModel.fromJson(String source) => TicketModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TicketModel(ticketId: $ticketId, accountId: $accountId, userId: $userId, assignedUserId: $assignedUserId, description: $description, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TicketModel &&
      other.ticketId == ticketId &&
      other.accountId == accountId &&
      other.userId == userId &&
      other.assignedUserId == assignedUserId &&
      other.description == description &&
      other.date == date;
  }

  @override
  int get hashCode {
    return ticketId.hashCode ^
      accountId.hashCode ^
      userId.hashCode ^
      assignedUserId.hashCode ^
      description.hashCode ^
      date.hashCode;
  }
}
