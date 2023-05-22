class Riwayat {
  String? idpeminjaman;
  String? tanggal_peminjaman;
  String? jatuh_tempo_peminjaman;
  String? tanggal_pengembalian;
  String? rating_buku;
  String? status;
  String? katalog_id_katalog;
  String? mahasiswa_id_mahasiswa;
  String? judul_buku;
  String? keterangan_buku;
  String? penulis_buku;
  String? penerbit;
  String? tahun_terbit;
  String? status_buku;
  String? kategori_buku_id_kategori_buku;
  String? tanggal_buat;
  String? id_mahasiswa;
  String? nama;
  String?nim;
  String? prodi;
  String? jenis_kelamin;
  String? password;
  String? nomer_telepon;
  String? email;

  Riwayat({
    this.idpeminjaman,
    this.tanggal_peminjaman,
    this.jatuh_tempo_peminjaman,
    this.tanggal_pengembalian,
    this.rating_buku,
    this.status,
    this.katalog_id_katalog,
    this.mahasiswa_id_mahasiswa,
    this.judul_buku,
    this.keterangan_buku,
    this.penulis_buku,
    this.penerbit,
    this.tahun_terbit,
    this.status_buku,
    this.kategori_buku_id_kategori_buku,
    this.tanggal_buat,
    this.id_mahasiswa,
    this.nama,
    this.nim,
    this.prodi,
    this.jenis_kelamin,
    this.password,
    this.nomer_telepon,
    this.email,

  });
  factory Riwayat.fromJson(Map<String, dynamic> json) {
    return Riwayat(
      idpeminjaman: json['id_peminjaman'] ?? '',
      tanggal_peminjaman: json['tanggal_peminjamanl'] ?? '',
      jatuh_tempo_peminjaman: json['jatuh_tempo_peminjaman'] ?? '',
      tanggal_pengembalian: json['tanggal_pengembalian'] ?? '',
      rating_buku: json['rating_buku'] ?? '',
      status: json['status'] ?? '',
      katalog_id_katalog : json['katalog_id_katalog'] ?? '',
      mahasiswa_id_mahasiswa: json['mahasiswa_id_mahasiswa'] ?? '',
      judul_buku: json['judul_buku'] ?? '',
      keterangan_buku: json['keterangan_buku'] ?? '',
      penulis_buku: json['penulis_buku'] ?? '',
      penerbit: json['penerbit'] ?? '',
      tahun_terbit: json['tahun_terbit'] ?? '',
      status_buku: json['status_buku'] ?? '',
      kategori_buku_id_kategori_buku: json['kategori_buku_id_kategori_buku'] ?? '',
      tanggal_buat: json['tanggal_buat'] ?? '',
      id_mahasiswa: json['id_mahasiswa'] ?? '',
      nama:json[ 'nama'] ?? '',
      nim:json['nim'] ?? '',
      prodi:json['prodi']?? '',
      jenis_kelamin:json['jenis_kelamin'] ?? '',
      password:json['password'] ?? '',
      nomer_telepon: json['nomer_telepon'] ?? '',
      email: json['email'] ?? '',
    );
  }
}