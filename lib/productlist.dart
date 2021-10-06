import 'package:flutter/material.dart';
import 'package:villa/widget/buildlisttile.dart';
import 'package:villa/widget/productdetailspage.dart';
import 'package:villa/widget/slidable_wodget.dart';

import 'model/productclass.dart';
import 'model/products.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Productclass> items = List.of(Products.details);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            var onDismissed2 = null;
            return SlidableWidget(
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsPage(item: item)));
                  },
                  child: buildListTile(item)),
              // ignore: unnecessary_null_in_if_null_operators
              onDismissed: onDismissed2,
            );
          },
        ),
      ),
    );
  }
}
