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

class EditeTransaction extends StatefulWidget {
  const EditeTransaction({Key? key, required this.value}) : super(key: key);
  final TransactionModel value;

  @override
  State<EditeTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<EditeTransaction> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectDate;
  String? dateString;
  CategoryType? _selectCategorytype;
  CategoryModels? _selectedcategorymodels;

  String? _categoryID;
  // String val=widget.value.notes.toString();

  var _notesTextEditingController = TextEditingController();
  var _amountTextEditingController = TextEditingController();
  String selectDAteemptyMassege = '';
  String selectcategoryemptyMassege = '';
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

  @override
  void initState() {
    _categoryID = widget.value.category.id;
    _selectCategorytype = widget.value.category.type;
    _notesTextEditingController =
        TextEditingController(text: widget.value.notes);
    _amountTextEditingController =
        TextEditingController(text: widget.value.amount.toString());
    _selectDate = widget.value.date;
    dateString =
        "${_selectDate!.day} ${monthList[_selectDate!.month - 1]} ${_selectDate!.year} ";
    // _selectCategorytype=widget.value.category;
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

                  ValidationOfSelectCatogory(
                    selectcategoryemptyMassege: selectcategoryemptyMassege,
                  ),

                  constHeight30,

                  //::::::::::::::SelectAmount:::::::::::::::::::::::::::
                  selectAmount(),
                  constHeight30,

                  //:::::::::::::;selectDateSection::::::::::::::::::::::::
                  selectDateSection(context),
                  constHeight20,
                  //::::::::::::::ValidationOfDate::::::::::::::;;::::::::

                  ValidationOfDate(
                    selectDAteemptyMassege: selectDAteemptyMassege,
                  ),

                  //:::::::::::::::::::noteSection::::::::::::::::::::
                  noteSection(),
                  constHeight30,
                  constHeight30,

                  //::::::::::::::::::::elevetedButtonSection:::::::::
                  elevetedButtonSection(size)
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
  SizedBox elevetedButtonSection(Size size) {
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
              editTransactions();
            }
            // Navigator.of(context).pop();
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
    );
  }

//:::::::::::::::::::::::;selectDateSection::::::::::::::::::::::::::::::::::::::
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
              //already store the date
              dateString!,
              style: const TextStyle(
                fontSize: 20.0,
              ),
              // _selectDate == null
              //     ? 'SelectDate'
              //     : _selectDate!.toString(),
              // style: const TextStyle(
              //   fontSize: 20.0,
              // ),
            ),
          )
        ],
      ),
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
          child: TextFormField(
            maxLength: 10,
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
                  // _value = selected ? 1 : null;
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
                  // _value = selected ? 2 : null;
                  _selectCategorytype = CategoryType.expense;
                  _categoryID = null;
                });
              },
            ),
          ],
        ),
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

  //:::::::::::::::editTransaction:::::::::::::::::::::::::::::::::::::::

  Future<void> editTransactions() async {
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
      id: widget.value.id,
      notes: notesText,
      amount: parsedAmount,
      date: _selectDate!,
      type: _selectCategorytype!,
      category: _selectedcategorymodels!,
    );
    await TransactionDb.instance.dbEditTransaction(models);
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

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

//:::::::::::::::::::::::ValidationOf Date::::::::::::::::::::::::::::::::::::::::::::::::
class ValidationOfDate extends StatelessWidget {
  const ValidationOfDate({
    Key? key,
    required this.selectDAteemptyMassege,
  }) : super(key: key);

  final String selectDAteemptyMassege;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 100),
      child: Text(
        selectDAteemptyMassege,
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }
}

//:::::::::::::::::::::::::::::::::::::::::ValidationOfSelectCatogory:::::::::::::::::::::::::::::::

class ValidationOfSelectCatogory extends StatelessWidget {
  const ValidationOfSelectCatogory({
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
          fontSize: 12,
        ),
      ),
    );
  }
}
