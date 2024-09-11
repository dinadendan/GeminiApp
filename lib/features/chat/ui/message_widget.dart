import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.message,
    required this.isFromUser,
  });

  final String message;
  final bool isFromUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Align(
        alignment:
        isFromUser ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 0.75.sw,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: isFromUser
                  ? const Color(0xFF4F8EE5)
                  : const Color(0xFF3D3D3D),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.r),
                topRight: Radius.circular(18.r),
                bottomLeft: isFromUser
                    ? Radius.circular(18.r)
                    : const Radius.circular(0),
                bottomRight: isFromUser
                    ? const Radius.circular(0)
                    : Radius.circular(18.r),
              ),
            ),
            padding: EdgeInsets.all(12.h),
            child: Text(
              message,
            ),
          ),
        ),
      ),
    );
  }
}