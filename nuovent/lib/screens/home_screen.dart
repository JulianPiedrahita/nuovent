import 'package:flutter/material.dart';
import 'package:nuovent/models/models.dart';
import 'package:nuovent/screens/screens.dart';
import 'package:nuovent/services/services.dart';
import 'package:nuovent/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);
    
    if( productsService.isLoading ) return LoadingScreen();


    return Scaffold(
      appBar: AppBar(
        title: Text('Anuncios'),
        actions:[
          IconButton(
          icon: Icon( Icons.login_outlined ),
          onPressed: () {

            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');

          },
        ),
        ]
      ),
      drawer: DrawerMenu(),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: ( BuildContext context, int index ) => GestureDetector(
          onTap: () {

            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(
            product: productsService.products[index],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add ),
        onPressed: () {

          productsService.selectedProduct = new Product(
            available: false, 
            nomAnounce: '', 
            picture: '',
            description: '',
            numCapacity: '',
            city: ''
          );
          Navigator.pushNamed(context, 'product');
        },
      ),
   );
  }
}
