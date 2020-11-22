import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_menu/model/itemModel.dart';
import 'package:hidden_menu/view_model/view_model.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  static final Duration duration = Duration(milliseconds: 300);

  bool toggle = true;

  double axisY;
  ItemModel selectedItem;

  @override
  void initState() {
    insertAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        items(),
        itemDetails()
      ],
    );
  }

  Widget items(){
    return AnimatedList(
      key: ViewModel.listKey,
      initialItemCount: 0,
      itemBuilder: (context, index, animation){
        return item(index,animation,);
      },
    );
  }

  Widget item(index, animation) {
    ItemModel item = ViewModel.items[index];
    return SlideTransition(
      position: animation.drive(ViewModel().tween),
      child: GestureDetector(
        onTap: () => viewDetails(item),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .3,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    item.image
                  ),
                  fit: BoxFit.cover
                )
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32
                        ),
                      ),
                      Text(
                        item.location,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16
                        ),
                      ),
                      Text(
                        item.time,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget itemDetails(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        transform: Matrix4.identity()..translate(0.0, axisY ?? MediaQuery.of(context).size.height - 170),
        duration: duration*1.5,
        width: double.infinity,
        height: MediaQuery.of(context).size.height - (AppBar().preferredSize.height + AppBar().preferredSize.height),
        decoration: BoxDecoration(
            color: Colors.lightGreenAccent,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              topLeft: Radius.circular(50),
            )
        ),
        child: Card(
          color: Colors.tealAccent.withOpacity(.5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              )
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: selectedItem == null ?
                                NetworkImage('https://images.squarespace-cdn.com/content/v1/560ad474e4b0ce89ae1f42db/1583920602384-069KEAZZ30R0T84CWQ73/ke17ZwdGBToddI8pDm48kI99Su05B8embLeqd-nGa0cUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcHAaYB9heftrPVOgeY8nnyY4CsLkUdneJGkI6-EaSbIIUk58xg6u6N_KF02uBIr4B/A+Transparent+Company+Logo+white.png') :
                                NetworkImage(selectedItem.image)
                          )
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .7,
                            child: Text(
                              selectedItem == null ? 'None' : selectedItem.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                color: Colors.grey[300]
                              ),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.grey
                          ),
                          Text(
                            '${selectedItem == null ? 'NaN' : selectedItem.rating} / 5',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 6,),
                      Text(
                        'Best time to Visit :',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '- '+ '${selectedItem == null ? 'NaN' : selectedItem.time}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70
                        ),
                      ),
                      SizedBox(height: 12,),
                      Text(
                        'Description :',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '- ' + '${selectedItem == null ? 'NaN' : selectedItem.description}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: double.infinity,),
                toggle ? Positioned(
                  left: 0,
                  right: 0,
                  child: AnimatedOpacity(
                    opacity: toggle ? 1 : 0,
                    duration: duration,
                    child: Text(
                      'Tap a item to see Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  ),
                ) :
                AnimatedOpacity(
                  duration: duration,
                  opacity: toggle ? 0 : 1,
                  child: InkWell(
                    onTap: (){
                      insertAll();
                      toggleMenu();
                      selectedItem = null;
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1111)),
                        child: Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.amber[200],
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }






  insertAll() async{
    for (int i = 0; i < ViewModel.items.length; i++) {
      await Future.delayed(
        duration,
            () {
          ViewModel.listKey.currentState
              .insertItem(i, duration: duration);
        },
      );
    }
  }

  deleteAll() {
    for (int i = ViewModel.items.length - 1; i >= 0; i--) {
      ViewModel.listKey.currentState.removeItem(i, (context, animation) {
        return item(i,animation);
      }, duration: duration);
    }
  }

  toggleMenu() {
    toggle = !toggle;
    setState(() {
      if(toggle){
        axisY = MediaQuery.of(context).size.height - 180;
      }else{
        axisY = 0.0;
      }
    });
  }

  viewDetails(ItemModel item){
    selectedItem = item;
    deleteAll();
    toggleMenu();
  }
}