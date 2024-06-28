import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Style/constant.dart';
import 'notification_model.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel model;

  const NotificationItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 13, left: 13, top: 8),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(bottom: 8.0),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                offset: Offset(3, 3),
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: Icon(Icons.person, color: textColor),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title ?? "Notification",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'font1',
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Text(
                      model.body ?? "You have a new notification.",
                      style: TextStyle(
                        fontFamily: 'font1',
                        fontSize: 18,
                        color: grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Text(
                      "${model.createdAt.hour.toString()} : ${model.createdAt.minute.toString()} : ${model.createdAt.second.toString()} | ${model.createdAt.day.toString()} - ${model.createdAt.month.toString()} - ${model.createdAt.year.toString()}" ??
                          "You have a new notification.",
                      style: TextStyle(
                        fontFamily: 'font1',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
