import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplemoneymanager/constants/constants.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import '../../colors/colors.dart';
import '../../db_functions/category/category_db.dart';
import '../category/category_add_popup.dart';

class ScreenAddTransaction extends StatefulWidget {
  const ScreenAddTransaction({super.key});

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  DateTime? _selectDate;
  String? dateString;
  CategoryType? _selectCategorytype;
  CategoryModels? _selectedcategorymodels;
  String? _categoryID;

  final _formKey = GlobalKey<FormState>();

  final _notesTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();
  String selectDAteemptyMassege = '';
  String selectcategoryemptyMassege = '';

  @override
  void initState() {
    _selectCategorytype = CategoryType.income;
    // dateString = null;
    // _selectDate = null;
    // _categoryID = null;
    // _selectedcategorymodels = null;
    super.initState();
  }

  bool selectingchip = false;
  int? _value = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Add Transaction',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(fontSize: 25, color: Colors.black),
          ),
        ),
        backgroundColor: ColorConstants.kPrimaryColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  constHeight10,

                  //:::::::::::::selectCategorySection:::::::::::::::

                  selectCategorySection(context),

                  //category validation
                  SelectCategoryValidation(
                    selectcategoryemptyMassege: selectcategoryemptyMassege,
                  ),
                  //
                  constHeight30,
                  constHeight10,
                  //:::::::::::::::selectCategoryTypeSection::::::
                  selectCategoryTypeSection(),
                  constHeight30,
                  constHeight20,
                  //::::::::::::amountSection:::::::::::::::::::::
                  amountSection(),
                  constHeight30,
                  constHeight20,
                  //::::::::::::::::selectDateSection:::::::::::::
                  selectDateSection(context),
                  constHeight30,
                  //:::::::erro massege for form validation:::::::
                  SeletionDateValidation(
                    selectDAteemptyMassege: selectDAteemptyMassege,
                  ),

                  //::::::::::::::::::::noteSection:::::::::::::::
                  noteSection(),
                  constHeight30,
                  constHeight20,
                  constHeight30,
                  constHeight30,

                  //:::::::::::::::::::::addButtonSection::::::::
                  addButtonSection(size),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //:::::::::::::::::::::;close::::::::::::::::::::::::

  //::::::::::::::::::::::::::addButtonSection::::::::::::::::::::::::::::::::::::::::::::::

  Container addButtonSection(Size size) {
    return Container(
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
              selectcategoryemptyMassege = 'please select category';
            });
          }
          if (_selectDate == null) {
            setState(() {
              selectDAteemptyMassege = 'please select date';
            });
          }
          if (_formKey.currentState!.validate()) {
            addTransaction();
          }
          // FocusManager.instance.primaryFocus?.unfocus();
        },
        // ignore: sort_child_properties_last
        child: const Text(
          'Add',
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
    );
  }

//::::::::::::::::::::::::::::::::::::::::::::::noteSection::::::::::::::::::::::::::::::
  Row noteSection() {
    return Row(
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
                  color: Colors.blueAccent,
                ),
              ),
            ),
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox selectDateSection(BuildContext context) {
    return SizedBox(
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
                firstDate: DateTime.now().subtract(const Duration(days: 30)),
                lastDate: DateTime.now(),
              );
              if (selectedDatetemp == null) {
                return;
              } else {
                setState(() {
                  _selectDate = selectedDatetemp;
                  List<String> monthList = [
                    "Jan",
                    "Feb",
                    "Mrc",
                    "Apr",
                    "Mey",
                    "Jun",
                    "July",
                    "Aug",
                    "Spt",
                    "Oct",
                    "Nuv",
                    "Dec"
                  ];
                  dateString =
                      "${selectedDatetemp.day} ${monthList[selectedDatetemp.month - 1]} ${selectedDatetemp.year} ";
                });
              }
            },
            child: Text(
              // _selectDate == null ? 'SelectDate' : _selectDate!.toString(),
              dateString == null ? 'SelectDate' : dateString!,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }

//::::::::::::::::::::::::::::::::::::::::::::::::::::::amountSection:::::::::::::::::::::::::
  Row amountSection() {
    return Row(
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
                  color: Colors.blueAccent,
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
    );
  }

//:::::::::::::::::::::::::::selectCategoryTypeSection:::::::::::::::::

  Row selectCategoryTypeSection() {
    return Row(
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

        //
        constwidth20,
        Row(
          children: [
            ChoiceChip(
              padding: const EdgeInsets.all(8),
              label: const Text('Income'),
              // color of selected chip
              selectedColor: Colors.green,
              // selected chip value
              selected: _value == 1,
              // onselected method
              onSelected: (bool selected) {
                setState(() {
                  _value = 1;
                  _selectCategorytype = CategoryType.income;
                  _categoryID = null;
                });
              },
            ),

            //width choisechip

            constwidth20,
            ChoiceChip(
              padding: const EdgeInsets.all(8),
              label: const Text('Expense'),
              // color of selected chip
              selectedColor: Colors.red,
              // selected chip value
              selected: _value == 2,
              // onselected method
              onSelected: (bool selected) {
                setState(() {
                  _value = 2;
                  _selectCategorytype = CategoryType.expense;
                  _categoryID = null;
                });
              },
            ),
          ],
        ),

        // Row(
        //   children: [
        //     Radio(
        //       fillColor: MaterialStateColor.resolveWith(
        //           (states) =>
        //               const Color.fromARGB(255, 56, 145, 60)),
        //       focusColor: MaterialStateColor.resolveWith(
        //           (states) =>
        //               const Color.fromARGB(255, 64, 100, 65)),
        //       value: CategoryType.income,
        //       groupValue: _selectCategorytype,
        //       onChanged: (newValue) {
        //         setState(() {
        //           _selectCategorytype = CategoryType.income;
        //           _categoryID = null;
        //         });
        //       },
        //     ),
        //     const Text(
        //       'Income',
        //       style: TextStyle(
        //         fontSize: 20.0,
        //       ),
        //     )
        //   ],
        // ),
        // Row(
        //   children: [
        //     Radio(
        //       fillColor: MaterialStateColor.resolveWith(
        //           (states) =>
        //               const Color.fromARGB(255, 166, 17, 17)),
        //       focusColor: MaterialStateColor.resolveWith(
        //           (states) =>
        //               const Color.fromARGB(255, 145, 17, 17)),
        //       value: CategoryType.expense,
        //       groupValue: _selectCategorytype,
        //       onChanged: (newValue) {
        //         setState(() {
        //           _selectCategorytype = CategoryType.expense;
        //           _categoryID = null;
        //         });
        //       },
        //     ),
        //     const Text(
        //       'Expense',
        //       style: TextStyle(
        //         fontSize: 20.0,
        //       ),
        //     )
        //   ],
        // ),
      ],
    );
  }

//:::::::::::::::::::::::::::::::::::::::::selectCategorySection::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;

  Row selectCategorySection(BuildContext context) {
    return Row(
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
                side: BorderSide(width: 0.50, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
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
    );
  }

//::::::::::::::::::::::::::::addTransactionFunction:::::::::::::::::::::
  Future<void> addTransaction() async {
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

    final models = TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      notes: notesText,
      amount: parsedAmount,
      date: _selectDate!,
      type: _selectCategorytype!,
      category: _selectedcategorymodels!,
    );
    await TransactionDb.instance.addTransaction(models);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    TransactionDb.instance.refresh();

    //::::::::::::SnakBarTransaction Add Successfully !massege::::::::::::::

    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message: 'Transaction Add Successfully !',
        contentType: ContentType.success,
      ),
    );

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

class SeletionDateValidation extends StatelessWidget {
  const SeletionDateValidation({
    Key? key,
    required this.selectDAteemptyMassege,
  }) : super(key: key);

  final String selectDAteemptyMassege;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 125),
      child: Text(
        selectDAteemptyMassege,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 12.5,
        ),
      ),
    );
  }
}

class SelectCategoryValidation extends StatelessWidget {
  const SelectCategoryValidation({
    Key? key,
    required this.selectcategoryemptyMassege,
  }) : super(key: key);

  final String selectcategoryemptyMassege;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 105),
      child: Text(
        selectcategoryemptyMassege,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 12.5,
        ),
      ),
    );
  }
}
