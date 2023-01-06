import 'dart:ffi';

import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';

import '../../db_functions/category/category_db.dart';
import '../category/category_add_popup.dart';

class ScreenAddTransaction extends StatefulWidget {
  const ScreenAddTransaction({super.key});

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  DateTime? _selectDate;
  CategoryType? _selectCategorytype;
  CategoryModels? _selectedcategorymodels;

  String? _categoryID;

  final _notesTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();

  @override
  void initState() {
    _selectCategorytype = CategoryType.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      primaryBegin: Alignment.topLeft,
      primaryEnd: Alignment.bottomLeft,
      secondaryBegin: Alignment.bottomLeft,
      secondaryEnd: Alignment.topRight,
      primaryColors: const [
        Color.fromARGB(255, 52, 141, 214),
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 52, 141, 214),
      ],
      secondaryColors: const [
        Color.fromARGB(255, 255, 255, 255),
        Color.fromARGB(255, 52, 141, 214),
        Color.fromARGB(255, 255, 255, 255),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Transaction',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(fontSize: 25, color: Colors.black),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color.fromARGB(255, 201, 122, 198),
                  Color.fromARGB(255, 221, 145, 254),
                ],
              ),
            ),
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80.0,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromARGB(
                                255,
                                172,
                                160,
                                172,
                              ),
                              Color.fromARGB(
                                255,
                                162,
                                96,
                                160,
                              ),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                            26,
                          ),
                        ),
                        padding: const EdgeInsets.all(
                          12.0,
                        ),
                        child: const Icon(
                          Icons.attach_money,
                          size: 24.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _amountTextEditingController,
                          decoration: const InputDecoration(
                            hintText: '0',
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontSize: 24.0,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromARGB(
                                255,
                                172,
                                160,
                                172,
                              ),
                              Color.fromARGB(
                                255,
                                162,
                                96,
                                160,
                              ),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                            26,
                          ),
                        ),
                        padding: const EdgeInsets.all(
                          12.0,
                        ),
                        child: const Icon(
                          Icons.description,
                          size: 24.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _notesTextEditingController,
                          decoration: const InputDecoration(
                            hintText: 'Note On  ',
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromARGB(
                                255,
                                172,
                                160,
                                172,
                              ),
                              Color.fromARGB(
                                255,
                                162,
                                96,
                                160,
                              ),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                            26,
                          ),
                        ),
                        padding: const EdgeInsets.all(
                          12.0,
                        ),
                        child: const Icon(
                          Icons.moving_sharp,
                          size: 24.0,
                          color: Colors.black,
                        ),
                      ),

                      // category type

                      const SizedBox(
                        height: 30.0,
                      ),

                      Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Colors.green.shade400),
                            focusColor: MaterialStateColor.resolveWith(
                                (states) => Colors.green.shade400),
                            value: CategoryType.income,
                            groupValue: _selectCategorytype,
                            onChanged: (newValue) {
                              setState(() {
                                _selectCategorytype = CategoryType.income;
                                _categoryID = null;
                              });
                            },
                          ),
                          const Text(
                            'Income',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Colors.red.shade900),
                            focusColor: MaterialStateColor.resolveWith(
                                (states) => Colors.red.shade900),
                            value: CategoryType.expense,
                            groupValue: _selectCategorytype,
                            onChanged: (newValue) {
                              setState(() {
                                _selectCategorytype = CategoryType.expense;
                                _categoryID = null;
                              });
                            },
                          ),
                          const Text(
                            'Expense',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 50.0,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromARGB(
                                  255,
                                  172,
                                  160,
                                  172,
                                ),
                                Color.fromARGB(
                                  255,
                                  162,
                                  96,
                                  160,
                                ),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(
                              26,
                            ),
                          ),
                          padding: const EdgeInsets.all(
                            12.0,
                          ),
                          child: const Icon(
                            Icons.date_range,
                            size: 24.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () async {
                            final _selectedDatetemp = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 30)),
                              lastDate: DateTime.now(),
                            );
                            if (_selectedDatetemp == null) {
                              return;
                            } else {
                              setState(() {
                                _selectDate = _selectedDatetemp;
                              });
                            }
                          },
                          child: Text(
                            _selectDate == null
                                ? 'Select Date'
                                : _selectDate!.toString(),
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showCategoryAddPopup(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromARGB(
                                  255,
                                  172,
                                  160,
                                  172,
                                ),
                                Color.fromARGB(
                                  255,
                                  162,
                                  96,
                                  160,
                                ),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(
                              26,
                            ),
                          ),
                          padding: const EdgeInsets.all(
                            12.0,
                          ),
                          child: const Icon(
                            Icons.add_circle_outline_sharp,
                            size: 24.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),

                      // dropdwon list

                      DropdownButton(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                        iconSize: 30,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0, style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                        ),
                        hint: const Text(
                          'Select Category',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        value: _categoryID,
                        items: (_selectCategorytype == CategoryType.expense
                                ? CategoryDb().expenseCategoryListListener
                                : CategoryDb().incomeCategoryListListener)
                            .value
                            .map((e) {
                          return DropdownMenuItem(
                            onTap: () {
                              _selectedcategorymodels = e;
                            },
                            value: e.id,
                            child: Text(e.name),
                          );
                        }).toList(),
                        onChanged: (selectedValue) {
                          setState(() {
                            _categoryID = selectedValue;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    height: 50.0,

                    //ElevatedButton

                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 214, 202, 214),
                    Color.fromARGB(255, 236, 133, 232),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          addTransaction();
                        },
                        child: const Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.black,
                          shape: const StadiumBorder(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addTransaction() async {
    final _notesText = _notesTextEditingController.text;
    final _amountText = _amountTextEditingController.text;
    if (_notesText.isEmpty) {
      return;
    }
    if (_amountText.isEmpty) {
      return;
    }
    if (_categoryID == null) {
      return;
    }
    if (_selectDate == null) {
      return;
    }
    if (_selectedcategorymodels == null) {
      return;
    }

    final _parsedAmount = double.tryParse(_amountText);
    if (_parsedAmount == null) {
      return;
    }

    final _models = TransactionModel(
      notes: _notesText,
      amount: _parsedAmount,
      date: _selectDate!,
      type: _selectCategorytype!,
      category: _selectedcategorymodels!,
    );
    await TransactionDb.instance.addTransaction(_models);
    Navigator.of(context).pop();
    TransactionDb.instance.refresh();
  }
}
