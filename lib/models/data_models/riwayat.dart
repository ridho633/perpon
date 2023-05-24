class Riwayat {
  final String idpeminjaman;
  final String tanggal_peminjaman;
  final String jatuh_tempo_peminjaman;
  final String tanggal_pengembalian;
  final String rating_buku;
  final String status;
  final String katalog_id_katalog;
  final String mahasiswa_id_mahasiswa;
  final String judul_buku;
  final String keterangan_buku;
  final String penulis_buku;
  final String penerbit;
  final String tahun_terbit;
  final String status_buku;
  final String kategori_buku_id_kategori_buku;
  final String tanggal_buat;
  final String id_mahasiswa;
  final String nama;
  final String nim;
  final String prodi;
  final String jenis_kelamin;
  final String password;
  final String nomer_telepon;
  final String email;

  Riwayat({
    required this.idpeminjaman,
    required this.tanggal_peminjaman,
    required this.jatuh_tempo_peminjaman,
    required this.tanggal_pengembalian,
    required this.rating_buku,
    required this.status,
    required this.katalog_id_katalog,
    required this.mahasiswa_id_mahasiswa,
    required this.judul_buku,
    required this.keterangan_buku,
    required this.penulis_buku,
    required this.penerbit,
    required this.tahun_terbit,
    required this.status_buku,
    required this.kategori_buku_id_kategori_buku,
    required this.tanggal_buat,
    required this.id_mahasiswa,
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.jenis_kelamin,
    required this.password,
    required this.nomer_telepon,
    required this.email,

  });
  factory Riwayat.fromJson(Map<String, dynamic> json) {
    return Riwayat(
      idpeminjaman: json['id_peminjaman'].toString() ?? '',
      tanggal_peminjaman: json['tanggal_peminjaman'] ?? '',
      jatuh_tempo_peminjaman: json['jatuh_tempo_peminjaman'] ?? '',
      tanggal_pengembalian: json['tanggal_pengembalian'] ?? '',
      rating_buku: json['rating_buku'].toString() ?? '',
      status: json['status'].toString() ?? '',
      katalog_id_katalog : json['katalog_id_katalog'].toString() ?? '',
      mahasiswa_id_mahasiswa: json['mahasiswa_id_mahasiswa'].toString() ?? '',
      judul_buku: json['judul_buku'] ?? '',
      keterangan_buku: json['keterangan_buku'] ?? '',
      penulis_buku: json['penulis_buku'] ?? '',
      penerbit: json['penerbit'] ?? '',
      tahun_terbit: json['tahun_terbit'].toString() ?? '',
      status_buku: json['status_buku'].toString() ?? '',
      kategori_buku_id_kategori_buku: json['kategori_buku_id_kategori_buku'].toString() ?? '',
      tanggal_buat: json['tanggal_buat'] ?? '',
      id_mahasiswa: json['id_mahasiswa'].toString() ?? '',
      nama:json['nama'] ?? '',
      nim:json['nim'] ?? '',
      prodi:json['prodi'] ?? '',
      jenis_kelamin:json['jenis_kelamin'] ?? '',
      password:json['password'] ?? '',
      nomer_telepon: json['nomer_telepon'].toString() ?? '',
      email: json['email'] ?? '',
    );
  }
}