
class Event {
  DateTime? createdAt;
  String? title;
  String? description;
  Status? status;
  DateTime? startAt;
  int? duration;
  String? id;

  Event({
    this.createdAt,
    this.title,
    this.description,
    this.status,
    this.startAt,
    this.duration,
    this.id,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    title: json["title"],
    description: json["description"],
    status: json["status"] == null ? null : StatusExtension.fromString(json["status"]),
    startAt: json["startAt"] == null ? null : DateTime.parse(json["startAt"]),
    duration: json["duration"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt?.toIso8601String(),
    "title": title,
    "description": description,
    "status": status?.toStringValue(),
    "startAt": startAt?.toIso8601String(),
    "duration": duration,
    "id": id,
  };




  String getTimeRange() {
  
  DateTime endTime = startAt!.add(Duration(minutes: duration!));

 
  String formatTime(DateTime time) {
    int hour = time.hour % 12;
    if (hour == 0) hour = 12; 
    String period = time.hour < 12 ? 'AM' : 'PM';
    String minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute $period";
  }

  
  String startFormatted = formatTime(startAt!);
  String endFormatted = formatTime(endTime);

 
  return "$startFormatted - $endFormatted";
}
}

enum Status { cancelled, confirmed }

extension StatusExtension on Status {
  String toStringValue() {
    switch (this) {
      case Status.cancelled:
        return 'Cancelled';
      case Status.confirmed:
        return 'Confirmed';
    }
  }

  static Status fromString(String status) {
    switch (status) {
      case 'Cancelled':
        return Status.cancelled;
      case 'Confirmed':
        return Status.confirmed;
      default:
        throw ArgumentError('Unknown status: $status');
    }
  }
}
