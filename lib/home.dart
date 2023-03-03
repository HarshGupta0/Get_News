import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
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
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.only(right: 30,left: 30,top:20,bottom: 15),
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
        // onsubmitted isliye use krte hein taki textinputaction se input string value ko use kr sake serach k liye
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
                // Text('$search'),
                Container(
                  height: 60,
                  //The ListView.builder constructor takes an IndexedWidgetBuilder,
                  // which builds the children on demand. This constructor is appropriate for
                  // list views with a large (or infinite) number of children because the builder
                  // is called only for those children that are actually visible.
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: navBarIteam.length,
                    itemBuilder:(context,index){
                      return InkWell(
                        //basically inkwell responses krta hei touch ko and then unke according hum kuch
                        //action krwa skte hein....
                        onTap: (){
                          print(navBarIteam[index]);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade400,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(navBarIteam[index],
                            style: TextStyle(color:Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CarouselSlider(
                  items: items.map((item){
                    return Builder(
                        builder:(BuildContext context){
                          return InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: item,
                              ),
                            ),
                          );
                        }
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 180,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                ),
                Container(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder:(context,index){
                    return Container(child: Image.asset('images/lana.png'),);
                    }
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  final List items=[Colors.red,Colors.pink,Colors.purple,Colors.orange];
}
