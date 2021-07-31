// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kanban/helpers/models.dart';
// import 'package:kanban/screens/secondScreen/bloc/list_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final ListBloc bloc = new ListBloc();

// // ignore: must_be_immutable
// class BodyTabs extends StatefulWidget {
//   TabController? tabController;
//   int? selectedIndex;
//   BodyTabs({Key? key, this.tabController, this.selectedIndex})
//       : super(key: key);

//   @override
//   _BodyTabsState createState() => _BodyTabsState();
// }

// getToken() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   var token = preferences.getString("token");
// }

// class _BodyTabsState extends State<BodyTabs> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ListBloc, ListState>(
//       bloc: bloc,
//       builder: (context, state) {
//         if (state is ListLoading) {
//           return Center(child: CircularProgressIndicator());
//         } else if (state is ListLoaded) {
//           return TabBarView(
//             controller: widget.tabController,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.all(7),
//                 child: ListView(
//                   children: [
//                     for (int i = 0; i < state.model.length; i++)
//                       buildBodyCont(state.model[i], i, context)
//                   ],
//                 ),
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.all(7),
//                 child: ListView(
//                   children: [
//                     for (int i = 0; i < state.model.length; i++)
//                       buildBodyCont(state.model[i], i, context)
//                   ],
//                 ),
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.all(7),
//                 child: ListView(
//                   children: [
//                     for (int i = 0; i < state.model.length; i++)
//                       buildBodyCont(state.model[i], i, context)
//                   ],
//                 ),
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 padding: EdgeInsets.all(7),
//                 child: ListView(
//                   children: [
//                     for (int i = 0; i < state.model.length; i++)
//                       buildBodyCont(state.model[i], i, context)
//                   ],
//                 ),
//               ),
//             ],
//           );
//         } else if (state is ListError) {
//           Center(
//             child: Text(state.message.message.toString()),
//           );
//         }
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text("Ошибка сети", style: TextStyle(color: Colors.white)),
//             SizedBox(
//               height: 15,
//             ),
//             IconButton(
//               onPressed: () {
//                 bloc.add(GetListEvent(tabIndex: widget.selectedIndex));
//               },
//               icon: Icon(Icons.reset_tv_sharp),
//               color: Colors.white,
//             )
//           ],
//         );
//       },
//     );
//   }
// }

// Widget buildBodyCont(KanbanModels model, int index, BuildContext context) {
//   return Column(
//     children: [
//       Container(
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             color: Colors.grey[600], borderRadius: BorderRadius.circular(7)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "ID: " + model.id.toString(),
//               style: TextStyle(color: Colors.white),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(model.text.toString(), style: TextStyle(color: Colors.white)),
//           ],
//         ),
//       ),
//       SizedBox(
//         height: 10,
//       )
//     ],
//   );
// }
