import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aio/widgets/shimmer/shimmer_avatar.dart';

class UserAvatar extends StatelessWidget {
  final String? url;
  final double avatarSize;

  final Function()? onTapped;

  const UserAvatar(
      {super.key, this.url, this.onTapped, this.avatarSize = 40.0});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: avatarSize,
      height: avatarSize,
      child: GestureDetector(
        onTap: onTapped,
        child: ClipOval(
          child: url == null || url!.isEmpty
              ? const _DefaultAvatarWidget()
              : CachedNetworkImage(
                  imageUrl: url!,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: ShimmerAvatar(),
                      ),
                  errorWidget: (_, __, ___) => const _DefaultAvatarWidget()),
        ),
      ),
    );
  }
}

class _DefaultAvatarWidget extends StatelessWidget {
  const _DefaultAvatarWidget();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/Regular/UserCircle.svg',
      width: 40.0,
      height: 40.0,
    );
  }
}
