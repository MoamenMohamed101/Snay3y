import 'package:flutter/material.dart';

class ClientFeedBackModel{
  final String feedBack;
  final String image;
   Icon star=const Icon( Icons.star);
  final String clientName;
  ClientFeedBackModel({required this.image,required this.feedBack, required this.clientName});
}