import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kanban/bloc/kanban_bloc.dart';
import 'package:kanban/bloc/kanban_repository.dart';
import 'package:kanban/helpers/models.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> with TickerProviderStateMixin {
  TabController? tabController;
  final KanbanModels? model = KanbanModels();

  @override
  void initState() {
    bloc.add(GetKanbanEvent());
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  final bloc = KanbanBloc(KanbanRepository());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey[800],
          actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                  child: Icon(Icons.arrow_back)),
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.green,
            indicatorWeight: 3,
            tabs: [
              Text(
                "On hold",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "In progress",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Needs review",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Approved",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildOnhold(),
            buildInProgress(),
            buildNeedsReview(),
            buildApproved(),
          ],
        ),
      ),
    );
  }
}

Widget buildOnhold() => Container(
      padding: EdgeInsets.all(7),
      child: ListView(
        children: [
          for (int i = 0; i < 10; i++) buildCard(),
        ],
      ),
    );

Widget buildInProgress() => Container(
      padding: EdgeInsets.all(7),
      child: ListView(
        children: [
          for (int i = 0; i < 10; i++) buildCard(),
        ],
      ),
    );

Widget buildNeedsReview() => Container(
      padding: EdgeInsets.all(7),
      child: ListView(
        children: [
          for (int i = 0; i < 10; i++) buildCard(),
        ],
      ),
    );
Widget buildApproved() => Container(
      padding: EdgeInsets.all(7),
      child: ListView(
        children: [
          for (int i = 0; i < 10; i++) buildCard(),
        ],
      ),
    );

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
