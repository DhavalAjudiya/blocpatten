import 'package:blocpatten/pagination/apicalling_new_cubit/cubit/cricket_cubit_state.dart';
import 'package:blocpatten/pagination/apicalling_new_cubit/modal/pagination_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cricket_cubit.dart';

class Api extends StatefulWidget {
  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  final ScrollController scrollController = ScrollController();
  final searchcontroller = TextEditingController();

  late PagintionCubit pagintionCubit;

  @override
  void initState() {
    pagintionCubit = BlocProvider.of<PagintionCubit>(context);
    // PagintionCubit().fetchCricketApi();
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels ==
    //       scrollController.position.maxScrollExtent) {
    //     print("pixel ==>>${scrollController.position.pixels}");
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (value) {
              pagintionCubit.fetchCricketApi(value);
              print("value==>>>$value");
            },
            controller: searchcontroller,
            decoration: const InputDecoration(
              hintText: "Search",
              contentPadding: EdgeInsets.all(15),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              searchcontroller.clear();
            },
            child: const Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: BlocBuilder<PagintionCubit, PaginationCubitState>(
        builder: (context, state) {
          if (state is PaginationLoadingState) {
            return Center(
              child: Text(
                "${state.massage}",
                style: const TextStyle(fontSize: 30),
              ),
            );
          } else if (state is PaginationErrorState) {
            return Text("${state.massage}");
          } else if (state is PaginationLoadedtState) {
            return ListView.builder(
              controller: scrollController,
              itemCount: state.pagination.items!.length,
              itemBuilder: (context, index) {
                final newData = state.pagination.items![index];
                return Column(
                  children: [
                    Text('${newData.title}'),
                    Text('${newData.entityId}'),
                    Text('${newData.thumbnailUrl}'),
                    Text('${newData.referenceCount}'),
                    Text('${newData.isTrusted}'),
                    Text('${newData.type}'),
                    Text('${newData.description}'),
                  ],
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

// class MySearchDelegate extends SearchDelegate {
//   List<String> aresult = [
//     "Usa",
//     "Russia",
//     "India",
//     "China",
//     "Brazil",
//   ];
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           if (query.isNotEmpty) {
//             close(context, null);
//           } else {
//             query = "";
//           }
//         },
//         icon: const Icon(Icons.clear),
//       ),
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return Center(
//       child: Text(
//         query,
//         style: const TextStyle(
//           fontSize: 30,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> a = aresult.where((aresult) {
//       final result = aresult.toLowerCase();
//       final input = query.toLowerCase();
//       return result.contains(input);
//     }).toList();
//     return ListView.builder(
//       itemCount: a.length,
//       itemBuilder: (context, index) {
//         final aa = a[index];
//         return ListTile(
//           title: Text("${aa}"),
//           onTap: () {
//             query = aa;
//             showResults(context);
//           },
//         );
//       },
//     );
//   }
// }
