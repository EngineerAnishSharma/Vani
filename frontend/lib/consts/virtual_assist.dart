class VirtualAssistantData {
  static final List<ChatData> chatList = [
    ChatData(
      question: "Who are You?",
      answer:
          "I am your virtual assistant! My purpose is to help you with any questions you may have about the app and guide you through the learning process.",
    ),
    ChatData(
      question: "How to use this App?",
      answer:
          "To use the app, start by exploring the learning screens. Each screen is designed to teach you different aspects. You can also find practice sessions and track your progress in the profile section.",
    ),
    ChatData(
      question: "Where can I practice?",
      answer:
          "You can practice in the 'Practice' section. Choose a category, and start learning and practicing the content. Remember, consistent practice is key to mastering new skills.",
    ),
    ChatData(
      question: "I completed the Practice, Now what?",
      answer:
          "Congratulations on completing the practice! Continue exploring advanced lessons or revisit the ones you find challenging. Don't forget to track your progress in the profile section.",
    ),
    ChatData(
      question: "More Questions Needed",
      answer:
          "Sure, feel free to ask any specific questions you have. I'm here to assist you with anything related to the app and your learning journey.",
    ),
    // Add more questions and answers as needed
  ];
}

class ChatData {
  final String question;
  final String answer;

  ChatData({
    required this.question,
    required this.answer,
  });
}
