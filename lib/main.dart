import 'package:flutter/material.dart';
import 'package:flutter_crud_app_rest_api/CreateProduct_PostApi.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: ProductDetails(),
    debugShowCheckedModeBanner: false,
  ));
}

//get api

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  ProductListPojo? productListPojo;

  @override
  void initState() {
    super.initState();
    getProductListFromApi();
  }

void getProductListFromApi ()async{
String url = "https://crud.devnextech.com/api/v1/ReadProduct";
Uri uri = Uri.parse(url);
http.Response response = await http.get(uri);
if (response.statusCode == 200){
productListPojo = ProductListPojo.fromJson(jsonDecode(response.body));
setState(() {});
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));
      },
      child: Icon(Icons.add),
      ),
      backgroundColor: Color(0xffD3D3D3),
      appBar: AppBar(title: Text('Api Call'),),
      body:Container(
      child: Container(
        child: SafeArea(child: GridView.builder(
          itemCount: productListPojo?.data?.length?? 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisSpacing: 1,
            crossAxisCount: 2),
             itemBuilder:(context, index) => GestureDetector(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage( productListPojo?.data?[index].img?? ''), fit: BoxFit.contain)
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(productListPojo?.data?[index].productName?? '', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5),
                          Text(productListPojo?.data?[index].unitPrice?? '', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              IconButton(onPressed: (){}, icon: Icon(Icons.edit), color: Colors.green.withOpacity(0.5),),
                              IconButton(onPressed: (){}, icon: Icon(Icons.delete), color: Colors.red.withOpacity(0.5),),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
             ))),
      ),
    ));
  }
}


class ProductListPojo {
  String? status;
  List<Data>? data;

  ProductListPojo({this.status, this.data});

  ProductListPojo.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

}

class Data {
  String? sId;
  String? productName;
  String? productCode;
  String? img;
  String? unitPrice;
  String? qty;
  String? totalPrice;
  String? createdDate;

  Data(
      {this.sId,
      this.productName,
      this.productCode,
      this.img,
      this.unitPrice,
      this.qty,
      this.totalPrice,
      this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    img = json['Img'];
    unitPrice = json['UnitPrice'];
    qty = json['Qty'];
    totalPrice = json['TotalPrice'];
    createdDate = json['CreatedDate'];
  }

}

