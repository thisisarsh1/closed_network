import 'package:closed_network/Components/LikeBtn.dart';
import 'package:closed_network/Components/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Components/TapLike.dart';
import 'models/Posts_model.dart';

class PostDetailScreen extends StatefulWidget {
  final PostModel post;

  const PostDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  bool _isLiked = false;
  bool _isFollowed = false;
  int _currentLikes = 0;
  final TextEditingController _commentController = TextEditingController();
  final FocusNode _commentFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _currentLikes = widget.post.likes;
  }

  void _handleLike() {
    HapticFeedback.lightImpact();
    setState(() {
      _isLiked = !_isLiked;
      _currentLikes += _isLiked ? 1 : -1;
    });
  }

  void _handleFollow() {
    setState(() {
      _isFollowed = !_isFollowed;
    });
  }

  void _focusCommentField() {
    FocusScope.of(context).requestFocus(_commentFocusNode);
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + 300,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    _commentFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Post Image
                TapLike(
                  image: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.post.imageUrl,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                  onLike: () { }, // <-- does nothing!
                ),


                const SizedBox(height: 16),

                // Profile Info + Follow Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Avatar(),
                          const SizedBox(width: 10),
                          Text(
                            '@${widget.post.username}',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: _handleFollow,
                        style: TextButton.styleFrom(
                          backgroundColor:
                          _isFollowed ? Colors.grey[800] : Colors.tealAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          _isFollowed ? 'Following' : 'Follow',
                          style: GoogleFonts.inter(
                            color:
                            _isFollowed ? Colors.grey[300] : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.post.description,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: Colors.white70,
                      height: 1.4,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Stats (Likes & Comments Count)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.pinkAccent, size: 18),
                      const SizedBox(width: 6),
                      Text('$_currentLikes',
                          style: const TextStyle(color: Colors.white)),
                      const SizedBox(width: 20),
                      Icon(Icons.mode_comment_outlined,
                          color: Colors.cyanAccent, size: 18),
                      const SizedBox(width: 6),
                      Text('${widget.post.comments}',
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Action Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          _isLiked
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: _isLiked ? Colors.pinkAccent : Colors.white,
                        ),
                        onPressed: _handleLike,
                      ),
                      IconButton(
                        icon: const Icon(Icons.chat_bubble_outline,
                            color: Colors.cyanAccent),
                        onPressed: _focusCommentField,
                      ),
                      IconButton(
                        icon: const Icon(Icons.share_outlined,
                            color: Colors.greenAccent),
                        onPressed: () => HapticFeedback.mediumImpact(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Back Button (Fixed on Screen)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new,
                        size: 20, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
          ),

          // Sticky Comment Input Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border(
                  top: BorderSide(color: Colors.grey[850]!),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: TextField(
                        controller: _commentController,
                        focusNode: _commentFocusNode,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Tweet your reply',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[900],
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: IconButton(
                      icon: const Icon(Icons.send_rounded,
                          color: Colors.tealAccent),
                      onPressed: () {
                        final text = _commentController.text.trim();
                        if (text.isNotEmpty) {
                          HapticFeedback.lightImpact();
                          print("Send comment: $text");
                          _commentController.clear();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
