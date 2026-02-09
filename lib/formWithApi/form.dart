import 'package:StoreLink/formWithApi/services/countrys.dart';
import 'package:StoreLink/formWithApi/services/countrysservices.dart';
import 'package:StoreLink/formWithApi/services/formdetails.dart';
import 'package:StoreLink/formWithApi/services/countryservices.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Forms extends StatelessWidget {
  const Forms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 142, 177, 194),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "Navigation with data",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: formdetails(),
    );
  }
}

class formdetails extends StatefulWidget {
  formdetails({super.key});

  @override
  State<formdetails> createState() => _formdetailsState();
}

class _formdetailsState extends State<formdetails> {
  final formkey = GlobalKey<FormState>();
  String? gender;
  String? selectedrole;
  bool termsandpolicy = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SizedBox(
          width: 400,
          height: double.infinity,
          child: Form(
            autovalidateMode: AutovalidateMode.onUnfocus,
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                Text(
                  "Login Form",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email*",
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email Required";
                    } else if (RegExp(
                      r'^[\w-\.]+~[A-Z](?!.*\s)(?!.*[A-Z])+@([\w-]+\.[\w-])$',
                    ).hasMatch(value)) {
                      return "Enter a valid email";
                    } else {
                      return null;
                    }
                  },
                ),

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  controller: phonecontroller,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Mobile number*",
                    prefixIcon: Icon(Icons.phone_android),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Mobile number Required";
                    } else if (RegExp(r'^[6-9].\d{9}$').hasMatch(value)) {
                      return "Enter a valid mobile number";
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: "Male",
                      activeColor: Colors.blue,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                    Text("Male"),
                    SizedBox(width: 20),
                    Radio<String>(
                      activeColor: Colors.blue,
                      value: "Female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value;
                        });
                      },
                    ),
                    Text("Female"),
                  ],
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  controller: datecontroller,
                  keyboardType: TextInputType.datetime,
                  smartDashesType: SmartDashesType.enabled,
                  decoration: InputDecoration(
                    labelText: "Date of birth*",
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                    suffixIcon: InkWell(
                      child: Icon(Icons.date_range_outlined),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          datecontroller.text =
                              "${pickedDate.day.toString().padLeft(2, '0')}/"
                              "${pickedDate.month.toString().padLeft(2, '0')}/"
                              "${pickedDate.year}";
                        }
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Date of birth reuired";
                    } else if (RegExp(
                      r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/(19|20)\d{2}$',
                    ).hasMatch(value)) {
                      return "Enter a valid date of birth";
                    } else {
                      return null;
                    }
                  },
                ),
                countrydropdown(),
                DropdownButtonFormField(
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  value: selectedrole,
                  items: ["Customer", "Owner", "Developer"]
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {
                    selectedrole = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return "please select a role";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Select Role",
                    prefixIcon: Icon(Icons.perm_identity_sharp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  controller: passwordcontroller,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password Required";
                    } else if (value.length < 8) {
                      return "Minium 8 characters required";
                    } else if (RegExp(
                      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>/?])[[A-Za-z]\d[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>/?]{8,}$',
                    ).hasMatch(value)) {
                      return "Minium 8 characters required,At least one captial and one small letter,At least one number,At least one special charcter";
                    } else {
                      return null;
                    }
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: termsandpolicy,
                      onChanged: (value) {
                        setState(() {
                          termsandpolicy = value!;
                        });
                      },
                    ),
                    Text(
                      "Terms and Policy",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate() && termsandpolicy) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Form Submitted Successfully")),
                      );
                      emailcontroller.clear();
                      passwordcontroller.clear();
                      phonecontroller.clear();
                      datecontroller.clear();
                      selectedrole = null;
                    } else if (!termsandpolicy) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Tick the terms and policy!")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Form Submitted has error!")),
                      );
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class countrydropdown extends StatefulWidget {
  const countrydropdown({super.key});

  @override
  State<countrydropdown> createState() => _countrydropdownState();
}

class _countrydropdownState extends State<countrydropdown> {
  final CountryService countrygetservice = CountryService();
  List<Country> countries = [];
  Country? selectedCountry;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  Future<void> loadCountries() async {
    try {
      countries = await countrygetservice.fetchCountries();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : DropdownButtonFormField<Country>(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            value: selectedCountry,
            decoration: InputDecoration(
              labelText: "Select Country",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black38),
              ),
            ),
            items: countries.map((country) {
              return DropdownMenuItem<Country>(
                value: country,
                child: Text(country.name),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCountry = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return "Please select a country";
              }
              return null;
            },
          );
    ;
  }
}

class countryphone extends StatefulWidget {
  countryphone({super.key});

  @override
  State<countryphone> createState() => _countryphoneState();
}

class _countryphoneState extends State<countryphone> {
  Countrysservices countrygetservices = Countrysservices();
  List<Countrys> countrieslist = [];
  Countrys? countries;
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    try {
      countrieslist = await countrygetservices.getcountrys();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isloading
        ? CircularProgressIndicator()
        : DropdownButtonFormField<Countrys>(
            items: countrieslist.map((country) {
              return DropdownMenuItem<Countrys>(
                child: Text(country.name),
                value: country,
              );
            }).toList(),
            onChanged: (value) {},
          );
  }
}
