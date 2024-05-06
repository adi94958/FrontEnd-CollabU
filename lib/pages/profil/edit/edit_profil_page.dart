import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

enum Gender { male, female }

class EditProfil extends StatefulWidget {
  const EditProfil({super.key});

  @override
  State<EditProfil> createState() => EditProfilState();
}

class EditProfilState extends State<EditProfil> {
  final _formKey = GlobalKey<FormState>();

  Gender _selectedGender = Gender.male;
  final dateController = TextEditingController(text: '6 September 2004');

  // ignore: unused_field
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        initializeDateFormatting('id');
        dateController.text = DateFormat.yMMMMd('id').format(picked);
      });
    }
  }

  final fullNameController =
      TextEditingController(text: 'Muhammad Adi Saputera');
  final shortNameController = TextEditingController(text: 'Adi');
  final tanggalLahir = TextEditingController(text: '6 September 2004');
  final email = TextEditingController(text: 'adi94958@gmail.com ');
  final noHp = TextEditingController(text: '619 3456 7890');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(249, 249, 249, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const EditTop(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 580,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nama Lengkap',
                            style: TextStyle(
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: TextFormField(
                              controller: fullNameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors
                                    .white, // Set your desired background color
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20.0),
                                hintText: 'Enter your text',
                              ),
                              style: const TextStyle(
                                  fontSize: 12, fontFamily: 'DMSans'),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Nama Panggilan',
                            style: TextStyle(
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: TextFormField(
                              controller: shortNameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors
                                    .white, // Set your desired background color
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20.0),
                                hintText: 'Enter your text',
                              ),
                              style: const TextStyle(
                                  fontSize: 12, fontFamily: 'DMSans'),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Tanggal Lahir',
                            style: TextStyle(
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: TextFormField(
                              controller: dateController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors
                                      .white, // Set your desired background color
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 20.0),
                                  hintText: 'Enter your text',
                                  suffixIcon: const Icon(
                                    Icons.calendar_month_outlined,
                                    size: 19,
                                  )),
                              style: const TextStyle(
                                  fontSize: 12, fontFamily: 'DMSans'),
                              onTap: () {
                                _selectDate(context);
                              },
                              readOnly: true,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Gender',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedGender = Gender.male;
                                  });
                                },
                                child: Container(
                                  width: 160,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, // Center text and radio button
                                    children: [
                                      Radio(
                                        value: Gender.male,
                                        groupValue: _selectedGender,
                                        onChanged: (Gender? value) {
                                          setState(() {
                                            _selectedGender = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .orange, // Change radio button color to orange
                                      ),
                                      const Text(
                                        'Laki - Laki',
                                        style: TextStyle(
                                            fontSize: 14, fontFamily: 'DMSans'),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedGender = Gender.female;
                                  });
                                },
                                child: Container(
                                  width: 160,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, // Center text and radio button
                                    children: [
                                      Radio(
                                        value: Gender.female,
                                        groupValue: _selectedGender,
                                        onChanged: (Gender? value) {
                                          setState(() {
                                            _selectedGender = value!;
                                          });
                                        },
                                        activeColor: Colors
                                            .orange, // Change radio button color to orange
                                      ),
                                      const Text(
                                        'Perempuan',
                                        style: TextStyle(
                                            fontSize: 14, fontFamily: 'DMSans'),
                                      ),
                                      const SizedBox(
                                        width: 25,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Email',
                            style: TextStyle(
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors
                                    .white, // Set your desired background color
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 20.0),
                                hintText: 'Enter your text',
                              ),
                              style: const TextStyle(
                                  fontSize: 12, fontFamily: 'DMSans'),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'No. Hp',
                            style: TextStyle(
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors
                                  .white, // Set your desired background color
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20.0),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    '+62',
                                    style: TextStyle(
                                        fontFamily: 'DMSans',
                                        color: Colors.black,
                                        fontSize:
                                            12 // Set the text color to black
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  const VerticalDivider(
                                    color: Colors.black,
                                    indent: 5,
                                    endIndent: 5,
                                    thickness: 0.5,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: noHp,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors
                                              .white, // Set your desired background color
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                          hintText: 'Enter your text',
                                        ),
                                        style: const TextStyle(
                                            fontSize: 12, fontFamily: 'DMSans'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushNamed(context, '/profil');
                                  // Form is validated, submit your data
                                  // You can access form values like:
                                  // fullNameController.text
                                  // shortNameController.text
                                  // dateController.text
                                  // email.text
                                  // noHp.text
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromARGB(200, 19, 1, 96)),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(213, 50),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'SIMPAN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EditTop extends StatelessWidget {
  const EditTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 250,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18))),
      ),
      Positioned(
          top: 2,
          left: 0,
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profil');
            },
            icon: const Icon(
              Icons.west,
              color: Colors.white,
            ),
            iconSize: 27,
          )),
      const Positioned(
          top: 60,
          left: 20,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/profile.png'),
          )),
      const Positioned(
        top: 130,
        left: 20,
        child: Text(
          'Muhammad Adi Saputera',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      const Positioned(
        top: 150,
        left: 20,
        child: Text(
          'D3 - Teknik Informatika',
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ),
      Positioned(
        top: 180,
        left: 15,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            shadowColor:
                MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.5)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child:
              const Text('Change Image', style: TextStyle(color: Colors.white)),
        ),
      )
    ]);
  }
}
