import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/my_task_entity.dart';
import '../bloc/hive_bloc.dart';

class NewTextScreen extends StatefulWidget {
  const NewTextScreen({super.key});

  @override
  State<NewTextScreen> createState() => _NewTextScreenState();
}

class _NewTextScreenState extends State<NewTextScreen> {
    final TextEditingController _controller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return  SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Row(
            children: [
              IconButton(
                  onPressed: () {
                   Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
            ],
          ),
        ),
        body: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: width / 1.2,
                child: TextField(
                  controller: _controller,
                
                  decoration: const InputDecoration(
                      label: Text(
                        "add",
                      ),
                      border: InputBorder.none),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.grey,
            onPressed: () async {
              MyText myText = MyText(
                  name: _controller.text,
                  );
               BlocProvider.of<HiveBloc>(context).add(CreateEvent(text: myText));
               Navigator.of(context).pop();
            },
            label: const Text("save changes")),
      ));
  }
}