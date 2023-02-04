import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

TextEditingController _productNameEditingController = TextEditingController();
TextEditingController _productCodeEditingController = TextEditingController();
TextEditingController _productImageEditingController = TextEditingController();
TextEditingController _productUnitPriceEditingController = TextEditingController();
TextEditingController _productQuantityEditingController = TextEditingController();
TextEditingController _productTotalPriceEditingController = TextEditingController();

void AddNewProduct (String productName, String productcode, String producimage, String unitPrice,
String productquantity, String totalprice) async
{
String url = 'https://crud.devnextech.com/api/v1/CreateProduct';
Uri uri = Uri.parse(url);
http.Response response = await http.post(uri, headers: {
  'Content-Type': 'application/json',
  'Accept':'application/json'
}, body: jsonEncode({
    "Img":producimage,
    "ProductCode":productcode,
    "ProductName":productName,
    "Qty":productquantity,
    "TotalPrice":totalprice,
    "UnitPrice": unitPrice
}));
if (response.statusCode ==200){
  print('Product Added Sucessfully!');

 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('product added successfully!')));
 
  _productNameEditingController.text = '';
  _productCodeEditingController.text = '';
  _productImageEditingController.text= '';
  _productUnitPriceEditingController.text= '';
  _productQuantityEditingController.text= '';
  _productTotalPriceEditingController.text = '';
}
else {
  print('Faild');
}
}

GlobalKey <FormState> _form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD3D3D3),
      appBar: AppBar(title: Text('Add Product'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty?? true){
                      return 'Please Enter Your Product Name';
                    }
                    return null;
                  },
                  controller: _productNameEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Product Name',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty?? true){
                      return 'Please Enter Your Product Code';
                    }
                    return null;
                  },
                  controller: _productCodeEditingController,
                  decoration: InputDecoration(
                    hintText: 'Product Code',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty?? true){
                      return 'Please Enter Image Url';
                    }
                    return null;
                  },
                  controller: _productImageEditingController,
                  decoration: InputDecoration(
                    hintText: 'Product Image Url',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true
                  ),
                ),
                 SizedBox(height: 8),
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty?? true){
                      return 'Please Enter Your Product Unit Price';
                    }
                    return null;
                  },
                   keyboardType: TextInputType.number,
                  controller: _productUnitPriceEditingController,
                  decoration: InputDecoration(
                    hintText: 'Unit Price',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty?? true){
                      return 'Please Enter Your Product Quantity';
                    }
                    return null;
                  },
                   keyboardType: TextInputType.number,
                  controller: _productQuantityEditingController,
                  decoration: InputDecoration(
                    hintText: 'Quantity',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty?? true){
                      return 'Please Enter Your Product Total Price';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  controller: _productTotalPriceEditingController,
                  decoration: InputDecoration(
                    hintText: 'Total Price',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(onPressed: (){
                    if(_form.currentState!.validate()){
                    AddNewProduct(
                      _productNameEditingController.text,
                      _productCodeEditingController.text,
                      _productImageEditingController.text,
                      _productUnitPriceEditingController.text,
                      _productQuantityEditingController.text,
                      _productTotalPriceEditingController.text); }
                  }, child: Text('Add Product'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        
      ),
    );
  }
}