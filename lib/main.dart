import 'package:flutter/material.dart';
import 'question.dart';
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

List <Icon> Scorekeeper =[

];
// List<String> Question=[
//   ' Rachit vai  is sexy',
//   'HAPPY BDAY RACHIT VAI',
//   'JAB TAK SURAJ CHAND RAHEGA RAMCHIT BHAI KA NAAM RAHEGA',
//   'JAI SHREE RAM',
//
// ];
// List<bool> answers=[
//   false,
//   true,
//   true,
//   true,
// ];
List<question> questionBank=[
  question(q:'You can lead a cow down stairs but not up stairs.',a: false,),
  question(q:'Approximately one quarter of human bones are in the feet.',a: true,),
  question(q:'A slug\'s blood is green.',a: true,),
];
int questionnumber=0;
class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionnumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer=questionBank[questionnumber].questionAnswer;
                if(correctAnswer==true){
                  print("your answer is correct");

                }
                else{
                  print("your answer is wrong");
                }
                  setState(() {
                    questionnumber++;

                  });
                  Scorekeeper.add(Icon(
                    Icons.check,color:Colors.green,
                  ),);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer=questionBank[questionnumber].questionAnswer;
                if(correctAnswer==true){
                  print("your answer is correct");

                }
                else{
                  print("your answer is wrong");
                }
                setState(() {
                  questionnumber++;

                });
                Scorekeeper.add(Icon(
                  Icons.dnd_forwardslash,color:Colors.red,
                ),);
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children:Scorekeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
