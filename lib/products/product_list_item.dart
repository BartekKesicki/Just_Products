import 'package:flutter/material.dart';
import 'package:just_products/app_config/app_styles.dart';
import 'package:just_products/products/model/product_ui.dart';

class ProductListItem extends StatelessWidget {
  final ProductUi productUi;

  const ProductListItem({super.key, required this.productUi});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitleWidget(),
        _buildProductInformationRow(),
        _buildDivider(context),
      ],
    );
  }

  Widget _buildTitleWidget() {
    return Center(
      child: Text(
        productUi.title,
        style: AppStyles.createTitleTextStyle(),
      ),
    );
  }

  Widget _buildProductInformationRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 120.0,
            height: 120.0,
            child: Image.network(productUi.thumbnail),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${productUi.price} \$",
                  style: AppStyles.createPriceTextStyle(),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Category: ${productUi.category}",
                  style: AppStyles.createCategoryTextStyle(),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  productUi.description,
                  style: AppStyles.createDescriptionTextStyle(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1.0,
      color: Colors.black,
    );
  }
}
