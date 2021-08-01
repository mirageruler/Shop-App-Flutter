import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/helpers/custom_route.dart';
import 'package:flutter_complete_guide/screens/user_products_screen.dart';
import '../screens/products_overview_screen.dart';
import '../screens/orders_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../helpers/custom_route.dart';

class AppDrawer extends StatelessWidget {
  Widget _buildListTile(IconData icon, String title, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Your information',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Divider(),
          _buildListTile(Icons.shop, 'Shop', () {
            Navigator.of(context)
                .pushReplacementNamed(ProductsOverviewScreen.routeName);
          }),
          Divider(),
          _buildListTile(Icons.payment, 'Your Orders', () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            // Navigator.of(context).pushReplacement(
            //   CustomRoute(
            //     builder: (ctx) => OrdersScreen(),
            //   ),
            // );
          }),
          Divider(),
          _buildListTile(Icons.edit, 'Manage Products', () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routeName);
          }),
          Divider(),
          _buildListTile(Icons.exit_to_app, 'Log Out', () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');
            Provider.of<Auth>(context, listen: false).logout();
          }),
          Divider(),
        ],
      ),
    );
  }
}
