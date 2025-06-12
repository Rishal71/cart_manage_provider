import 'package:cart_manage_provider/data/product_data.dart';
import 'package:cart_manage_provider/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }
  PreferredSizeWidget _appBar(BuildContext context){
  return AppBar(
    title: Text(
      'Products', 
    ),
    actions: [
      IconButton(onPressed: (){
        Navigator.pushNamed(context, '/cart');
      }, icon: Icon(
        Icons.shopping_cart,
      ))
    ],
  );
}

Widget _buildUI(BuildContext context){
  ProductViewModel cartProvider = Provider.of<ProductViewModel>(context);
  return ListView.builder(
    itemCount: productItems.length,
    itemBuilder: (context,index){
      final product = productItems[index];
      return ListTile(
        leading: Container(
          height: 25,
          width: 25,
          color: product.color,
        ),
        title: Text(product.name),
        trailing: Checkbox(
          value: cartProvider.items.contains(product), 
            onChanged: (value){
              if(value == true){
                cartProvider.add(product);
              }else{
                cartProvider.remove(product);
              }
            }),
      );
    });
}
}
