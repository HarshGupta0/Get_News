import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController =new TextEditingController();
  List<String> navBarIteam=["Top  news", "India","World ","Finnace","Health"];
  String search='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News pdh le bhai'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.blue
                      .shade200,

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          search=searchController.text;
                        });
                      },
                      child:Icon(Icons.search,size: 30,color: Colors.black26,),
                    ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          onSubmitted: (value){
                           setState(() {
                             search=value;
                           });
                          },
        // onsubmittes isliye use krte hein taki textinputaction se input string value ko use kr sake serach k liye
                          textInputAction: TextInputAction.search,//adding go or search many icon to phones keyboard
                          keyboardType: TextInputType.multiline,
                          minLines: 1, // Normal textInputField will be displayed
                          maxLines: 5, // When user presses enter it will adapt to it
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            contentPadding: EdgeInsets.all(2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text('$search'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
