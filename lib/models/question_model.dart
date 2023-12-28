class AnimalTriviaQuestion {
  String question;
  List<String> options;
  String correctAnswer;
 // New property for the image URL

  AnimalTriviaQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  
  });
}

// Example usage:
List<AnimalTriviaQuestion> animalTriviaQuestions = [
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
    question: "What type of animal is this below?",
    options: ["Lion", "Tiger", "Bear", "Elephant"],
    correctAnswer: "Lion",
   
  ),
  // Add more questions as needed
];
