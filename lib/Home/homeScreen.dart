import 'package:flutter/material.dart';
import 'package:todo_app/Home/addTask.dart';
import 'package:todo_app/Home/screens/settings/settingScreen.dart';
import 'package:todo_app/Home/screens/taskList/taskScreen.dart';

class homeScreen extends StatefulWidget {
static String routeName = "Home";

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
int selectedIndex=0;

 List <Widget> tabs = [taskScreen(),settingScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: selectedIndex == 0 ? Text("To Do List") :Text("Settings"),
        toolbarHeight: MediaQuery.of(context).size.height *.15,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addTask();
        }, child: Icon(Icons.add,),
        shape: const StadiumBorder(
          side: BorderSide(
            width: 3,
            color: Colors.white,
          )
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin:9,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          onTap: (index)
          {
            selectedIndex = index;
            setState(() {});
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list,size: 25,),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, size:25 ,),
                label: ''),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  void addTask() {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context, builder: (context){
      return Padding(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: addTaskSheet(),
      );
    });
  }


}
