import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:adv_basics/quiz.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key, required this.chosenAnswers});
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData(){
    List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'questions_number': i + 1,
        'questions': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['correct_answer'] == data['user_answer'];
    }).length;
 
    return Center(
      child: Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('You answered $numCorrectQuestions out of $numTotalQuestions questions.', style: const TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 201, 153, 251),
                  ), textAlign: TextAlign.center,),
          ),
          const SizedBox(height: 30,),
          QuestionSummary(summaryData: getSummaryData()),
          const SizedBox(height: 30,),
          TextButton.icon(
            onPressed: (){
            },
            icon: const Icon(Icons.restart_alt),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 15
              ),
            ),
            label: const Text('Restart Quiz!'))
        ],)
    ),);
  }

}