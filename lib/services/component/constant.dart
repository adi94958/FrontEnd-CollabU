import "package:flutter/material.dart";

const snackBarTanggalMasuk = SnackBar(
    content: Text('Tanggal masuk tidak boleh setelah tanggal berakhir!'),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(20),
    backgroundColor: Colors.red);

const snackBarTanggalBerakhir = SnackBar(
  content: Text('Tanggal berakhir tidak boleh sebelum tanggal masuk!'),
  behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.all(20),
  backgroundColor: Colors.red,
);
