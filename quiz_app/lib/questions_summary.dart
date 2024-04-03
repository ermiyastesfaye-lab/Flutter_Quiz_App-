import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionSummary extends StatelessWidget{
  QuestionSummary({required this.summaryData, super.key});
  List<Map<String, Object>> summaryData;
  
  @override
  Widget build(context){
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: summaryData.map((data){
            return Row(
              children: [
                // Text((data['questions_number'] as int).toString()),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['questions'] as String, style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      textAlign: TextAlign.left,),
                      const SizedBox(height: 5,),
                      Text(data['user_answer'] as String, textAlign: TextAlign.left),
                      Text(data['correct_answer'] as String, textAlign: TextAlign.left)
                    ],),
                )
              ],);
          }).toList(),
        ),
      ),
    );
  }
}