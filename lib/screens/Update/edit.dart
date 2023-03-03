import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simplemoneymanager/constants/constants.dart';
import 'package:simplemoneymanager/db_functions/transaction/transaction_db.dart';
import 'package:simplemoneymanager/models/cetegory/cetegory_models.dart';
import 'package:simplemoneymanager/models/transaction/transaction_model.dart';
import 'package:simplemoneymanager/screens/hometransactions/sortincomeandexpense/incomeandexpense.dart';
import '../../colors/colors.dart';
import '../../db_functions/category/category_db.dart';
import '../category/category_add_popup.dart';

class EditeTransaction extends StatelessWidget {
  EditeTransaction({Key? key, required this.value}) : super(key: key);
  final TransactionModel value;

  final _formKey = GlobalKey<FormState>();

  // DateTime? _selectDate;
  String? dateString;
  //late CategoryType _selectCategorytype;
  //CategoryModels? _selectedcategorymodels;

  //String? _categoryID;
  // String val=widget.value.notes.toString();

  var _notesTextEditingController = TextEditingController();
  var _amountTextEditingController = TextEditingController();
  bool isExecuted = false;

  List<String> monthList = [
    "Jan",
    "Feb",
    "Mar",
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

  bool selectingchip = false;

  @override
  Widget build(BuildContext context) {
    if (isExecuted == false) {
      context.read<CategoryDb>().refreshUI();
      context.read<TransactionDb>().refresh();
      context.read<IncomeAndExpence>().incomeandexpense(
          context.read<TransactionDb>().transactionListNotifire);
      context.read<CategoryDb>().selectedcategorymodels = value.category;
      // _value = widget.value.type.index;
      context.read<CategoryDb>().categoryID = value.category.id;
      context.read<CategoryDb>().selectCategorytype = value.category.type;
      _notesTextEditingController = TextEditingController(text: value.notes);
      _amountTextEditingController =
          TextEditingController(text: value.amount.toString());
      context.read<CategoryDb>().selectDate = value.date;
      dateString =
          "${context.read<CategoryDb>().selectDate.day} ${monthList[context.read<CategoryDb>().selectDate.month - 1]} ${context.read<CategoryDb>().selectDate.year} ";
      isExecuted = true;
    }

    // _selectCategorytype=widget.value.category;
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
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
            'Update Transaction',
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
                children: [
                  constHeight10,

                  //:::::::::::::::::::::SelectCategoryType:::::::::::::::::
                  selectCategoryType(),

                  constHeight30,

                  //::::::::::::::::Categoryselection:::::::::::::::::::::

                  categoryselection(context),
                  //::::::::::::::::::category validation:::::::::::::::::

                  constHeight30,

                  //::::::::::::::SelectAmount:::::::::::::::::::::::::::
                  selectAmount(),
                  constHeight30,

                  //:::::::::::::;selectDateSection::::::::::::::::::::::::
                  noteSection(),
                  constHeight30,
                  //::::::::::::::ValidationOfDate::::::::::::::;;::::::::

                  //:::::::::::::::::::noteSection::::::::::::::::::::
                  selectDateSection(context),
                  constHeight30,
                  constHeight30,
                  //::::::::::::::::::::elevetedButtonSection:::::::::
                  elevetedButtonSection(size, context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //:::::::::::::::::::::::::::::::::::::::::::::::::::;close the page::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::;

//:::::::::elevetedButtonSection:::::::::::::::::::::::::::::::::::::::
  SizedBox elevetedButtonSection(Size size, BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Container(
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
              editTransactions(context);
            }
            // Navigator.of(context).pop();
          },
          // ignore: sort_child_properties_last
          child: const Text(
            'Update',
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
    );
  }

  //::::::::;noteSection:::::::::::::::::::::::::::::::::::::::;

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

//:::::::::::::::::::::::;selectDateSection::::::::::::::::::::::::::::::::::::::
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
                }
              },
              child: Text(
                //already store the date
                dateString!,
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

//::::::::::::::::SelectAmount::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  Row selectAmount() {
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
            Icons.attach_money,
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

  //::::::::::::SelectCategoryType::::::::::::::::::::::::::::::::::::::::::::::::::

  Row selectCategoryType() {
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
        Consumer<CategoryDb>(builder: (context, value, child) {
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
                  selected: value.selectCategorytype == CategoryType.income,
                  // onselected method
                  onSelected: (bool selected) {
                    // _value = selected ? 1 : null;
                    value.selectCategorytype = CategoryType.income;
                    value.notifyListeners();
                    value.categoryID = null;
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
                  selected: value.selectCategorytype == CategoryType.expense,
                  // onselected method
                  onSelected: (bool selected) {
                    // _value = selected ? 2 : null;
                    value.selectCategorytype = CategoryType.expense;
                    value.notifyListeners();
                    value.categoryID = null;
                  },
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  //::::::::::::::::Categoryselection::::::::::::::::::::::::::::::::::::::::::::::::::::

  Row categoryselection(BuildContext context) {
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
            Icons.category,
            size: 24.0,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 12.0,
        ),

        // dropdwon list

        Consumer<CategoryDb>(builder: (context, value, child) {
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
                value: value.categoryID,
                items: (value.selectCategorytype == CategoryType.expense
                        ? value.expenseCategoryListListener
                        : value.incomeCategoryListListener)
                    .map((e) {
                  return DropdownMenuItem(
                    onTap: () {
                      context.read<CategoryDb>().setselectedcategorymodels = e;
                    },
                    value: e.id,
                    child: Text(e.name),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  value.categoryID = selectedValue;
                },
              ),
            ),
          );
        }),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            showCategoryAddPopup(
                context, false, context.read<CategoryDb>().selectCategorytype);
          },
          icon: const Icon(
            Icons.add_circle_outline_sharp,
            size: 30,
          ),
        )
      ],
    );
  }

  //:::::::::::::::editTransaction:::::::::::::::::::::::::::::::::::::::

  Future<void> editTransactions(BuildContext context) async {
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
    if (context.read<CategoryDb>().selectDate == null) {
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
      id: value.id,
      notes: notesText,
      amount: parsedAmount,
      date: context.read<CategoryDb>().selectDate,
      type: context.read<CategoryDb>().selectCategorytype,
      category: context.read<CategoryDb>().selectedcategorymodels!,
    );
    await context.read<TransactionDb>().dbEditTransaction(models);
    context.read<IncomeAndExpence>().incomeandexpense(
        context.read<TransactionDb>().transactionListNotifire);
    //Navigator.of(context).pop();
    final snackBar = SnackBar(
      duration: const Duration(milliseconds: 500),
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'On Snap!',
        message: 'Transaction Edit Successfully !',
        contentType: ContentType.success,
      ),
    );

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
//:::::::::::::::::::::::ValidationOf Date::::::::::::::::::::::::::::::::::::::::::::::::


//:::::::::::::::::::::::::::::::::::::::::ValidationOfSelectCatogory:::::::::::::::::::::::::::::::

