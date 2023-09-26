import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snay3y/screens/user_screens/Description/cubit/states.dart';

class DescriptionCubit extends Cubit<DescriptionStates>{
  DescriptionCubit() : super(DescInitialState());
  static DescriptionCubit get(context)=> BlocProvider.of(context);
  double rating =0;
  void updateRating(double index) {
    rating=index;
    emit(UpdateratingState());
  }
  IconData Heart = CupertinoIcons.heart;
  bool isliked = true;
  void ToggleHeart()
  {
    isliked = !isliked;
    Heart=isliked ? CupertinoIcons.heart:CupertinoIcons.heart_fill;
    emit(toggleheartState());
  }
}