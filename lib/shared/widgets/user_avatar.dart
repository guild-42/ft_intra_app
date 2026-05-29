import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserAvatar extends StatelessWidget {
  final String login;
  final String? imageUrl;
  final double radius;

  const UserAvatar({
    super.key,
    required this.login,
    this.imageUrl,
    this.radius = 20,
  });

  String get _initials => login.length >= 2
      ? login.substring(0, 2).toUpperCase()
      : login.toUpperCase();

  @override
  Widget build(BuildContext context) {
    final url = imageUrl ?? 'https://cdn.intra.42.fr/users/medium_$login.jpg';
    return CircleAvatar(
      radius: radius,
      backgroundColor: const Color(0xFF00BABC),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: url,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          errorWidget: (_, __, ___) => Container(
            color: const Color(0xFF00BABC),
            alignment: Alignment.center,
            child: Text(
              _initials,
              style: TextStyle(
                fontSize: radius * 0.6,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          placeholder: (_, __) => Container(
            color: const Color(0xFF00BABC),
            alignment: Alignment.center,
            child: Text(
              _initials,
              style: TextStyle(
                fontSize: radius * 0.6,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
