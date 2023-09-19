import 'package:flutter/material.dart';

class ClientFeedBackModel{
  final String feedBack;
  final String image;
   Icon star=Icon( Icons.star);
  final String clientnName;
  ClientFeedBackModel({required this.image,required this.feedBack, required this.clientnName});
}