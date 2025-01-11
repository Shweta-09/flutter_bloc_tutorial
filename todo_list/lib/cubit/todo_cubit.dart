import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/models/todo_model.dart';
 

 //here the type of the state that we  want to update is list of strings
class TodoCubit extends Cubit<List<Todo>> {

  //initially the state is empty list
  TodoCubit() : super([]);


  //method for updating the list with new items
  void addItem(String text){
    if(text==""){
      addError("enter todo please");
      return;
    }
   Todo(name:text,createdAt:DateTime.now());
   //state just referes to the variable in this case its list
   state.add(Todo(name:text,createdAt:DateTime.now()));

   //"..." means spread operator is used to add one list items into another items with some items as well
   emit([...state]);
   //remeber :-emit does not shows the updated state if the current state and updated state is same it first check what is the current state 
  }
  @override
  void onChange(Change<List<Todo>> Change){
    super.onChange(Change);
    print("your todocubit is changed ${Change}");
  }

 @override
 void onError(Object error,StackTrace stacktrace){
  super.onError(error,stacktrace);
  print("printing the error over here ${error}");
  }
 
 
   


}
