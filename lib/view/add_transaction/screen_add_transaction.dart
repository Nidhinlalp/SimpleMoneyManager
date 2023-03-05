import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simplemoneymanager/colors/colors.dart';
import 'package:simplemoneymanager/constants/constants.dart';
import 'package:simplemoneymanager/view_model/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import '../../view_model/category/category_db.dart';
import '../category/category_add_popup.dart';

// ignore: must_be_immutable

class ScreenAddTransaction extends StatelessWidget {
  ScreenAddTransaction({super.key});

  late String dateString;

  final _formKey = GlobalKey<FormState>();

  final _notesTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();

  List<String> monthList = [
    "Jan",
    "Feb",
    "Mar",
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

  // @override
  // void initState() {
  //   // _selectCategorytype = CategoryType.income;

  //   super.initState();
  // }

  bool selectingchip = false;
  @override
  Widget build(BuildContext context) {
    context.read<CategoryDb>().refreshUI();
    dateString =
        "${context.read<CategoryDb>().selectDate.day} ${monthList[context.read<CategoryDb>().selectDate.month - 1]} ${context.read<CategoryDb>().selectDate.year} ";
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
                  addButtonSection(size, context),
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

  Container addButtonSection(Size size, BuildContext context) {
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
            addTransaction(context);
            context.read<TransactionDb>().refresh();
            context.read<TransactionDb>().incomeandexpense(
                context.read<TransactionDb>().transactionListNotifire);
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
      child: Consumer<CategoryDb>(builder: (context, value, child) {
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
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 30)),
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
                  value.selectDate = selectedDatetemp;

                  dateString =
                      "${selectedDatetemp.day} ${monthList[selectedDatetemp.month - 1]} ${selectedDatetemp.year} ";
                  context.read<CategoryDb>().notifyListeners();
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
        );
      }),
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
        Consumer<CategoryDb>(
          builder: (context, categorydb, _) {
            return Row(
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
                    selected:
                        categorydb.selectCategorytype == CategoryType.income,
                    // onselected method
                    onSelected: (bool selected) {
                      categorydb.selectCategorytype = CategoryType.income;
                      categorydb.notifyListeners();
                      categorydb.categoryID = null;
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
                    selected:
                        categorydb.selectCategorytype == CategoryType.expense,
                    // onselected method
                    onSelected: (bool selected) {
                      categorydb.selectCategorytype = CategoryType.expense;
                      categorydb.notifyListeners();
                      categorydb.categoryID = null;
                    },
                  ),
                ),
              ],
            );
          },
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

        Consumer<CategoryDb>(
          builder: (context, categoryDb, _) {
            return Expanded(
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
                  value: categoryDb.categoryID,
                  items: (categoryDb.selectCategorytype == CategoryType.expense
                          ? categoryDb.expenseCategoryListListener
                          : categoryDb.incomeCategoryListListener)
                      .map((e) {
                    return DropdownMenuItem(
                      onTap: () {
                        context.read<CategoryDb>().setselectedcategorymodels =
                            e;
                        // context.read<CategoryDb>().notifyListeners();
                      },
                      value: e.id,
                      child: Text(e.name),
                    );
                  }).toList(),
                  onChanged: (selectedValue) {
                    categoryDb.categoryID = selectedValue;
                  },
                ),
              ),
            );
          },
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
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
          width: 60,
          height: 70,
          child: IconButton(
            onPressed: () {
              showCategoryAddPopup(context, false,
                  context.read<CategoryDb>().selectCategorytype);
            },
            icon: const Icon(
              Icons.add_circle_outline_sharp,
              size: 30,
            ),
          ),
        )
      ],
    );
  }

//::::::::::::::::::::::::::::addTransactionFunction:::::::::::::::::::::
  Future<void> addTransaction(BuildContext context) async {
    final notesText = _notesTextEditingController.text;
    final amountText = _amountTextEditingController.text;
    if (notesText.isEmpty) {
      return;
    }
    if (amountText.isEmpty) {
      return;
    }
    if (context.read<CategoryDb>().categoryID == null) {
      return;
    }

    if (context.read<CategoryDb>().selectedcategorymodels == null) {
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
      date: context.read<CategoryDb>().selectDate,
      type: context.read<CategoryDb>().selectCategorytype,
      category: context.read<CategoryDb>().selectedcategorymodels!,
    );
    // await TransactionDb.addTransaction(models);
    await context.read<TransactionDb>().addTransaction(models);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    // TransactionDb.instance.refresh();
    context.read<TransactionDb>().refresh();
    context.read<CategoryDb>().refreshUI();
    context.read<TransactionDb>().incomeandexpense(
        context.read<TransactionDb>().transactionListNotifire);
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