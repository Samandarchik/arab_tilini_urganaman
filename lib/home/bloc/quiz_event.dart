import 'package:equatable/equatable.dart';

abstract class QuizEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Savollar yuklash event
class LoadQuizEvent extends QuizEvent {}

// Qayta boshlash event
class ResetQuizEvent extends QuizEvent {}
