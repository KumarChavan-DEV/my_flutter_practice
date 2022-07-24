import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter_practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';

import '../models/catalog.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class CartPage extends StatelessWidget {
  final int days = 30;

  final String name = "Codepur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Cart",
            style: Theme.of(context).appBarTheme.titleTextStyle,
          )),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null &&
                  CatalogModel.items?.isNotEmpty == true)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
