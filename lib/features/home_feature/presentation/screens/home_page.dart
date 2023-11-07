import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/features/home_feature/data/my_task_entity.dart';
import 'package:task1/features/home_feature/presentation/bloc/hive_bloc.dart';
import 'package:task1/features/home_feature/presentation/bloc/status/read_all_status.dart';
import 'package:task1/features/home_feature/presentation/screens/edit_text_screen.dart';
import 'package:task1/features/home_feature/presentation/screens/new_text_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
   BlocProvider.of<HiveBloc>(context).add(ReadAllEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 15,
              width: width / 1.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {BlocProvider.of<HiveBloc>(context).add(DeleteAllEvent());},
                    child: const SizedBox(
                      child: Row(children: [Text("delete all"), Icon(Icons.delete)],),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height,
              child: BlocBuilder<HiveBloc, HiveState>(
                builder: (context, state) {
                  if (state.readAllStatus is ReadAllComplete) {
                    ReadAllComplete readAllComplete =
                        state.readAllStatus as ReadAllComplete;
                    List<MyText>? textsList = readAllComplete.textsList!;
                    return ListView.builder(
                      itemCount: textsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width / 15, vertical: height / 200),
                          child: Container(
                            width: width / 1.1,
                            height: height / 15,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300,width: 1),
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: InkWell(
                              onTap: () {
                                BlocProvider.of<HiveBloc>(context).add(ReadEvent(index: index));
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const EditTextScreen(),));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                    
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text(textsList[index].name,style: const TextStyle(decorationStyle: TextDecorationStyle.dashed),))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container(
                    color: Colors.red,
                  );
                },
              ),
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.grey,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NewTextScreen(),
            ));
          },
          label: const Text("Add")),
    ));
  }
}