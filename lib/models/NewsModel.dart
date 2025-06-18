class StoryModel {
  final String title;
  final String image;

  StoryModel({required this.title, required this.image});
}

class UpdateModel {
  final String title;
  final String description;
  final String year;
  int votes;
  final bool isEvent;

  UpdateModel({
    required this.title,
    required this.description,
    required this.year,
    required this.votes,
    required this.isEvent,
  });
}
