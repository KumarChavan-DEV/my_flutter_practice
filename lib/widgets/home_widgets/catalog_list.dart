import 'package:flutter/material.dart';
import 'package:my_flutter_practice/pages/home_detail_page.dart';
import 'package:my_flutter_practice/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.isMobile
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items?.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items?[index];
              return InkWell(
                onTap: () => context.vxNav.push(
                    Uri(
                        path: MyRoutes.homeDetailsRoute,
                        queryParameters: {"id": catalog!.id.toString()}),
                    params:
                        catalog) /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(
                            catalog: catalog,
                          )),
                )*/
                ,
                child: CatalogItem(catalog: catalog),
              );
            })
        : GridView.builder(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: CatalogModel.items?.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items?[index];
              return InkWell(
                onTap:
                    () => /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(
                            catalog: catalog,
                          )),
                )*/
                        context.vxNav.push(
                            Uri(
                                path: MyRoutes.homeDetailsRoute,
                                queryParameters: {
                                  "id": catalog!.id.toString()
                                }),
                            params: catalog),
                child: CatalogItem(catalog: catalog),
              );
            });
  }
}

class CatalogItem extends StatelessWidget {
  final Item? catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalog!.id.toString()),
        child: CatalogImage(
          image: catalog!.image,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog!.name.text.lg.color(context.accentColor).bold.make(),
            catalog!.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog!.price}".text.bold.xl.make(),
                AddToCart(catalogItem: catalog!)
              ],
            ).pOnly(right: 8.0)
          ],
        ).p(context.isMobile ? 0 : 16),
      )
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
        children: children2,
      )
          : Column(
        children: children2,
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

/*class CatalogItem extends StatelessWidget {
  final Item? catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog!.id.toString()),
          child: CatalogImage(image: catalog?.image),
        ),
        VxBuilder(
          mutations: {ChangeQuantity},
          builder: (context, _, __) => Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog!.name.text.lg.color(context.accentColor).bold.make(),
                catalog!.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog!.price}".text.bold.xl.make(),
                    AddToCart(catalogItem: catalog!)
                  ],
                ).pOnly(right: 10)
              ],
            ),
          ),
        ),
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}*/
