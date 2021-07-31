import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/helpers/models.dart';
import 'package:kanban/screens/loginScreen/loginScreen.dart';
import 'package:kanban/screens/secondScreen/bloc/list_bloc.dart';
import 'package:kanban/screens/secondScreen/contents/body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key? key})
      : super(
          key: key,
        );

  @override
  _ListScreenState createState() => _ListScreenState();
}

getToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString("token");
  // print("token: $token");
}

class _ListScreenState extends State<ListScreen> with TickerProviderStateMixin {
  TabController? tabController;
  int _selectedIndex = 0;
  // final KanbanModels? model = KanbanModels();

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(() {
      setState(() {
        _selectedIndex = tabController!.index;
      });
    });
    bloc.add(GetListEvent(tabIndex: _selectedIndex));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  // void deletePrefs() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.clear();
  // }

  final ListBloc bloc = new ListBloc();

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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => new LoginScreen()));
              },
              child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                  child: Icon(Icons.arrow_back)),
            ),
          ],
          bottom: TabBar(
            onTap: (index) {
              tabController!.addListener(() {
                setState(() {
                  _selectedIndex = tabController!.index;
                });
              });
              bloc.add(GetListEvent(tabIndex: _selectedIndex));
            },
            controller: tabController,
            indicatorColor: Colors.green,
            indicatorWeight: 3,
            tabs: [
              Text(
                "On hold",
                style: TextStyle(fontSize: 14),
              ),
              Text(
                "In progress",
                style: TextStyle(fontSize: 14),
              ),
              Text(
                "Needs review",
                style: TextStyle(fontSize: 14),
              ),
              Text(
                "Approved",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        body: BlocBuilder<ListBloc, ListState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is ListLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ListLoaded) {
              return TabBarView(
                controller: tabController,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(7),
                    child: ListView(
                      children: [
                        for (int i = 0; i < state.model.length; i++)
                          buildBodyCont(state.model[i], i, context)
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(7),
                    child: ListView(
                      children: [
                        for (int i = 0; i < state.model.length; i++)
                          buildBodyCont(state.model[i], i, context)
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(7),
                    child: ListView(
                      children: [
                        for (int i = 0; i < state.model.length; i++)
                          buildBodyCont(state.model[i], i, context)
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(7),
                    child: ListView(
                      children: [
                        for (int i = 0; i < state.model.length; i++)
                          buildBodyCont(state.model[i], i, context)
                      ],
                    ),
                  ),
                ],
              );
            } else if (state is ListError) {
              Center(
                child: Text(state.message.message.toString()),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Ошибка сети", style: TextStyle(color: Colors.white)),
                SizedBox(
                  height: 15,
                ),
                IconButton(
                    onPressed: () {
                      bloc.add(GetListEvent(tabIndex: _selectedIndex));
                    },
                    icon: Icon(Icons.restart_alt))
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget buildBodyCont(KanbanModels model, int index, BuildContext context) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[600], borderRadius: BorderRadius.circular(7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.id.toString(),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(model.text.toString(), style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
