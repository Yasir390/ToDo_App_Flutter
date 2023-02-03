import 'package:flutter/material.dart';

import 'style.dart';

class OurToDoPage extends StatefulWidget {
  const OurToDoPage({Key? key}) : super(key: key);

  @override
  State<OurToDoPage> createState() => _OurToDoPageState();
}

class _OurToDoPageState extends State<OurToDoPage> {

  List ToDoList=[];
  String item="";



 MyInputOnChanged(content){

   setState(() {
     item = content;
   });

 }

  AddItem(){
   setState(() {
     ToDoList.add({'item':item});
   });
  }

  RemoveItem(index){
    setState(() {

      ToDoList.removeAt(index);
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
      ),
      body: Container(
        padding: EdgeInsets.all(6),
        child: Column(
          children: [

            Expanded(
              flex: 10,

                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Expanded(flex: 70, child: TextFormField(onChanged: (content){MyInputOnChanged(content);}, decoration: AppInputDecoration("List Item"),)),
                Expanded(flex: 30,
                    child: Padding(padding: EdgeInsets.only(left: 2),child: ElevatedButton(onPressed: (){AddItem();}, child: Text("ADD"),style: AppButtonStyle(),),) ,

                ),
              ],
            )),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 90,
              child: ListView.builder(
                  itemCount: ToDoList.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: sizeBoxStyle(
                        Row(
                          children: [
                            Expanded(
                                flex: 80,
                                child: Text(ToDoList[index]['item'].toString())),
                            Expanded(
                              flex: 20,
                                child: TextButton(
                                    onPressed: (){
                                      RemoveItem(index);
                                    },
                                    child: Icon(Icons.delete_forever)))
                          ],
                        )
                      ),
                    );
                  }),

            ),

          ],
        ),
      ),
    );
  }
}
