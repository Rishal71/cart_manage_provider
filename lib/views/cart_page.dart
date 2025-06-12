import 'package:cart_manage_provider/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _buildUI());
  }

  PreferredSizeWidget _appBar() {
    return AppBar(title: Text('Cart'));
  }

  Widget _buildUI() {
    return Consumer<ProductViewModel>(
      builder: (context, provider, _) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.80,
              child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  final product = provider.items[index];
                  return ListTile(
                    leading: Container(
                      height: 25,
                      width: 25,
                      color: product.color,
                    ),
                    title: Text(product.name),
                    trailing: Text(product.price.toString(),style: TextStyle(fontSize: 16),),
                    onLongPress: (){
                      provider.remove(product);
                    },
                  );
                },
              ),
            ),
            Text('Cart Total: \$${provider.getCartTotal()}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
          ],
        );
      },
    );
  }
}
