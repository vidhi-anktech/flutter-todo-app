import 'package:flutter/material.dart';
import 'package:flutter_todo_app/constants/colors.dart';
import 'package:flutter_todo_app/model/todo.dart';
import 'package:flutter_todo_app/widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home>{
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: AppBar(
            backgroundColor: tdBGColor,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: tdBlack,
                ),
                Container(
                  height: 40,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset('assets/images/avatar.png'),
                  ),
                )
              ],
            )),
        body: Stack(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: const TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            prefixIcon: Icon(
                              Icons.search,
                              color: tdBlack,
                              size: 20,
                            ),
                            prefixIconConstraints: BoxConstraints(
                              maxHeight: 20,
                              maxWidth: 25,
                            ),
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: tdGrey,
                            ),
                          ),
                        )),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50, bottom: 20),
                            child: const Text(
                              "All ToDos",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          for (ToDo todoo in todosList)
                            ToDoItem(
                              todo: todoo,
                              onToDoChanged: _handleToDoChange,
                              onDeleteItem: _deleteToDoItem,
                            ),
                        ],
                      ),
                    ),
                  ],
                )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                          left: 20,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          ),],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _todoController ,
                          decoration: InputDecoration(
                            hintText: 'Add a new todo item',
                            border: InputBorder.none
                          )
                        )
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom:20,
                          right:20,
                        ),
                        child: ElevatedButton(
                        child: Text("+",
                        style: TextStyle(fontSize: 40,
                        color: Colors.white),
                        ),
                        onPressed: () {
                          _addToDoItem(_todoController.text);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: tdBlue,
                          minimumSize: Size(60, 60),
              
                        ),
                        ),
                      )
                  ])
                )
          ],
        ));
  }

  void _handleToDoChange(ToDo todo){
    setState((){
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id){
    setState((){
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo){
    setState((){
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }
}
