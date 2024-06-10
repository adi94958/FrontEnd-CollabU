---

# CollabU

Aplikasi Flutter untuk mencari partner untuk kompetisi di perguruan tinggi.

## Daftar Isi

- [Fitur](#fitur)
- [Instalasi FrontEnd (Flutter)](#instalasi-frontend-flutter)
- [Instalasi BackEnd (Laravel)](#instalasi-backend-laravel)
- [Penggunaan](#penggunaan)
- [Teknologi yang Digunakan](#teknologi-yang-digunakan)

## Fitur

- **Fitur 1**: Login: fitur ini digunakan untuk bisa masuk ke dalam aplikasi CollabU.
- **Fitur 2**: Register: fitur ini digunakan untuk pengguna yang belum mempunyai akun.
- **Fitur 3**: Membuat lowongan tim: pengguna sebagai perekrut tim dengan membuat lowongan tim mereka sendiri.
- **Fitur 4**: Mendaftar lowongan tim: pengguna sebagai pelamar dapat melamar menjadi bagian dari tim pada sebuah lowongan.
- **Fitur 5**: Kelola lowongan yang dibuat: pengguna sebagai perekrut dapat memantau perkembangan lowongannya melalui fitur ini.
- **Fitur 6**: Kelola lamaran anda: pengguna sebagai pelamar dapat memantau perkembangan lamaran yang ia ajukan melalui fitur itu.
- **Fitur 7**: Kelola profil: pengguna dapat mengelola profil mereka melalui fitur ini.


## Instalasi FrontEnd (Flutter)

1. Pastikan Flutter telah terinstal. [Panduan instalasi Flutter](https://flutter.dev/docs/get-started/install).
2. Clone repositori ini ke dalam folder lokal:

    ```bash
    git clone https://github.com/adi94958/FrontEnd-CollabU.git
    ```

3. Masuk ke dalam folder projek:

    ```bash
    cd nama-repo
    ```

4. Jalankan perintah berikut untuk menginstal semua paket yang diperlukan:

    ```bash
    flutter pub get
    ```

## Instalasi BackEnd (Laravel)

1. Pastikan PHP 7.4 atau yang lebih baru, Composer, dan PostgreSql telah terinstal.
2. Clone repositori backend Laravel dari repository anda:

    ```bash
    git clone https://github.com/adindaraisa/BackEnd-CollabU.git
    ```

3. Masuk ke dalam folder projek backend:

    ```bash
    cd repo-backend
    ```

4. Instal semua dependensi PHP menggunakan Composer:

    ```bash
    composer install
    ```

5. Duplikat file `.env.example` menjadi `.env` dan konfigurasikan sesuai dengan pengaturan database anda.

6. Generate APP_KEY dengan menjalankan:

    ```bash
    php artisan key:generate
    ```

7. Jalankan migrasi untuk membuat tabel-tabel yang diperlukan:

    ```bash
    php artisan migrate --seed
    ```
    
8. Jalankan seeder untuk membuat data seeder pada tabel yang diperlukan:

    ```bash
    php artisan db:seed DatabaseSeeder
    ```

9. Terakhir, jalankan server Laravel:

    ```bash
    php artisan serve
    ```

## Penggunaan

1. Pastikan perangkat anda terhubung ke emulator atau perangkat fisik.
2. Jalankan aplikasi Flutter dengan perintah berikut:

    ```bash
    flutter run
    ```

## Teknologi yang Digunakan

- **Flutter**: Framework FronEnd yang digunakan untuk membuat aplikasi CollabU.
- **Laravel**: Framework BackEnd yang digunakan untuk membuat aplikasi CollabU.
- **PostgreSql**: DBMS yang digunakan untuk membuat aplikasi CollabU.
- **Dart**: Bahasa pemrograman untuk mengembangkan aplikasi CollabU.
- **Php**: Bahasa pemrograman untuk mengembangkan aplikasi CollabU.


---
