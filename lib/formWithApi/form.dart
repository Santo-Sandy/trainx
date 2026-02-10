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
  String? selectedrole = "Customer";
  bool termsandpolicy = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  bool visible = true;

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    phonecontroller.dispose();
    datecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
                  }
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phonecontroller,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: countryphone(),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Mobile number required";
                  }
                  if (!RegExp(r'^[0-9]{6,12}$').hasMatch(value)) {
                    return "Enter a valid mobile number";
                  }
                  return null;
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
              ),
              countrydropdown(),
              DropdownButtonFormField(
                isExpanded: true,
                autovalidateMode: AutovalidateMode.onUnfocus,
                value: selectedrole,
                items: ["Customer", "Owner", "Developer"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedrole = value;
                  });
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
                obscureText: visible,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    icon: Icon(
                      visible ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password Required";
                  }
                  final passwordRegex = RegExp(
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
                  );
                  if (!passwordRegex.hasMatch(value)) {
                    return "Min 8 chars, upper, lower, number & special char required";
                  }
                  return null;
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
                style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
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
      selectedCountry = countries.firstWhere(
        (country) => country.dialCode == "+91",
        orElse: () => countries.first,
      );
      setState(() {});
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
            isExpanded: true,
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
                child: Row(
                  children: [
                    Image.network(
                      country.flag,
                      width: 24,
                      height: 16,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        country.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
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
  CountrysService countrygetservices = CountrysService();
  List<Countrys> countrieslist = [];
  Countrys? selectedcountries;
  Countrys? selectedcountriesdialcode;
  Countrys? selectedcountriesflag;
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  loaddata() async {
    try {
      countrieslist = await countrygetservices.getCountries();
      selectedcountriesdialcode = countrieslist.firstWhere(
        (country) => country.dialCode == "+91", // India
        orElse: () => countrieslist.first,
      );
      setState(() {});
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
        : Container(
            width: 80,
            child: DropdownButtonFormField<Countrys>(
              isExpanded: true,
              value: selectedcountriesdialcode,
              items: countrieslist.map((country) {
                return DropdownMenuItem<Countrys>(
                  value: country,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        country.flag,
                        width: 20,
                        height: 14,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.flag_outlined, size: 16),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          country.dialCode,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              decoration: InputDecoration(border: InputBorder.none),
              onChanged: (value) {
                setState(() {
                  selectedcountriesdialcode = value;
                });
              },
            ),
          );
  }
}
