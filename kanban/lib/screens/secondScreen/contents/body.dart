import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/screens/secondScreen/bloc/list_bloc.dart';

final ListBloc bloc = new ListBloc();

class BodyTabs extends StatelessWidget {
  const BodyTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListBloc, ListState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is ListLoaded) {
            TabBarView(
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  child: ListView(
                    children: [
                      for (int i = 0; i < 10; i++) buildCard(),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  child: ListView(
                    children: [
                      for (int i = 0; i < 10; i++) buildCard(),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  child: ListView(
                    children: [
                      for (int i = 0; i < 10; i++) buildCard(),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  child: ListView(
                    children: [
                      for (int i = 0; i < 10; i++) buildCard(),
                    ],
                  ),
                ),
              ],
            );
          }

          return Text("Ошибка сети");
        },
      ),
    );
  }
}

Widget buildCard() => Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey[600], borderRadius: BorderRadius.circular(7)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "id 1230",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "data dsjhdksfljvh jhdfvkjdhsfgv uhdf hisdf  udsfh uilsdh fi dufh  usfius diu sdfiuhui",
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
