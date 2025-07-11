import 'package:closed_network/Authentication/ManualAuth.dart';

import '../models/UserModel.dart';

final UserData user = UserData(
  name: '${authService.value.currentUser?.displayName}',
  handle: '${authService.value.currentUser?.email}',
  bio: 'Builder @ Learno | Co-founder | Web3 Dev | Flutter & AI enthusiast',
  location: 'India',
  website: 'https://rehbarkhan.dev',
  joinDate: authService.value.currentUser?.metadata.creationTime,
  following: 340,
  followers: 1120,
  profileImageUrl: 'https://randomuser.me/api/portraits/men/52.jpg',
  coverImageUrl: 'https://images.unsplash.com/photo-1503264116251-35a269479413?auto=format&fit=crop&w=1400&q=80',
);
