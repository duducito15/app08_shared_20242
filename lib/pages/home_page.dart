import 'package:app08_shared_20242/widgets/my_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  //const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false;
  int gender = 1;
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  saveSharedPreferences() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("fullName", _fullNameController.text);
    _prefs.setString("address", _addressController.text);
    print("Guardando datos en Shared Preferences");
  }

  getSharedPreferences() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String fullName = _prefs.getString("fullName") ?? "Sin Nombre";
    String address = _prefs.getString("address") ?? "Sin Dirección";
    //bool res = _prefs.getBool("mayor") ?? true;
    print(fullName);
    print(address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPreferences App"),
        centerTitle: true,
      ),
      drawer: MyDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Configuración General",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                hintText: "Nombre completo",
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: "Dirección actual",
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            // Switch(value: true, onChanged: (bool value){}),
            SwitchListTile(
              value: isDarkMode,
              onChanged: (bool value) {
                isDarkMode = value;
                setState(() {});
              },
              title: Text("Dark mode"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              "Gender",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Radio(value: 0, groupValue: 1, onChanged: (int? value){},),
            RadioListTile(
              value: 1,
              groupValue: gender,
              onChanged: (int? value) {
                gender = value!;
                setState(() {});
              },
              title: Text("Male"),
            ),
            RadioListTile(
              value: 2,
              groupValue: gender,
              onChanged: (int? value) {
                gender = value!;
                setState(() {});
              },
              title: Text("Female"),
            ),
            RadioListTile(
              value: 3,
              groupValue: gender,
              onChanged: (int? value) {
                gender = value!;
                setState(() {});
              },
              title: Text("Binario"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                saveSharedPreferences();
                getSharedPreferences();
              },
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              label: Text(
                "Save Data",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
