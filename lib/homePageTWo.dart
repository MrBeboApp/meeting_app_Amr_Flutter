import 'package:flutter/material.dart';
import 'package:metting_app/api/fetchData.dart';
import 'package:metting_app/api/productModel.dart';
import 'package:metting_app/postData.dart';
import 'package:metting_app/postModel.dart';
import 'package:metting_app/secondPage.dart';
import 'package:metting_app/widgets/myDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class HomePageTwo extends StatefulWidget {
  @override
  _HomePageTwoState createState() => _HomePageTwoState();


}

class _HomePageTwoState extends State<HomePageTwo> {
  FetchData fetchData = FetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.drag_handle_sharp,size: 30,),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage("https://images.unsplash.com/photo-1549312628-3db733bbc607?ixlib=rb-1.2.1&auto=format&fit=crop&w=4180&q=80")),
                        borderRadius: BorderRadius.all(Radius.circular(25)),

                      ),) ],
                ),

              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Topics",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),

              Container(
                height: 100,
                child: ListView.builder(itemBuilder: (context,index){
                  return _sectionCard(posts[index]);
                },
                  itemCount: posts.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
               Container(
                height: 600,
                child: FutureBuilder(
                  future: fetchData.fetchProducts(),
                  // ignore: missing_return
                  builder: (context,snapShot){

                    switch(snapShot.connectionState) {

                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator(backgroundColor: Colors.green,));
                        break;

                      case ConnectionState.none:
                        return Center(child: Text("Error in connection"),);
                        break;

                      case ConnectionState.active:
                        return Center(child: CircularProgressIndicator(backgroundColor: Colors.red,));
                        break;

                      case ConnectionState.done:
                        List <ProductModel> products = snapShot.data;

                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: products.length,
                            itemBuilder: (context,index){

                              return _productCard(products[index]);
                            });


                        break;
                    }


                  },

                ),
              ),


            ],
          ),
        ),
      ),
      appBar: AppBar(),
      drawer: MyDrawer(),
    );
  }

  Widget _sectionCard(PostModel post) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: Colors.teal,
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage(post)));
          },
          child: Card(child: Container(
            color: Colors.blueGrey.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(post.icon),
                  Text(post.title ),
                  Text(post.count)
                ],
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }

  Widget _productCard(ProductModel product) {

    return Card(
      child:InkWell(
        onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          print("Token Fro Shared is : " + prefs.getString("token"));

        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network("http://192.168.1.5:1337"+product.image,width: 100,height: 100,fit: BoxFit.cover,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title,style: TextStyle(fontSize: 20),),
                  Row(
                    children: [
                      Icon(Icons.add_shopping_cart_outlined,size: 15,),
                      Text("Price " + product.price.toString() + "Category: " + product.catTitle),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
