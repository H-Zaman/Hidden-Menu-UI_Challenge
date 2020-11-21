import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_menu/model/itemModel.dart';
import 'package:hidden_menu/view_model/view_model.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  
  bool toggle = true;

  insertAll() async{
    for (int i = 0; i < ViewModel.items.length; i++) {
      await Future.delayed(
        Duration(milliseconds: 200),
            () {
              ViewModel.listKey.currentState
              .insertItem(i, duration: Duration(milliseconds: 500));
        },
      );
    }
  }

  deleteAll() {
    for (int i = ViewModel.items.length - 1; i >= 0; i--) {
      ViewModel.listKey.currentState.removeItem(i, (context, animation) {
        return SlideTransition(
          position: animation.drive(ViewModel().tween),
          child: MenuListWidget(
            index: i,
          ),
        );
      }, duration: Duration(milliseconds: 500));
    }
  }

  toggleMenu() {
    setState(() {
      toggle = !toggle;
      if(toggle){
        axisY = MediaQuery.of(context).size.height - 180;
      }else{
        axisY = 0.0;
      }
    });
  }

  @override
  void initState() {
    insertAll();
    super.initState();
  }

  double axisY = 0.0;
  double dragStart = 0.0;
  Direction direction;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        AnimatedList(
          key: ViewModel.listKey,
          initialItemCount: 0,
          itemBuilder: (context, index, animation){
            return SlideTransition(
              position: animation.drive(ViewModel().tween),
              child: MenuListWidget(index: index),
            );
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onVerticalDragStart: (start){
              setState(() {
                dragStart = start.globalPosition.dy;
              });
            },
            onVerticalDragUpdate: (update){
              setState(() {
                if (dragStart > update.globalPosition.dy) {
                  direction = Direction.UP;
                } else {
                  direction = Direction.DOWN;
                }
              });
            },
            child: AnimatedContainer(
              transform: Matrix4.identity()..translate(0.0, axisY),
              duration: Duration(milliseconds: 600),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.tealAccent.withOpacity(.5),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                )
              ),
              child: Card(
                color: Colors.tealAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  )
                ),
                elevation: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: double.infinity,),
                    SizedBox(height: 20,),
                    Container(
                      height: 5,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1111),
                        color: Colors.amberAccent,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}


class MenuListWidget extends StatelessWidget {
  final int index;
  MenuListWidget({this.index});
  @override
  Widget build(BuildContext context) {
    ItemModel item = ViewModel.items[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,),
      child: Card(
        margin: EdgeInsets.only(bottom: 10),
        child: ListTile(
          title: Text(item.title),
          subtitle: Text(item.rating.toString()),
        ),
      ),
    );
  }
}

enum Direction{UP,DOWN}