import 'dart:async';
import 'package:closed_network/Components/LikeBtn.dart';
import 'package:closed_network/Components/TapLike.dart';
import 'package:closed_network/Components/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/StoryModel.dart';
import 'Functions/Like/like_bloc.dart';

class StoryViewScreen extends StatefulWidget {
  final List<StoryModel> stories;
  final int startIndex;

  const StoryViewScreen({
    super.key,
    required this.stories,
    this.startIndex = 0,
  });

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  late PageController _pageController;
  Timer? _timer;
  double _progress = 0.0;
  bool _isPaused = false;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.startIndex;
    _pageController = PageController(initialPage: _currentIndex);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startProgress();
    });
  }

  void startProgress() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!_isPaused) {
        setState(() {
          _progress += 0.01;
        });
        if (_progress >= 1.0) {
          _timer?.cancel();
          if (_currentIndex < widget.stories.length - 1) {
            _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
            _progress = 0.0;
            startProgress();
          } else {
            Navigator.pop(context);
          }
        }
      }
    });
  }

  void pause() {
    setState(() {
      _isPaused = true;
    });
  }

  void resume() {
    setState(() {
      _isPaused = false;
    });
  }

  void goToPreviousStory() {
    if (_currentIndex > 0) {
      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      setState(() => _progress = 0.0);
      startProgress();
    }
  }

  void goToNextStory() {
    if (_currentIndex < widget.stories.length - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      setState(() => _progress = 0.0);
      startProgress();
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return 

      Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: GestureDetector(
            onLongPress: pause,
            onLongPressUp: resume,
            onTapUp: (details) {
              final width = MediaQuery.of(context).size.width;
              final dx = details.localPosition.dx;
              if (dx < width * 0.25) {
                goToPreviousStory();
              } else if (dx > width * 0.75) {
                goToNextStory();
              }
            },
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                  _progress = 0.0;
                });
                startProgress();
              },
              itemCount: widget.stories.length,
              itemBuilder: (context, index) {
                final story = widget.stories[index];
                return BlocProvider(
  create: (context) => LikeBloc(initialLike: story.likes),
  child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LinearProgressIndicator(
                          value: index == _currentIndex ? _progress : (index < _currentIndex ? 1.0 : 0.0),
                          backgroundColor: Colors.white24,
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.tealAccent),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          child: Row(
                            children: [
                              Avatar(imageUrl: story.profileUrl),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(story.name,
                                      style: GoogleFonts.sora(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  Text(story.timeAgo,
                                      style: GoogleFonts.sora(
                                          fontSize: 12, color: Colors.white70)),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white54),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                child: Text("Subscribe",
                                    style: GoogleFonts.sora(color: Colors.white)),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(Icons.close, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: story.image.isNotEmpty
                              ? ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: TapLike(image: ClipRect(
                              child: Image.network(
                                story.image,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Center(
                                  child: Text(
                                    'Image failed to load',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ),
                              ),
                            ),)

                          )
                              : const Center(
                            child: Text(
                              'No image provided.',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(story.title,
                                  style: GoogleFonts.sora(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  LikeBtn(initialLikes: story.likes),
                                  const Spacer(),
                                  const Icon(Icons.reply, color: Colors.white70),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.more_vert, color: Colors.white70),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
);
              },
            ),
          ),
        ),
      
    );
  }
}