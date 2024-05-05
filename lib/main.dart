import 'package:flutter/material.dart';
import 'package:prak5/utils/custom_text_style.dart';
import 'package:prak5/utils/custom_utils.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          ListView(
            children: <Widget>[createHeader(), createSubTitle(), createCartList()],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                // Implementasi logika untuk checkout di sini
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Warna latar belakang
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart,
                    color: Colors.black,
                    ), // Icon shopping cart
                    const SizedBox(width: 8), // Jarak antara icon dan teks
                    Text(
                      "Checkout",
                      style: TextStyle(color: Colors.black), // Ubah warna teks menjadi hitam
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  createHeader() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 12, top: 12),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back), // Icon back
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(width: 8), // Jarak antara icon back dan teks
          Text(
            "SHOPPING CART",
            style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }

  createSubTitle() {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 12, top: 4),
      child: Text(
        "Total(1) Item",
        style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 12, color: Colors.grey),
      ),
    );
  }

  createCartList() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return createCartListItem();
      },
      itemCount: 1,
    );
  }

  createCartListItem() {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  color: Colors.blue.shade200,
                  // Use AssetImage for image assets
                  image: const DecorationImage(image: AssetImage("assets/divineowl.png")),
                ),
              ),
              Expanded(
                flex: 100,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          "Divine Owl",
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold.copyWith(fontSize: 14),
                        ),
                      ),
                      Utils.getSizedBox(height: 6),
                      Text(
                        "East",
                        style: CustomTextStyle.textFormFieldRegular.copyWith(color: Colors.grey, fontSize: 14),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "\Rp.50.000",
                              style: CustomTextStyle.textFormFieldBlack.copyWith(color: Colors.green),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.remove,
                                    size: 24,
                                    color: Colors.grey.shade700,
                                  ),
                                  Container(
                                    color: Colors.grey.shade200,
                                    padding: const EdgeInsets.only(bottom: 2, right: 12, left: 12),
                                    child: Text(
                                      "1",
                                      style: CustomTextStyle.textFormFieldSemiBold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 24,
                                    color: Colors.grey.shade700,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10, top: 8),
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4)), color: Colors.green),
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 20,
            ),
          ),
        )
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CartPage(),
  ));
}
