import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DialogScreen extends StatefulWidget {
  @override
  _DialogScreenState createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  String txtSoru = "";
  Color bibiPink = Hexcolor("#fd79b2");
  Color bibiBlue = Hexcolor("#51c1be");
  String dropValue ;

  List<String> dropDownItems = <String>[
    "Spor",
    "Ekonomi",
    "Bilim",
    "Tarih",
    "Teknoloji",
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 275,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Soru Sor?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    txtSoru = value;
                    debugPrint("Girilen Metin :" + txtSoru);
                  });
                },
                keyboardType: TextInputType.text,
                maxLength: 75,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: "Sorunuz ?",
                  hintText: "Sorunuzu Buraya Giriniz.",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            DropdownButtonHideUnderline(
              child: Container(
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(15)))),
                child: DropdownButton<String>(
                  items: dropDownItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: Text("Bir Kategori Seçiniz"),
                  value: dropValue,
                  elevation: 8,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 35,
                  onChanged: (value) {
                    setState(() {
                      dropValue = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Opacity(opacity: 0, child: Text("sxcz")),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      "Kaydet",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      soruSor();
                    },
                    color: bibiBlue,
                    textColor: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void soruSor() {
    if (txtSoru.length > 0 && dropValue!=null) {
      Navigator.pop(context);
    }
  }

}


