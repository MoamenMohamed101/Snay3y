import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:snay3y/screens/user_screens/Description/cubit/cubit.dart';
import 'package:snay3y/screens/user_screens/Description/cubit/states.dart';

class description extends StatelessWidget {
  const description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> DescriptionCubit(),
      child: BlocConsumer<DescriptionCubit,DescriptionStates>(
        listener: (context,index){},
        builder:(context,index){
          return Scaffold(
            backgroundColor: Colors.white,
            appBar:AppBar(
              backgroundColor: Colors.white,
              titleSpacing: MediaQuery.of(context).size.width/7,
              elevation: 0,
              leading:IconButton(onPressed: (){},
                  icon:const Icon(Icons.arrow_back,color: Colors.black,)) ,
              title: const Text("Mohamed Khaled",style: TextStyle(color: Colors.black),),
            ) ,
            body: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height-500,
                    width:MediaQuery.of(context).size.width-50 ,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/snay3y.png'))

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Description',style:
                    TextStyle(fontSize: MediaQuery.of(context).size.width/15,fontWeight: FontWeight.bold,color: Color(0xff322653)),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all( MediaQuery.of(context).size.width/30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.',style:
                    TextStyle(fontSize: MediaQuery.of(context).size.width/20,color: Color(0xff322653)),),
                  ),
                ),
                SizedBox(height: 4,),
                Padding(
                  padding: EdgeInsets.only(left: 9),
                  child: Align(
                    alignment:Alignment.topLeft ,
                    child: RatingBar.builder(

                        minRating: 1,
                        itemSize: 16,
                        itemBuilder: (context,_)=>Icon(Icons.star,color: Colors.amber.shade100,),
                        onRatingUpdate: (rating){
                          DescriptionCubit.get(context).updateRating(rating);
                        }

                        ),
                  ),
                ),
                SizedBox(height: 9,),

                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Posts',style:
                    TextStyle(fontSize: MediaQuery.of(context).size.width/15,fontWeight: FontWeight.bold,color: Color(0xff322653)),),
                  ),
                ),
               Expanded(
                 child: ListView.separated(
                     itemBuilder: (context,index){
                       return Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Expanded(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Container(
                                     height: MediaQuery.of(context).size.height/5,
                                 width:MediaQuery.of(context).size.width/2 ,
                                 decoration: const BoxDecoration(
                                 image: DecorationImage(image: AssetImage('assets/images/image.png')),)
                                 ),
                                 Row(

                                   children: [
                                     IconButton(onPressed: (){
                                       DescriptionCubit.get(context).ToggleHeart();
                                     }, icon:Icon(DescriptionCubit.get(context).Heart,color: Color.fromRGBO(70, 130,169, 1),size: 28,),),
                                     Text('Likes',style: TextStyle(color: Color(0xff322653),fontSize: 17),)
                                   ],
                                 ),
                               ],
                             ),
                           ),
                           SizedBox(width: MediaQuery.of(context).size.width/40,),
                           Expanded(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Container(
                                     height: MediaQuery.of(context).size.height/5,
                                 width:MediaQuery.of(context).size.width/2 ,
                                 decoration: const BoxDecoration(
                                 image: DecorationImage(image: AssetImage('assets/images/image.png')),)
                                 ),
                                 Row(

                                   children: [
                                     IconButton(onPressed: (){
                                       DescriptionCubit.get(context).ToggleHeart();
                                     }, icon:Icon(DescriptionCubit.get(context).Heart,color: Color.fromRGBO(70, 130,169, 1),size: 28,),),
                                     Text('Likes',style: TextStyle(color: Color(0xff322653),fontSize: 17),)
                                   ],
                                 ),
                               ],
                             ),
                           ),

                         ],
                       );
                     },
                     separatorBuilder: (context,index){
                      return SizedBox(height: 3,);
                     },
                     itemCount: 2),
               )

              ],
            ),
            floatingActionButton:Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff4682A9),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(3),
                  bottomLeft: Radius.circular(3))
                ),
                
                child: Center(child: Text("Booking Now",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),))),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          );
        } ,

      ),
    );
  }
}
