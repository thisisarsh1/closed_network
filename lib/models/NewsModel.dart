class UpdateModel {
  final String title;
  final String description;
  final String year;
  int votes;
  final bool isDownload;
  final String? link; // nullable, conditionally required

  UpdateModel({
    required this.title,
    required this.description,
    required this.year,
    required this.votes,
    required this.isDownload,
    this.link,
  }) : assert(
  isDownload == false || link != '',
  'link must be provided if isDownload is true',
  );
}
