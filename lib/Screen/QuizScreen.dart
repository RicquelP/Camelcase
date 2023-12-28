import 'package:animal_trivia/Screen/HomeScreen.dart';
import 'package:animal_trivia/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<AnimalTriviaQuestion> _questions = [
    // Your list of questions goes here...
     AnimalTriviaQuestion(
    question: "What is the largest mammal on Earth?",
    options: ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"],
    correctAnswer: "Blue Whale",
   
  ),
  AnimalTriviaQuestion(
    question: "How many legs does a spider have?",
    options: ["4", "6", "8", "10"],
    correctAnswer: "8",
  
  ),
  AnimalTriviaQuestion(
    question: "Which Animal is the King of the Jungle?",
    options: ["Lion", "Tiger", "Bear", "Elephant"],
    correctAnswer: "Lion",
  
  ),
  AnimalTriviaQuestion(
  question: "Which of these is the fastest animal alive on land?",
  options: ["Cheetah", "Peregrine Falcon", "Blue Wildebeest", "Sailfish"],
  correctAnswer: "Cheetah",
),

AnimalTriviaQuestion(
  question: "Which animal is known as the 'Gentle Giant'?",
  options: ["Elephant", "Giraffe", "Hippopotamus", "Whale Shark"],
  correctAnswer: "Elephant",
),

  ];

  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animal Kingdom Quiz'),
      ),
      body: _currentQuestionIndex < _questions.length
          ? _buildQuestionScreen()
          : _buildScoreScreen(totalQuestions: _questions.length, correctAnswers: _correctAnswers),
    );
  }

  Widget _buildQuestionScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            _questions[_currentQuestionIndex].question,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _questions[_currentQuestionIndex].options.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _checkAnswer(index);
                  },
                  child: Text(
                    _questions[_currentQuestionIndex].options[index],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildScoreScreen({required int totalQuestions, required int correctAnswers}) {
    double percentage = (_correctAnswers / _questions.length) * 100;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz Completed!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            'Your Score: ${percentage.toStringAsFixed(2)}%',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeScreen()));
            },
            child: Text('Return to Home'),
          ),
        ],
      ),
    );
  }

  void _checkAnswer(int selectedOptionIndex) {
    String selectedOption =
        _questions[_currentQuestionIndex].options[selectedOptionIndex];
    String correctAnswer = _questions[_currentQuestionIndex].correctAnswer;

    bool isCorrect = selectedOption == correctAnswer;

    if (isCorrect) {
      setState(() {
        _correctAnswers++;
      });
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCorrect ? 'Correct!' : 'Wrong!'),
          content: Text(isCorrect
              ? 'Congratulations! Your answer is correct.'
              : 'Oops! The correct answer is $correctAnswer.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _nextQuestion();
              },
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }
    void _nextQuestion() {
      setState(() {
        if (_currentQuestionIndex < _questions.length - 1) {
          _currentQuestionIndex++;
        } else {
          // Navigate to the score screen when all questions are answered
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => _buildScoreScreen(
                totalQuestions: _questions.length,
                correctAnswers: _correctAnswers,
              ),
            ),
          );
        }
      });
    }
    }
