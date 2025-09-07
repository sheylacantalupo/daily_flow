import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171717),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline, 
            textBaseline: TextBaseline.alphabetic, 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: Offset(0, 2), 
                child: Icon(Icons.add_task, color: Colors.white, size: 30),
              ),
              const SizedBox(width: 7),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Dosis',
                    fontSize: 30, 
                    fontWeight: FontWeight.w700, 
                    color: Colors.white,
                  ),
                  children: [
                    const TextSpan(text: "meta."),
                    TextSpan(
                      text: "diária",
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF45EDAD),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // colocar o if para só aparecer quando o a lista de hábitos do state estiver vazia
          Text(
            'você não tem hábitos cadastrados',
            style: TextStyle(
              fontFamily: 'Dosis',
              fontSize: 25, 
              fontWeight: FontWeight.w400, 
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          FilledButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(0xFF45EDAD)),
              foregroundColor: WidgetStatePropertyAll(Color(0xFF171717)),
              minimumSize: WidgetStateProperty.all(
                Size(
                  MediaQuery.of(context).size.width * 0.7, 
                  50, 
                ),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
            ), 
            child: const Text('novo hábito', style: TextStyle(fontSize: 23),),
          ),
        ],
      )
    );
  }
}