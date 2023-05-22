import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perpon/models/data_models/riwayat.dart';
import '../components/color.dart';
import '../components/size_text.dart';
import '../components/spacing.dart';

class Tampilan_riwayat_buku extends StatefulWidget {
  const Tampilan_riwayat_buku({Key? key, required this.detailRiwayat}) : super(key: key);

  final Riwayat detailRiwayat;

  @override
  State<Tampilan_riwayat_buku> createState() => _Tampilan_riwayat_buku();
}

class _Tampilan_riwayat_buku extends State<Tampilan_riwayat_buku> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.9,
      padding: EdgeInsets.all(Spacing.smallPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: greyColor, width: 2),
      ),
      child: Column(
        children: [
          Row(
              children: [
                Text(
                  'Tanggal Peminjaman :',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline5!
                      .copyWith(
                      fontFamily: 'Poppins',
                      fontSize: SizeText.averageText,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(width: Spacing.smallPadding),
                Text(
                  widget.detailRiwayat.tanggal_peminjaman.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline5!
                      .copyWith(
                      fontFamily: 'Poppins',
                      fontSize: SizeText.averageText,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ]),
          Row(
              children: [
                Text(
                  'Jatuh Tempo :',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline5!
                      .copyWith(
                      fontFamily: 'Poppins',
                      fontSize: SizeText.averageText,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(width: Spacing.smallPadding),
                Text(
                  widget.detailRiwayat.jatuh_tempo_peminjaman.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline5!
                      .copyWith(
                      fontFamily: 'Poppins',
                      fontSize: SizeText.averageText,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ]),
          Row(children: [
            Text(
              'Tanggal Pengembalian :',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6!
                  .copyWith(
                fontFamily: 'Poppins',
                fontSize: SizeText.smallText,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(width: Spacing.smallPadding),
            Text(
              widget.detailRiwayat.tanggal_pengembalian.toString(),
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6!
                  .copyWith(
                  fontFamily: 'Poppins',
                  fontSize: SizeText.smallText,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )
          ]),
          Row(
              children: [
                Text(
                  'Status Jatuh Tempo :',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6!
                      .copyWith(
                    fontFamily: 'Poppins',
                    fontSize: SizeText.averageText,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: Spacing.smallPadding),
                Text(
                  widget.detailRiwayat.status.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6!
                      .copyWith(
                      fontFamily: 'Poppins',
                      fontSize: SizeText.averageText,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                )
              ]),
          Row(
              children: [
                Text(
                  'Katalog :',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6!
                      .copyWith(
                    fontFamily: 'Poppins',
                    fontSize: SizeText.averageText,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: Spacing.smallPadding),
                Text(
                  widget.detailRiwayat.judul_buku.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6!
                      .copyWith(
                    fontFamily: 'Poppins',
                    fontSize: SizeText.averageText,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ]),
          Row(children: [
            Text(
              'Mahasiswa :',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6!
                  .copyWith(
                fontFamily: 'Poppins',
                fontSize: SizeText.averageText,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(width: Spacing.smallPadding),
            Text(
              widget.detailRiwayat.id_mahasiswa.toString(),
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6!
                  .copyWith(
                fontFamily: 'Poppins',
                fontSize: SizeText.averageText,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}