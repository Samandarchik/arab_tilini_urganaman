import 'package:equatable/equatable.dart';

// Asosiy holat
abstract class QuizState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Dastlabki holat
class InitialQuizState extends QuizState {}

// Savollar yuklangan holat
class QuizLoadedState extends QuizState {
  final List<String> questions;

  QuizLoadedState({required this.questions});

  @override
  List<Object?> get props => [questions];
}

// Xatolik yuzaga kelgan holat
class QuizErrorState extends QuizState {
  final String error;

  QuizErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
