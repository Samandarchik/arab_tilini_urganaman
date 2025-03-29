import 'package:flutter_bloc/flutter_bloc.dart';
import 'quiz_event.dart';
import 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(InitialQuizState()) {
    // Savollarni yuklash
    on<LoadQuizEvent>((event, emit) {
      try {
        // Misol uchun oddiy savollar
        List<String> questions = [
          "What is Flutter?",
          "Who created Dart?",
          "Is Flutter cross-platform?",
          "What is State Management?"
        ];
        emit(QuizLoadedState(questions: questions));
      } catch (e) {
        emit(QuizErrorState(error: "Failed to load quiz"));
      }
    });

    // Testni qayta boshlash
    on<ResetQuizEvent>((event, emit) {
      emit(InitialQuizState());
    });
  }
}
