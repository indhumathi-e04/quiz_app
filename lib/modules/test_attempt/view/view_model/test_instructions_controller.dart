import 'package:get/get.dart';

import '../../../../models/test_model.dart';
import '../../../../routes/app_route_constants.dart';
import '../../domain/usecase/test_attempt_usecase.dart';

class TestInstructionsController extends GetxController {
  late final TestModel testModel;
  final TestAttemptUseCase _useCase;
  TestInstructionsController({required TestAttemptUseCase useCase})
      : _useCase = useCase;

  @override
  void onInit() {
    super.onInit();
    testModel = Get.arguments;
  }

  void navigateToTestAttemptScreen() {
    Get.offAndToNamed(
      AppRouteConstants.routeTestAttempt,
      arguments: {
        "test_model": testModel,
        // "test_model": TestModel(
        //   testId: 1,
        //   examCategory: null,
        //   examName: null,
        //   testType: null,
        //   contentType: null,
        //   subject: null,
        //   chapter: null,
        //   language: null,
        //   testTitle: "NEET 2023 - Full length mock test",
        //   timeLimit: 60,
        //   sectionsCount: 3,
        //   instructions: "Some random instructions",
        //   sections: [
        //     SectionModel(
        //       sectionId: 1,
        //       sectionTitle: "Physics",
        //       questionCount: 5,
        //       positiveMarks: 1,
        //       negativeMarks: 0.25,
        //       isSectionTimeSpecific: 1,
        //       sectionTimeLimit: 20,
        //     ),
        //     SectionModel(
        //       sectionId: 2,
        //       sectionTitle: "Chemistry",
        //       questionCount: 5,
        //       positiveMarks: 1,
        //       negativeMarks: 0,
        //       isSectionTimeSpecific: 1,
        //       sectionTimeLimit: 20,
        //     ),
        //     SectionModel(
        //       sectionId: 3,
        //       sectionTitle: "Biology",
        //       questionCount: 5,
        //       positiveMarks: 2,
        //       negativeMarks: 0,
        //       isSectionTimeSpecific: 1,
        //       sectionTimeLimit: 20,
        //     ),
        //   ],
        //   questionsCount: 15,
        //   questions: [
        //     QuestionModel(
        //       questionType: 1,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        //       option1:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option2:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option3:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option4:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option5: null,
        //       fillInTheBlanksCorrectAnswer: null,
        //       multipleChoiceCorrectOption: 1,
        //       trueOrFalseCorrectAnswer: null,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 1,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        //       option1:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option2:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option3:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option4:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option5: null,
        //       fillInTheBlanksCorrectAnswer: null,
        //       multipleChoiceCorrectOption: 2,
        //       trueOrFalseCorrectAnswer: null,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 1,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        //       option1:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option2:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option3:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option4:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option5: null,
        //       fillInTheBlanksCorrectAnswer: null,
        //       multipleChoiceCorrectOption: 3,
        //       trueOrFalseCorrectAnswer: null,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 2,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option1: null,
        //       option2: null,
        //       option3: null,
        //       option4: null,
        //       option5: null,
        //       fillInTheBlanksCorrectAnswer: "hello",
        //       multipleChoiceCorrectOption: null,
        //       trueOrFalseCorrectAnswer: null,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 2,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option1: null,
        //       option2: null,
        //       option3: null,
        //       option4: null,
        //       option5: null,
        //       fillInTheBlanksCorrectAnswer: "hello",
        //       multipleChoiceCorrectOption: null,
        //       trueOrFalseCorrectAnswer: null,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 2,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option1: null,
        //       option2: null,
        //       option3: null,
        //       option4: null,
        //       option5: null,
        //       fillInTheBlanksCorrectAnswer: "hello",
        //       multipleChoiceCorrectOption: null,
        //       trueOrFalseCorrectAnswer: null,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 3,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        //       option1: null,
        //       option2: null,
        //       option3: null,
        //       option4: null,
        //       option5: null,
        //       fillInTheBlanksCorrectAnswer: null,
        //       multipleChoiceCorrectOption: null,
        //       trueOrFalseCorrectAnswer: 1,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 3,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        //       option1: null,
        //       option2: null,
        //       option3: null,
        //       option4: null,
        //       option5: null,
        //       fillInTheBlanksCorrectAnswer: null,
        //       multipleChoiceCorrectOption: null,
        //       trueOrFalseCorrectAnswer: 1,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 3,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        //       option1: null,
        //       option2: null,
        //       option3: null,
        //       option4: null,
        //       option5: null,
        //       fillInTheBlanksCorrectAnswer: null,
        //       multipleChoiceCorrectOption: null,
        //       trueOrFalseCorrectAnswer: 1,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 4,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option1: null,
        //       option2: null,
        //       option3: null,
        //       option4: null,
        //       option5: null,
        //       fillInTheBlanksCorrectAnswer: "123",
        //       multipleChoiceCorrectOption: null,
        //       trueOrFalseCorrectAnswer: null,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 4,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option1: null,
        //       option2: null,
        //       option3: null,
        //       option4: null,
        //       option5: null,
        //       fillInTheBlanksCorrectAnswer: "123",
        //       multipleChoiceCorrectOption: null,
        //       trueOrFalseCorrectAnswer: null,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 4,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option1: null,
        //       option2: null,
        //       option3: null,
        //       option4: null,
        //       option5: null,
        //       fillInTheBlanksCorrectAnswer: "123",
        //       multipleChoiceCorrectOption: null,
        //       trueOrFalseCorrectAnswer: null,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 5,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        //       option1:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option2:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option3:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option4:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option5:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       fillInTheBlanksCorrectAnswer: null,
        //       multipleChoiceCorrectOption: 1,
        //       trueOrFalseCorrectAnswer: null,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 5,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        //       option1:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option2:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option3:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option4:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option5:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       fillInTheBlanksCorrectAnswer: null,
        //       multipleChoiceCorrectOption: 2,
        //       trueOrFalseCorrectAnswer: null,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //     QuestionModel(
        //       questionType: 5,
        //       question:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        //       option1:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option2:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option3:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option4:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       option5:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //       fillInTheBlanksCorrectAnswer: null,
        //       multipleChoiceCorrectOption: 3,
        //       trueOrFalseCorrectAnswer: null,
        //       solutionExplanation:
        //           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        //     ),
        //   ],
        // ),
      },
    );
  }

  void onStartTestTapped() {
    navigateToTestAttemptScreen();
  }
}
