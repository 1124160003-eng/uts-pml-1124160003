// lib/models/profile.dart

class Profile {
  final String nama;
  final String nim;
  final String prodi;
  final String kelas;
  final String email;
  final String hp;
  final String github;
  final String bio;

  const Profile({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.email,
    required this.hp,
    required this.github,
    required this.bio,
  });

  Profile copyWith({
    String? nama,
    String? nim,
    String? prodi,
    String? kelas,
    String? email,
    String? hp,
    String? github,
    String? bio,
  }) {
    return Profile(
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      prodi: prodi ?? this.prodi,
      kelas: kelas ?? this.kelas,
      email: email ?? this.email,
      hp: hp ?? this.hp,
      github: github ?? this.github,
      bio: bio ?? this.bio,
    );
  }
}


const Profile initialProfile = Profile(
  nama: 'Given Ezra Dominic Keo',
  nim: '1124160003',
  prodi: 'Teknik Informatika',
  kelas: 'Software Engineering 2',
  email: '1124160003@global.ac.id',
  hp: '081234567890',
  github: 'github.com/Given-keo',
  bio: 'Mahasiswa Teknik Informatika yang tertarik pada pengembangan aplikasi mobile.',
);