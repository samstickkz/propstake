import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../app_theme/palette.dart';
import '../data/services/local/user.service.dart';
import '../utils/widget_extensions.dart';
import 'apptexts.dart';

class ProfilePic extends StatelessWidget {
  final User user;
  final String? picture;
  final String? username;
  final double? size;
  final VoidCallback? onTap;
  final BoxFit? fit;
  final bool useBorder;
  final bool circleShape;
  final double? textSize;
  final Color? borderColor;
  final bool useGrayColor;
  final double? borderWidth;
  const ProfilePic({
    super.key,
    this.size,
    this.textSize,
    this.fit,
    this.onTap,
    this.circleShape = false,
    this.useBorder = false,
    this.borderColor,
    this.borderWidth,
    required this.user, this.picture, this.username,
    this.useGrayColor = false,
  });

  @override
  Widget build(BuildContext context) {

    String getInitials() {
      List<String> names = username != null? username!.split(" ") : ("${user.firstName??""} ${user.lastName??""}").split(' '); // Split the names by space
      String result = '';

      if (names.length == 1) {
        // If there's only 1 name, return the first letter of that name
        result = names[0].substring(0, 1).toUpperCase();
      } else if (names.length == 2) {
        // If there are exactly 2 names, return the first letter of each
        result = names[0].substring(0, 1).toUpperCase() + names[1].substring(0, 1).toUpperCase();
      } else if (names.length > 2) {
        // If there are more than 2 names, return the first letter of the first two names
        result = names[0].substring(0, 1).toUpperCase() + names[1].substring(0, 1).toUpperCase();
      }else {
        result = "";
      }

      return result;
    }

    String? userImage = picture?? user.profilePictureUrl;


    return InkWell(
      onTap: onTap,
      borderRadius: circleShape? BorderRadius.circular(size?? 42.sp) : BorderRadius.circular((size?? 42.sp)/5.25),
      child: SizedBox(
        height: size?? 42.sp,
        width: size?? 42.sp,
        child: Stack(
          children: [
            Container(
              height: size?? 42.sp,
              width: size?? 42.sp,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: useGrayColor? stateColor3(isAppDark(context)):  stateColor12(isAppDark(context)),
                // borderRadius: circleShape? BorderRadius.circular(size?? 42.sp) : BorderRadius.circular((size?? 42.sp)/5.25),
                image: userImage == null? null: userImage!.startsWith("http")?
                DecorationImage(
                  image:  CachedNetworkImageProvider(
                      userImage,
                  ),
                  fit: fit?? BoxFit.fill
                ):
                DecorationImage(
                  image: FileImage(File(userImage!)),
                  fit: fit?? BoxFit.fill
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if(userImage != null) 0.0.sp.sbH else AppText(
                    getInitials(),
                    size: textSize?? (size?? 40.sp) * 0.4, weight: FontWeight.w700,
                    color:useGrayColor? stateColor12(isAppDark(context)): white(isAppDark(context)),
                  ),
                ],
              )
            ),

          ],
        ),
      ),
    );
  }
}