import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../firebase/gloabals.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final List<XFile>? images = [];

  final formKey = GlobalKey<FormState>();
  String _spec = "";
  String _details = "";
  @override
  Map tableData = {};
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
            key: formKey,
            child: Expanded(
              child: (ListView(
                shrinkWrap: true,
                children: [
                  displayImages(),
                  addImages(),
                  addTitle(),
                  subTitle(),
                  addPrice(),
                  productDetails(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: TextFormField(
                        initialValue: _spec,
                        onChanged: (value) => _spec = value,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      )),
                      Expanded(
                          child: TextFormField(
                        initialValue: _details,
                        onChanged: (value) => _details = value,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      )),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        tableData[_spec] = _details;
                        _spec = "";
                        _details = "";
                        setState(() {});
                      },
                      child: Text("add row")),
                  keyWords(),
                  onSubmit(),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }

  displayImages() => images!.isEmpty
      ? Icon(
          Icons.image_search_rounded,
          size: 300,
        )
      : GridView.builder(
          padding: EdgeInsets.all(10),
          // physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: images!.length,
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.file(File(images![index].path)),
                ChoiceChip(
                  label: Text("Remove"),
                  onSelected: (t) {
                    images!.removeAt(index);
                    setState(() {});
                  },
                  selected: false,
                ),
              ],
            );
          },
        );
  addImages() => ElevatedButton.icon(
      onPressed: () async {
        final XFile? img;
        try {
          int a = images?.length ?? 0;
          if (a < 3) {
            img = await imagePicker.pickImage(source: ImageSource.gallery);
            images?.add(img!);
            setState(() {});
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('limit reached')),
            );
          }
        } catch (e) {
          print(e);
        }
      },
      icon: Icon(Icons.add),
      label: Text(images!.isEmpty ? "Add one image" : "Add more images"));

  addTitle() => TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter your username',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      );
  addPrice() => TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Price',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Fill price of product';
          }
          return null;
        },
      );
  subTitle() => TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Sub-title',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'mention about product';
          }
          return null;
        },
      );
  productDetails() => ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          DataTable(
            
              columns: const [
                DataColumn(
                    label: Text('Spec',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Details',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Details'))
              ],
              rows: tableData.entries
                  .map((e) => DataRow(cells: [
                        DataCell(Text(e.key)),
                        DataCell(Text(e.value)),
                        DataCell(Container(
                          child: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              tableData.removeWhere((key, value) => key == e.key);
                              setState(() {});
                            },
                          ),
                        ))
                      ]))
                  .toList()),
          Divider()
        ],
      );
  keyWords() => TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'KeyWords',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'mention some keywrods by comma separated';
          }
          return null;
        },
      );

  onSubmit() => ElevatedButton(
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );
          }
        },
        child: const Text('Submit'),
      );
}
