import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/features/home_feature/data/my_task_entity.dart';
import 'package:task1/features/home_feature/presentation/bloc/hive_bloc.dart';
import 'package:task1/features/home_feature/presentation/bloc/status/read_status.dart';


class EditTextScreen extends StatefulWidget {
  const EditTextScreen({super.key});

  @override
  State<EditTextScreen> createState() => _EditTextScreenState();
}

class _EditTextScreenState extends State<EditTextScreen> {
  
final TextEditingController _controller = TextEditingController();
  
 
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<HiveBloc,HiveState>(
      builder: (context, state) {
        if(state.readStatus is ReadComplete){

          ReadComplete readComplete = state.readStatus as ReadComplete ;
          MyText? text = readComplete.text ;
          _controller.text = text!.name ;
          int index = readComplete.index ;

        return  SafeArea(
        child: Scaffold(
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
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width / 1.2,
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      label: Text(
                        "edit",
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
              MyText myText = MyText(name: _controller.text,);
              BlocProvider.of<HiveBloc>(context).add(UpdateEvent(index: index,text: myText));    
              Navigator.of(context).pop();
            },
            label: const Text("save changes")),
      ));

        }
        return Container();
      },

    );
  }
}
