

class ToDo{
  String? id;
  String? todoText;
  bool isDone;


ToDo({
  required this.id,
  required this.todoText,
  this.isDone = false,
});

static List <ToDo> todoList () {
  return [
    ToDo(id:'01', todoText: 'Morning breakfast', isDone: true),
    ToDo(id:'02', todoText: 'Buying Groceries', isDone: true),
    ToDo(id:'03', todoText: 'Laundary', isDone: true),
    ToDo(id:'04', todoText: 'Lunch', ),
    ToDo(id:'05', todoText: 'Office Work',),
    ToDo(id:'06', todoText: 'Dinner',),
    ToDo(id:'07', todoText: 'Tuitions',),
  ];
} 
}