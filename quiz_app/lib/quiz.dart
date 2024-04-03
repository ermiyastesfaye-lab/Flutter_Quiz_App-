import 'package:adv_basics/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen); 
  }

  void switchScreen(){
    setState((){
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer); 
    });
  } 

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultScreen(chosenAnswers: selectedAnswers,);
      });
    }
  }
  @override
  Widget build(context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 78, 13, 151),
                    Color.fromARGB(255, 78, 13, 168)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: activeScreen)));
  }
}
