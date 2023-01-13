import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import '../../colors/colors.dart';
import '../../db_functions/category/category_db.dart';
import '../category/category_add_popup.dart';

class EditeTransaction extends StatefulWidget {
    const EditeTransaction({Key ?key,required this. value}):super(key: key);
   final TransactionModel value;

  @override
  State<EditeTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<EditeTransaction> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectDate;
  CategoryType? _selectCategorytype;
  CategoryModels? _selectedcategorymodels;

  String? _categoryID;
  // String val=widget.value.notes.toString();

  var _notesTextEditingController = TextEditingController();
  var _amountTextEditingController = TextEditingController();
  String selectDAteemptyMassege = '';
  String selectcategoryemptyMassege = '';

  @override
  void initState() {
    _selectCategorytype = CategoryType.income;
    _notesTextEditingController=TextEditingController(text: widget.value.notes);
    _amountTextEditingController=TextEditingController(text: widget.value.amount.toString());
    _selectDate= widget.value.date;
    // _selectCategorytype=widget.value.category;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Update Transaction',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(fontSize: 25, color: Colors.black),
          ),
        ),
        backgroundColor: ColorConstants.kGravishBlueColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
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
                              Color.fromARGB(255, 49, 119, 172),
                              Color.fromARGB(77, 117, 167, 213),
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
                          Icons.category,
                          size: 24.0,
                          color: Colors.black,
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
                                  width: 0.50, style: BorderStyle.solid),
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
                      IconButton(
                        onPressed: () {
                          showCategoryAddPopup(context);
                        },
                        icon: const Icon(Icons.add_circle_outline_sharp),
                      )
                    ],
                  ),

                  //category validation

                  Padding(
                    padding: const EdgeInsets.only(right: 85),
                    child: Text(
                      selectcategoryemptyMassege,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromARGB(255, 49, 119, 172),
                              Color.fromARGB(77, 117, 167, 213),
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

                      // ChoiceChip(
                      //   label: Text('Income'),
                      //   selected: true,
                      //   selectedColor: Colors.green,

                      //   onSelected: (value) {
                      //     setState(() {
                      //       _selectCategorytype = CategoryType.income;
                      //       _categoryID = null;
                      //     });
                      //   },
                      // ),
                      // const SizedBox(
                      //   width: 12.0,
                      // ),
                      // ChoiceChip(
                      //   label: Text('Expense'),
                      //   selected: false,
                      //    onSelected: (newValue) {
                      //         setState(() {
                      //           _selectCategorytype = CategoryType.expense;
                      //           _categoryID = null;
                      //         });
                      //       },

                      // )

                      Row(
                        children: [
                          Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromARGB(255, 56, 145, 60)),
                            focusColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromARGB(255, 64, 100, 65)),
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
                                (states) =>
                                    const Color.fromARGB(255, 166, 17, 17)),
                            focusColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    const Color.fromARGB(255, 145, 17, 17)),
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
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromARGB(255, 49, 119, 172),
                              Color.fromARGB(77, 117, 167, 213),
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter amound';
                            }
                            return null;
                          },
                          controller: _amountTextEditingController,
                          decoration: const InputDecoration(
                            hintText: '0',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
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
                                Color.fromARGB(255, 49, 119, 172),
                                Color.fromARGB(77, 117, 167, 213),
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
                          width: 5.0,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () async {
                            final selectedDatetemp = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now()
                                  .subtract(const Duration(days: 30)),
                              lastDate: DateTime.now(),
                            );
                            if (selectedDatetemp == null) {
                              return;
                            } else {
                              setState(() {
                                _selectDate = selectedDatetemp;
                              });
                            }
                          },
                          child: Text(
                            _selectDate == null
                                ? 'SelectDate'
                                : _selectDate!.toString(),
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //erro massege for form validation

                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Text(
                      selectDAteemptyMassege,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
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
                              Color.fromARGB(255, 49, 119, 172),
                              Color.fromARGB(77, 117, 167, 213),
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Note';
                            }
                            return null;
                          },
                          controller: _notesTextEditingController,
                          decoration: const InputDecoration(
                            hintText: 'Note On  ',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            
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
                  const SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    height: 50.0,

                    //ElevatedButton

                    child: Container(
                      width: size.width / 3,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 49, 119, 172),
                            Color.fromARGB(77, 117, 167, 213),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_categoryID == null) {
                            setState(() {
                              selectcategoryemptyMassege =
                                  'please select category';
                            });
                          }
                          if (_selectDate == null) {
                            setState(() {
                              selectDAteemptyMassege = 'please select date';
                            });
                          }
                          if (_formKey.currentState!.validate()) {
                          //  var a=TransactionModel(amount:double.parse( _amountTextEditingController.value.text),category:_selectedcategorymodels! ,date:_selectDate! ,notes: _notesTextEditingController.text,type: _selectCategorytype!);
                            editTransaction();
                          }
                        },
                        // ignore: sort_child_properties_last
                        child: const Text(
                          'Upadate',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
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

  Future<void> editTransaction() async {
    final notesText = _notesTextEditingController.text;
    final amountText = _amountTextEditingController.text;
    if (notesText.isEmpty) {
      return;
    }
    if (amountText.isEmpty) {
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
    

    final parsedAmount = double.tryParse(amountText);
    if (parsedAmount == null) {
      return;
    }

    final models = TransactionModel(id: widget.value.id,
      notes: notesText,
      amount: parsedAmount,
      date: _selectDate!,
      type: _selectCategorytype!,
      category: _selectedcategorymodels!,
    );
    await TransactionDb.instance.editTransaction(models);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    TransactionDb.instance.refresh();
    // final snackBar = SnackBar(duration: const Duration(milliseconds: 500),
    //   elevation: 0,
    //   behavior: SnackBarBehavior.floating,
    //   backgroundColor: Colors.transparent,
    //   content: AwesomeSnackbarContent(
    //     title: 'On Snap!',
    //     message: 'Transaction Add Successfully !',
    //     contentType: ContentType.success,
    //   ),
    // );

    // // ignore: use_build_context_synchronously
    // ScaffoldMessenger.of(context)
    //   ..hideCurrentSnackBar()
    //   ..showSnackBar(snackBar);
  }
}
