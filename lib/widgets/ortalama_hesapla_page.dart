// ignore_for_file: prefer_const_constructors

import 'package:dinamik_not_hesaplama/constants/app_constants.dart';
import 'package:dinamik_not_hesaplama/widgets/ders_listesi.dart';
import 'package:dinamik_not_hesaplama/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_not_hesaplama/data/data_helper.dart';

import '../model/ders.dart';


class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {

  var formKey = GlobalKey<FormState>();
  double secilenHarfDeger = 4;
  double secilenKrediDeger = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar( 
        elevation: 0,
        backgroundColor: Colors.grey.shade300,
        title: Center(child: Text(Sabitler.baslikText,style: Sabitler.baslikStyle,)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
               Expanded(
                flex: 2,
          child: _buildForm(),
        ),
         Expanded(
          flex: 1,
          child: Container(
            child: OrtalamaGoster(dersSayisi: DataHelper.tumEklenenDersler.length, ortalama:DataHelper.ortalamaHesapla(),)
            
          ),
        ),

            ],
          ),
        Expanded(
          child:DersListesi(
            onDismiss: (index){
              DataHelper.tumEklenenDersler.removeAt(index);
              setState(() {
                
              });

            },
          ),
          ),
        

      ],)
    );
  }
  
  _buildForm() {
    return Form(
      key: formKey,
      child: Column(children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 8), child:  _buildTextFormField(),),
        SizedBox(height: 5,),
        Row( 
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,), child: _buildHarfler(),)),
            Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,), child: _buildKrediler(),)),          
            IconButton(onPressed: _dersEkleveOrtalamaHesapla,
            icon: Icon(Icons.arrow_forward_ios_sharp, 
            color: Sabitler.anarenk, size: 30)),
          ],
        ),
        SizedBox(height: 5,),
      ]),
    );
  }
  
  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger){
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s){
        if(s!.length <=0){
          return 'Ders adını giriniz';

        }else 
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Ders adı giriniz',
        border: OutlineInputBorder(borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anarenk.shade100.withOpacity(0.30),
      ),
    );
  }
  
  _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding   ,
      decoration: BoxDecoration(
        color: Sabitler.anarenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius  ),
      child: DropdownButton<double>(
        value: secilenHarfDeger,
        elevation: 16,
        iconDisabledColor: Sabitler.anarenk.shade200,
        onChanged: (deger){
          setState(() {
            secilenHarfDeger = deger!;
          });
        },
        items: DataHelper.tumDerslerinHarfleri(),)
    );
  }

  
  _buildKrediler() {  
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding   ,
      decoration: BoxDecoration(
        color: Sabitler.anarenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius ),
      child: DropdownButton<double>(
        value: secilenKrediDeger,
        elevation: 16,
        iconDisabledColor: Sabitler.anarenk.shade200,
        onChanged: (deger){
          setState(() {
            secilenKrediDeger = deger!;
          });
        },
        items: DataHelper.tumDerslerinKredileri(),)
    );
  }


  void _dersEkleveOrtalamaHesapla() {
    formKey.currentState!.save();
    if(formKey.currentState!.validate()){
      var eklenecekDers = Ders(ad:girilenDersAdi, harfDegeri: secilenHarfDeger, krediDegeri:secilenKrediDeger);
        DataHelper.dersEkle(eklenecekDers);
        print(DataHelper.ortalamaHesapla());
        setState(() {
          
        });
    }
  }


}