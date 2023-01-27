import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/constants/constants.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:simplemoneymanager/constants/notifier.dart';
import '../../db_functions/category/category_db.dart';
import '../category/category_add_popup.dart';

class ScreenAddTransaction extends StatefulWidget {
  const ScreenAddTransaction({super.key});

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  late DateTime _selectDate = DateTime.now();
  late String dateString;

  CategoryModels? _selectedcategorymodels;
  String? _categoryID;
  final _formKey = GlobalKey<FormState>();

  final _notesTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();

  List<String> monthList = [
    "Jan",
    "Feb",
    "Mrc",
    "Apr",
    "May",
    "Jun",
    "July",
    "Aug",
    "Spt",
    "Oct",
    "Nuv",
    "Dec"
  ];

  @override
  void initState() {
    // _selectCategorytype = CategoryType.income;
    dateString =
        "${_selectDate.day} ${monthList[_selectDate.month - 1]} ${_selectDate.year} ";
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Add Transaction',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(fontSize: 25, color: Colors.black),
          ),
        ),
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  constHeight10,

                  //::::::::::::::::::::::::::::selectCategorytypeSection::::::;

                  selectCategorytypeSection(),

                  constHeight30,
                  //:::::::::::::::::::selectCategorySection:::::::::;
                  selectCategorySection(context),
                  //category validation

                  constHeight30,

                  //::::::::::::amountSection:::::::::::::::::::::
                  amountSection(),
                  constHeight30,
                  //::::::::::::::::::::noteSection:::::::::::::::
                  noteSection(),
                  //::::::::::::::::selectDateSection:::::::::::::
                  constHeight30,
                  constHeight10,

                  selectDateSection(context),
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

  //:::::::::::::::::::::;close::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  //::::::::::::::::::::::::::addButtonSection::::::::::::::::::::::::::::::::::::::::::::::

  Container addButtonSection(Size size) {
    return Container(
      width: size.width / 3,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            spreadRadius: 1,
            offset: const Offset(5, 5),
          ),
          const BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            spreadRadius: 1,
            offset: Offset(-5, -5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            addTransaction();
            TransactionDb.instance.refresh();
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
            color: bgColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(5, 5),
              ),
              const BoxShadow(
                color: Colors.white,
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(-5, -5),
              ),
            ],
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
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: const Offset(5, 5),
                ),
                const BoxShadow(
                  color: Colors.white,
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: Offset(-5, -5),
                ),
              ],
            ),
            child: TextFormField(
              // maxLines: 1,
              // minLines: 1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Note';
                }
                return null;
              },
              controller: _notesTextEditingController,
              decoration: InputDecoration(
                hintText: 'Note On  ',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bgColor,
                  ),
                ),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bgColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bgColor,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bgColor,
                  ),
                ),
              ),
              style: const TextStyle(
                fontSize: 24.0,
              ),
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
              color: bgColor,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: const Offset(5, 5),
                ),
                const BoxShadow(
                  color: Colors.white,
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: Offset(-5, -5),
                ),
              ],
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

                  //::::::::::::::::::::colendercolor:::::::::::::::::::::::::::::::::::::::::;

                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: bgColor,
                          onPrimary: Colors.blueGrey,
                          onSurface: Colors.black,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor:
                                Colors.blueGrey, // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  });
              if (selectedDatetemp == null) {
                return;
              } else {
                setState(() {
                  _selectDate = selectedDatetemp;

                  dateString =
                      "${selectedDatetemp.day} ${monthList[selectedDatetemp.month - 1]} ${selectedDatetemp.year} ";
                });
              }
            },
            child: Text(
              // _selectDate == null ? 'SelectDate' : _selectDate!.toString(),
              dateString,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(5, 5),
              ),
              const BoxShadow(
                color: Colors.white,
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(-5, -5),
              ),
            ],
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
          //attach_money
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: const Offset(5, 5),
                ),
                const BoxShadow(
                  color: Colors.white,
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: Offset(-5, -5),
                ),
              ],
            ),
            child: TextFormField(
              maxLines: 1,
              minLines: 1,
              // maxLength: 10,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter amound';
                }
                return null;
              },
              controller: _amountTextEditingController,
              decoration: InputDecoration(
                hintText: '0',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(width: 0, color: bgColor),
                ),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bgColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bgColor,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bgColor,
                  ),
                ),
              ),
              style: const TextStyle(
                fontSize: 24.0,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
      ],
    );
  }

//:::::::::::::::::::::::::::selectCategorytypeSection:::::::::::::::::

  Row selectCategorytypeSection() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(5, 5),
              ),
              const BoxShadow(
                color: Colors.white,
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(-5, -5),
              ),
            ],
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
            Container(
              height: 35,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 15,
                    spreadRadius: 1,
                    offset: const Offset(5, 5),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    blurRadius: 15,
                    spreadRadius: 1,
                    offset: Offset(-5, -5),
                  ),
                ],
              ),
              child: ChoiceChip(
                padding: const EdgeInsets.all(8),
                label: const Text('Income'),
                // color of selected chip
                selectedColor: Colors.green,
                // selected chip value
                selected: selectCategorytype.value == CategoryType.income,
                // onselected method
                onSelected: (bool selected) {
                  setState(() {
                    _value = 1;
                    selectCategorytype.value = CategoryType.income;
                    _categoryID = null;
                  });
                },
              ),
            ),

            //width choisechip

            constwidth20,
            Container(
              height: 35,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 15,
                    spreadRadius: 1,
                    offset: const Offset(5, 5),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    blurRadius: 15,
                    spreadRadius: 1,
                    offset: Offset(-5, -5),
                  ),
                ],
              ),
              child: ChoiceChip(
                padding: const EdgeInsets.all(8),
                label: const Text('Expense'),
                // color of selected chip
                selectedColor: Colors.red,
                // selected chip value
                selected: selectCategorytype.value == CategoryType.expense,
                // onselected method
                onSelected: (bool selected) {
                  setState(() {
                    _value = 2;
                    selectCategorytype.value = CategoryType.expense;
                    _categoryID = null;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

//:::::::::::::::::::::::::::::::::::::::::selectCategorySection::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;

  Row selectCategorySection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(5, 5),
              ),
              const BoxShadow(
                color: Colors.white,
                blurRadius: 15,
                spreadRadius: 1,
                offset: Offset(-5, -5),
              ),
            ],
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

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: const Offset(5, 5),
                ),
                const BoxShadow(
                  color: Colors.white,
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: Offset(-5, -5),
                ),
              ],
            ),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bgColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bgColor,
                  ),
                ),
                border: const OutlineInputBorder(),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bgColor,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: bgColor,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Select Categoy';
                }
                return null;
              },
              borderRadius: BorderRadius.circular(
                30,
              ),
              iconSize: 30,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              hint: const Text(
                'Select Category',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              value: _categoryID,
              items: (selectCategorytype.value == CategoryType.expense
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
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            showCategoryAddPopup(context, false, selectCategorytype.value);
          },
          icon: const Icon(
            Icons.add_circle_outline_sharp,
            size: 30,
          ),
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
      date: _selectDate,
      type: selectCategorytype.value,
      category: _selectedcategorymodels!,
    );
    await TransactionDb.instance.addTransaction(models);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    TransactionDb.instance.refresh();

    //::::::::::::SnakBarTransaction Add Successfully !massege::::::::::::::

    final snackBar = SnackBar(
      elevation: 0,
      duration: const Duration(milliseconds: 600),
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
