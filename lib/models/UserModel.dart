class UserData {
  final String name;
  final String handle;
  final String bio;
  final String location;
  final String website;
  final DateTime joinDate;
  final int following;
  final int followers;
  final String profileImageUrl;
  final String coverImageUrl;

  UserData({
    required this.name,
    required this.handle,
    this.bio = '',
    this.location = '',
    this.website = '',
    DateTime? joinDate,
    int? following,
    int? followers,
    String? profileImageUrl,
    String? coverImageUrl,
  })  : joinDate = joinDate ?? DateTime.now(),
        following = following ?? 0,
        followers = followers ?? 0,
        profileImageUrl = profileImageUrl ?? 'https://via.placeholder.com/200',
        coverImageUrl = coverImageUrl ??
            'https://images.unsplash.com/photo-1503264116251-35a269479413?auto=format&fit=crop&w=1400&q=80';
}
