import 'package:cart_manage_provider/view_models/product_view_model.dart';
import 'package:cart_manage_provider/views/cart_page.dart';
import 'package:cart_manage_provider/views/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductViewModel(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/products',
      routes: {
        '/products':(context)=> ProductPage(),
        '/cart':(context)=>CartPage()
      },
    );
    
  }
}