class Post {
  String title;
  String description;
  String message;
  String iconImageUrl;
  String newsImageUrl;
  String date;
  String time;

  Post(
      {required this.title,
      required this.description,
      required this.message,
      required this.iconImageUrl,
      required this.newsImageUrl,
      required this.date,
      required this.time});

  @override
  String toString() {
    return 'Post{title: $title, description: $description, message: $message, iconImageUrl: $iconImageUrl, newsImageUrl: $newsImageUrl, date: $date, time: $time}';
  }

  Post.fromJson(Map<String, Object?> json)
      : this(
          title: json['title']! as String,
          description: json['description']! as String,
          message: json['message']! as String,
          iconImageUrl: json['iconImageUrl']! as String,
          newsImageUrl: json['newsImageUrl']! as String,
          date: json['date']! as String,
          time: json['time']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'description': description,
      'message': message,
      'iconImageUrl': iconImageUrl,
      'newsImageUrl': newsImageUrl,
      'date': date,
      'time': time,
    };
  }
}
