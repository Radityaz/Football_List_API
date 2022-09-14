import 'package:flutter/material.dart';

class listview extends StatefulWidget {
  const listview({Key? key}) : super(key: key);

  @override
  State<listview> createState() => _listviewState();
}

class _listviewState extends State<listview> {

  List<NameModel> data = [
    NameModel("Adhanafi Ilyasa Sutejo", "1", " "),
    NameModel("Ahmad Aziz Wira Widodo", "2", " "),
    NameModel("Akbar Rizqullah Putra Susanto", "3", " "),
    NameModel("Alwan Athallah Mumtaz", "4", " "),
    NameModel("Amri Iqro Samudra Al-fatihah", "5", " "),
    NameModel("Anakku Lanang Sejati Adli", "6", " "),
    NameModel("Andika Setya Eka Natha", "7", " "),
    NameModel("Antariksa Kusuma Harmawan", "8", " "),
    NameModel("Azzra Rienov Fahlivi", "9", " "),
    NameModel("Bayu Septian Kurniawan", "10", "11 PPLG"),
    NameModel("Bhre Nabil Faeyza", "11", " "),
    NameModel("Bimo Adi Bramantyo", "12", " "),
    NameModel("Daffa Syauqi Syarif", "13", " "),
    NameModel("Danar Gading", "14", " "),
    NameModel("Dimas Bagus Adityas", "15", " "),
    NameModel("Firdaus Hafidz Al-Kaff", "16", " "),
    NameModel("Hegel Al Rafli", "17", " "),
    NameModel("Hibatullah Fawwaz Hana", "18", " "),
    NameModel("Javier Gavra Abhinaya", "19", " "),
    NameModel("Khoiru Rizal Kalam Hetami", "20", "1 PPLG 1"),
    NameModel("Lugas Richtigo Kalam Hetami", "21", " "),
    NameModel("Maulana Rifky Adityo Afristiano", "22", " "),
    NameModel("Meyssa Aqila Adikara", "23", " "),
    NameModel("Mikhail Haqeen", "24", " "),
    NameModel("Muh Wahyu Ageng Pambudi", "25", " "),
    NameModel("Muhammad Firdan Azhari", "26", " "),
    NameModel("Muhammad Nur Wahid Bimawan", "27", " "),
    NameModel("Muhammad Vitto Corleone", "28", "11 PPLG"),
    NameModel("Muhammad Zumar Ramadhan", "29", " "),
    NameModel("Nabil Rajankanz", "30", " "),
    NameModel("Nadhif Ariq Danendra", "31", " "),
    NameModel("Riko Aditya Zaki", "32", " "),
    NameModel("Rizki Agung Pradana", "33", " "),
    NameModel("Sinatrya Rasyid Fawwaz", "34", " "),
    NameModel("Wulan Febrianti", "35", " "),
  ];

  Widget avatar(int index){
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.blue,
      child: Text(
        data[index].nomorAbsen.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
  Widget textData(int index){
    return Expanded(child: Container(
      margin: EdgeInsets.only(left: 15, top: 9.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            data[index].name.toString(),
            style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("LIST ABSEN"),),
      body: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: data.length,
        itemBuilder: (buildContext, index) {
          return GestureDetector(
            onTap: () => showDialog(context: context, builder: (BuildContext context)=> AlertDialog(
              title: Text("Hapus Kontak"),
              content: Text("Anda yakin ingin menghapus kontak ${data[index].name}?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ya"),
                  onPressed: (){
                    setState(() {
                      data.removeAt(index);
                    });
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Tidak"),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            )),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  avatar(index),
                  textData(index),
                ],
              ),
            ),
          );

          },
      ),
    );
  }
}

class NameModel{
  String name;
  String nomorAbsen;
  String Kelas;

  NameModel(this.name,this.nomorAbsen,this.Kelas);
}