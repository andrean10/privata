import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:privata/shared/shared_theme.dart';

import '../app/data/db/status/status_model.dart';
import '../app/data/db/walkthrough/walkthrough_model.dart';
import 'constants_assets.dart';

abstract class ConstantsStrings {
  static const assist = 'Assist.id';

  // AUTH
  static const usernameOrEmail = 'Username/Email';
  static const hintUsernameOrEmail = 'test@gmail.com';
  static const password = 'Password';
  static const hintPassword = '******';

  static const hintDate = 'dd MMMM yyyy';

  static const confirm = 'Konfirmasi';
  static const ok = 'Oke';
  static const save = 'Simpan';

  static const logout = 'Logout';

  // WALKTHROUGHT PAGE
  static final walktroughList = [
    WalkthroughModel(
      title: 'Produktifitas Meningkat',
      description:
          'Dengan Assist.id, produktivitas dokter dan para pegawai di klinik lebih meningkat, serta pengelolaan data menjadi lebih efisien.',
      image: ConstantsAssets.icW1,
    ),
    WalkthroughModel(
      title: 'Fitur Lengkap',
      description:
          'Assist.id memiliki banyak fitur lengkap yang dapat menunjang pekerjaan pegawai di klinik. Baik itu Rekam Medis, Apotek, Laporan dan fitur lainnya.',
      image: ConstantsAssets.icW2,
    ),
    WalkthroughModel(
      title: 'Online Booking',
      description:
          'Assist.id mendukung fasilitas Online Booking pada klinik yang ingin dikunjungi oleh pasien.',
      image: ConstantsAssets.icW3,
    ),
    WalkthroughModel(
      title: 'Laporan Instan',
      description:
          'Assist.id memberikan kemudahan dalam menampilkan laporan secara terperinci dan jelas secara instan.',
      image: ConstantsAssets.icW4,
    ),
    WalkthroughModel(
      title: 'Pengelolaan Mudah',
      description:
          'Dengan menggunakan Assist.id, pengelolaan data-data klinik jauh lebih mudah dan efisien. Membuat pekerjaan para pegawai ataupun dokter di klinik lebih cepat.',
      image: ConstantsAssets.icW5,
    ),
  ];

  static const walkthroughTo = 'Login';

  //  LOGIN PAGE
  static const login = 'Login';
  static const loginToForgotPassword = 'Lupa Password?';
  static const loginTo = 'Belum punya akun? Daftar';
  static const errLogin =
      'Sepertinya ada kesalahan saat login, pastikan username/email dan password kamu sudah benar dan coba lagi';
  static const errFailedLogin = 'Ada kesalahan saat autentikasi coba lagi';

  /// REGISTER PAGE
  static const register = 'Daftar';

  static const registerTitleFullName = 'Nama Lengkap';
  static const registerHintFullName = 'Misal Anton';

  static const registerTitlePhone = 'No. HP';
  static const registerHintPhone = '08xxxxxxxx';

  static const registerTitleEmail = 'Email';

  static const registerTitleUsername = 'Username';
  static const registerHintUsername = 'Misal admin123';

  static const registerTerms =
      'Dengan mendaftar, anda telah menyetujui syarat dan ketentuan Assist.id';
  static const registerTo = 'Sudah punya akun? Login';

  static const errEmail = 'Email anda sudah terdaftar';
  static const errUsername = 'Username anda sudah terdaftar';

  static const successRegistrationAccount =
      'Selamat, pendaftaran kamu berhasil';
  static const failedRegistrationAccount =
      'Maaf, pendaftaran kamu belum berhasil, coba lagi';

  // TERMS AND CONDITION
  static const terms = 'Terms and Condition';

  static const termsContentHTML = """
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Terms and Conditions</title>
  </head>
  <body>
    <section class="section" style="margin-top: 55px">
      <div
        class="container margin-left"
        style="margin-top: -50px; text-align: justify"
      >
        <div class="row ggrx" style="text-align: justify">
          <div class="container">
            <div class="row justify-content-center m-45px-b sm-m-25px-b">
              <div class="col-lg-9 col-md-10">
                <div class="section-title text-center">
                  <p style="text-align: justify">
                    <em
                      >Syarat-syarat ini mengikat dan mulai berlaku untuk Anda
                      saat Anda mulai mengakses layanan apapun dari
                      Assist.id.</em
                    >
                  </p>
                </div>
              </div>
            </div>
          </div>
          <p class="term">
            Layanan Assist.id dapat berubah dari waktu ke waktu berdasarkan
            kesan &amp; saran dari pengguna. Syarat-syarat ini tidak dimaksudkan
            untuk menjawab setiap pertanyaan atau menunjukkan setiap masalah
            yang dapat timbul dari penggunaan layanan Assist.id. Assist.id
            berhak untuk mengubah Syarat &amp; Ketentuan ini kapan saja, dan
            mulai berlaku pada saat Syarat &amp; Ketentuan yang baru atau yang
            telah direvisi di lampirkan di Website Assist.id. Assist.id akan
            berusaha untuk mengumumkan perubahan-perubahannya kepada Anda
            melalui email atau pemberitahuan melalui Website. Karena cukup
            memungkinkan bahwa Syarat &amp; Ketentuan ini akan berubah dari
            waktu ke waktu, maka menjadi kewajiban Anda untuk memastikan bahwa
            Anda sudah membaca, mengerti, dan menyetujui Syarat &amp; Ketentuan
            terbaru yang tersedia pada Website Assist.id. <br />
            <br />
            Dengan mendaftarkan diri untuk menggunakan layanan Assist.id, Anda
            menyatakan bahwa Anda sudah membaca dan mengerti Syarat &amp;
            Ketentuan ini, dan dianggap memiliki wewenang untuk bertindak atas
            nama siapapun yang terdaftar untuk menggunakan layanan kami. <br />
            <br />
            Adapun Layanan yang dimaksudkan berupa sistem informasi manajemen
            fasilitas kesehatan berupa klinik, apotek juga praktek pribadi yang
            bisa digunakan pada browser juga aplikasi android. <br />
            <br />
            Anda diwajibkan untuk membaca Ketentuan dari waktu ke waktu. Dengan
            mengakses atau menggunakan layanan, tindakan tersebut dianggap
            sebagai persetujuan dan penerimaan Anda terhadap Ketentuan kami,
            dengan demikian, Anda setuju untuk terikat pada setiap aturan yang
            dituangkan dalam Ketentuan kami. Apabila Anda tidak setuju dengan
            suatu syarat atau aturan dalam Ketentuan ini, silakan untuk
            menghentikan menggunakan Layanan. <br />
            Seluruh hak yang tidak secara tegas diberikan kepada Pengguna dalam
            Ketentuan ini dimiliki oleh Assist.id <br />
            <em
              >(Syarat &amp; Ketentuan ini terakhir diperbarui pada tanggal 21
              Oktober 2019).</em
            >
          </p>
        </div>
        <div class="row ggrx" style="text-align: justify">
          <span style="color: #255cff"
            ><strong>1. Syarat dan Ketentuan Assist.id</strong></span
          >
        </div>
        <div class="row ggrx" style="text-align: justify">
          <ol style="list-style-type: lower-alpha">
            <li>
              <strong>Perjanjian</strong> - berarti Syarat dan Ketentuan ini;
            </li>
            <li>
              <strong>Assist.id</strong> - adalah sebuah produk dari perusahaan
              berbasis teknologi di bidang kesehatan yang mendigitalisasi
              praktek dokter, klinik, apotek dan rumah sakit Indonesia. Sistem
              Assist.id membantu klinik untuk dapat memantau aktivitas klinik
              secara online yang dapat diakses dimana saja, kapan saja. Kantor
              Assist.id bertempat di :
              <ol type="i">
                <li>
                  <p class="termChild">
                    Kantor Pusat [Jl.Palaraya No.325, Arengka, Kec. Marpoyan
                    Damai, Kota Pekanbaru, Riau 28294].
                  </p>
                </li>
                <li>
                  <p class="termChild">
                    Bandung [BLOCK71 Bandung Innovation Factory, Jl. Ir. H.
                    Djuanda, No.108, Lebakgede, Coblong, Bandung].
                  </p>
                </li>
                <li>
                  <p class="termChild">
                    Jakarta [Ariobimo Sentral, South Jakarta, RT.9/RW.4, East
                    Kuningan, Jakarta, 12950].
                  </p>
                </li>
              </ol>
            </li>
            <li class="termChild">
              <strong>Koneksi Internet</strong> - diperlukan untuk dapat
              menggunakan Layanan, Segala biaya yang timbul atas koneksi
              perangkat elektronik Anda beserta jaringan internet merupakan
              sepenuhnya tanggung jawab Anda.
            </li>
            <li class="termChild">
              <strong>Syarat dan Ketentuan</strong> - adalah perjanjian antara
              Pelanggan dan Assist.id berisi seperangkat peraturan yang mengatur
              hak, kewajiban, tanggung jawab pelanggan dan Assist.id, serta tata
              cara penggunaan sistem layanan Assist.id.
            </li>
            <li class="termChild">
              <strong>Biaya Akses</strong> - berarti biaya bulanan/tahunan yang
              harus dibayarkan sesuai dengan jangka waktu penggunaan produk
              ataupun jenis produk yang disediakan Assist.id kepada pelanggan.
            </li>
            <li class="termChild">
              <strong>Informasi Rahasia</strong> - melingkup semua informasi
              yang dikomunikasikan antara pihak Perjanjian ini, baik secara
              tertulis, elektronik, atau lisan, termasuk Layanan ini, tapi tidak
              termasuk informasi yang sudah menjadi atau akan dijadikan untuk
              public, terkecuali yang sudah diungkapkan dan terbongkar tanpa hak
              atau oleh pihak pengguna atau lainnya secara tidak sah;
            </li>
            <li class="termChild">
              <strong>Data</strong> - berarti data apapun yang Anda masukan atau
              dimasukan dengan kewenangan Anda kepada Assist.id;
            </li>
            <li class="termChild">
              <strong>Hak Kekayaan Intelektual</strong> - berarti paten, merek
              dagang, merek jasa atau layanan, hak cipta, hak pada desain,
              pengetahuan, atau hak kekayaan intelektual atau industri lainnya,
              maupun terdaftar atau tidak terdaftar;
            </li>
            <li class="termChild">
              <strong>Layanan</strong> - adalah layanan training penggunaan
              sistem, kustomasi sistem dan operasional yang disediakan (yang
              bisa berubah dari waktu ke waktu) melalui Assist.id. Adapun jenis
              yang termasuk pada layanan :
              <ol type="i">
                <li><strong>Aplikasi</strong> Android Assist.id dan</li>
                <li>
                  <strong>Website</strong> Assist.id (<a
                    href="https://app.assist.id"
                    target="_blank"
                    rel="noopener"
                    >https://app.assist.id</a
                  >).
                </li>
              </ol>
            </li>
            <li>
              <strong>Website</strong> - berarti situs internet di domain
              <a href="https://assist.id/" target="_blank" rel="noopener"
                >https://assist.id/</a
              >
              atau situs internet lainnya yang dikelola oleh Assist.id;
            </li>
            <li>
              <strong>Assist.id</strong> - berarti
              <u
                >PT. Media Medika Utama yang terdaftar di Indonesia dengan nomor
                TDP 30.06.1.62.09990;</u
              >
            </li>
            <li>
              <strong>Pengguna Diundang</strong> - berarti setiap orang atau
              badan, selain Pelanggan, yang memakai Layanan dari waktu ke waktu
              dengan izin dari Pelanggan;
            </li>
            <li>
              <strong>Pelanggan / Anda</strong> - berarti orang, maupun atas
              nama pribadi, organisasi atau badan lainnya, yang mendaftar untuk
              menggunakan Layanan;
            </li>
          </ol>
          <div class="row ggrx" style="text-align: justify">
            <span style="color: #255cff"
              ><strong>2. Informasi Akun</strong></span
            >
          </div>
          <p>
            Sebelum menggunakan Layanan dari Assist.id Anda perlu memenuhi
            persyaratan berikut :
          </p>
          <ol style="list-style-type: lower-alpha">
            <li>
              penduduk individual berusia sekurang-kurangnya 18 tahun atau
              pernah menikah dan memiliki kapasitas hukum untuk mengikatkan diri
              dalam suatu perjanjian yang sah;
            </li>
            <li>
              badan hukum yang didirikan secara sah berdasarkan hukum jurisdiksi
              terkait dan memiliki domisili hukum, yang diwakili oleh perwakilan
              yang sah dan memiliki kapasitas hukum untuk mengikatkan diri dalam
              perjanjian yang sah, khususnya terkait aturan terkait Layanan,
              untuk mengakses dan menggunakan Layanan.
            </li>
          </ol>
          <p>
            Anda setuju untuk menyediakan informasi akun yang benar, akurat,
            terkini, dan lengkap pada saat proses pendaftaran, dan akan tetap
            menjaga dan segera memperbarui informasi akun untuk memastikan bahwa
            informasi akun tetap benar, akurat, terkini, dan lengkap. Anda
            menyatakan dan menjamin bahwa Anda memiliki hak yang sah untuk
            menggunakan suatu kartu kredit, kartu debit, atau metode pembayaran
            lain yang Anda gunakan sehubungan dengan Layanan.
          </p>
          <p>
            Untuk diketahui bahwa apabila Anda termasuk kategori nomor (b) dan
            dalam kapasitas untuk bertindak untuk dan atas nama suatu badan
            hukum, Anda harus memperoleh persetujuan yang diperlukan dari badan
            hukum tersebut dan dari pihak ketiga lain yang terkait sehubungan
            dengan penggunaan dan tanggung jawab atas
          </p>
          <ol style="list-style-type: lower-alpha">
            <li class="termChild">tindakan Anda sehubungan dengan Layanan;</li>
            <li class="termChild">
              biaya terkait dengan penggunaan Layanan; dan
            </li>
            <li class="termChild">
              penerimaan dan kepatuhan Anda terhadap Ketentuan ini.
            </li>
          </ol>
          <p class="termChild">
            Dengan melanjutkan penggunaan dan/atau menggunakan Layanan, kami
            mengasumsikan bahwa Anda telah memperoleh segala persetujuan yang
            diperlukan dan berwenang untuk mengakses Layanan.
          </p>
          <div class="row ggrx" style="text-align: justify">
            <span style="color: #255cff"
              ><strong>3. Penggunaan Software</strong></span
            >
          </div>
          <div class="row ggrx" style="text-align: justify">&nbsp;</div>
          <div class="row ggrx" style="text-align: justify">
            Assist.id memberi Anda hak untuk mengakses dan menggunakan Layanan
            Assist.id melalui Website kami dengan peran penggunaan yang sudah
            ditentukan untuk Anda, sesuai dengan jenis layanan yang Anda pilih.
            Hak ini non-eksklusif, tidak dapat dipindahtangankan, dan dibatasi
            oleh dan bergantung pada perjanjian ini. Anda mengakui dan
            menyetujui, bergantung kepada perjanjian tulis manapun yang berlaku
            antara Pelanggan dan Pengguna Diundang, atau hukum lainnya yang
            berlaku:
          </div>
          <ol style="list-style-type: lower-alpha">
            <li class="termChild">
              bahwa adalah tanggung jawab Pelanggan untuk menentukan siapa yang
              mendapat akses sebagai Pengguna Diundang dan jenis peran dan hak
              yang mereka punya untuk mengakses jenis data yang Anda miliki;
            </li>
            <li class="termChild">
              bahwa tanggung jawab Pelanggan untuk semua penggunaan Layanan oleh
              Pengguna Diundang;
            </li>
            <li class="termChild">
              bahwa tanggung jawab Pelanggan untuk mengendalikan setiap tingkat
              akses untuk Pengguna Diundang kepada organisasi dan Layanan yang
              relevan setiap saat, dan bisa menarik atau mengubah akses atau
              tingkat akses Pengguna Diundang kapanpun, untuk alasan apapun di
              dalam akses manapun;
            </li>
            <li class="termChild">
              jika ada perselisihan antara Pelanggan dan Pengguna Diundang
              mengenai akses kepada organisasi atau Layanan apapun, Pelanggan
              lah yang harus membuat keputusan dan mengatur akses atau tingkat
              akses ke Data atau Layanan yang Pengguna Diundang akan dapat, jika
              ada.
            </li>
          </ol>
        </div>
        <div class="row ggrx" style="text-align: justify">
          <span style="color: #255cff"
            ><strong>4. Ketersediaan Pelayanan Kami</strong></span
          >
        </div>
        <ol style="list-style-type: lower-alpha">
          <li>
            Layanan: Layanan kami memiliki jaminan 90% uptime per bulan, Jika
            layanan kami jatuh di bawah 90% uptime, maka pelanggan kami berhak
            mengajukan laporan dan mendapat kompensasi
          </li>
          <li>
            Product Support: Pelayanan Product Support kami tersedia melalui 3
            media:
          </li>
        </ol>
        <ol style="list-style-type: lower-roman">
          <li class="termChild">
            Chat: 9.00 &ndash; 18.00, Hari Senin &ndash; Jumat, Chat yang
            diterima di luar jam kerja akan dibalas melalui email dalam kurun
            waktu 24 jam.
          </li>
          <li class="termChild">
            Telepon: 9.00 &ndash; 18.00, Hari Senin &ndash; Jumat
          </li>
          <li class="termChild">
            Email: 9.00 &ndash; 18.00, Hari Senin &ndash; Jumat, Email yang
            diterima di luar jam kerja akan dibalas dalam kurun waktu 24 jam.
          </li>
        </ol>
        <div class="row ggrx" style="text-align: justify">
          <span style="color: #255cff"><strong>5. Kewajiban Anda</strong></span>
        </div>
        <p style="padding-left: 30px">a. Kewajiban Pembayaran</p>
        <p class="termChild" style="padding-left: 30px">
          Sebuah tagihan untuk Biaya Akses akan dibuat setiap bulan, mulai satu
          bulan dari tanggal Anda mulai berlangganan untuk Layanan Assist.id.
          Semua tagihan akan mengandung Biaya Akses untuk periode satu bulan
          pemakaian sebelumnya. Assist.id akan terus membuat tagihan untuk Anda
          setiap bulan sampai perjanjian ini diakhiri sesuai dengan pasal 12.<br />
          Semua tagihan dari Assist.id akan dikirim kepada Anda, atau kepada
          kontak penagihan yang telah Anda berikan, melalui email. Anda harus
          membuat pembayaran untuk seluruh nilai yang tertera di tagihan Anda
          sebelum melewati tanggal jatuh tempo untuk tagihannya, yang harus
          dilunaskan 7 hari dari saat tagihan dikirim oleh Assist.id. Anda
          mempunyai tanggung jawab untuk pembayaran semua pajak dan bea yang
          ditambahkan kepada Biaya Akses tersebut. Anda juga diminta untuk
          menyimpan bukti transaksi. Jika layanan sempat terhenti sebelum
          pembayaran dilakukan, kami akan mengaktifkan layanan dalam waktu 2
          hari kerja.
        </p>
        <p class="termChild" style="padding-left: 30px">b. Kewajiban Umum</p>
        <p class="termChild" style="padding-left: 30px">
          Anda harus memastikan hanya memakai Layanan dan Website untuk
          keperluan internal bisnis Anda yang benar dan secara sah, dengan
          Syarat dan Ketentuan dan pemberitahuan yang diumumkan oleh Assist.id
          atau ketentuan yang tercantum di Website. Anda boleh memakai Layanan
          dan Website atas nama orang atau badan lain, atau untuk memberi
          layanan kepada mereka, tetapi Anda harus memastikan bahwa Anda
          mempunyai wewenang untuk melakukannya, dan semua pihak yang menerima
          Layanan melalui Anda memenuhi dan menyetujui semua syarat dalam
          Perjanjian ini yang berlaku kepada Anda;
        </p>
        <p style="padding-left: 30px">c. Syarat Akses</p>
        <p class="termChild" style="padding-left: 30px">
          Anda harus memastikan bahwa semua username dan password yang
          diperlukan untuk mengakses Layanan Assist.id tersimpan dengan aman dan
          secara rahasia. Anda harus segera memberitahu Assist.id mengenai
          pemakaian password Anda dari pihak yang tidak berwenang, atau
          pelanggaran keamanan lainnya, dan Assist.id akan reset password Anda,
          dan Anda harus melakukan semua tindakan lainnya yang dianggap cukup
          penting oleh Assist.id untuk mempertahankan atau meningkatkan keamanan
          sistem computer dan jaringan Assist.id, dan akses Anda kepada Layanan
          kami.<br />
          Sebagai syarat dari Ketentuan-ketentuan ini, saat mengakses dan
          menggunakan Layanan Assist.id, Anda harus:
        </p>
        <p class="termChild" style="padding-left: 30px">
          i. Tidak mencoba untuk melemahkan keamanan atau integritas dari sistem
          komputer atau jaringan Assist.id, atau jika Layanan-nya di host oleh
          pihak ketiga, sistem komputer atau jaringan pihak ketiga itu;
        </p>
        <ol type="i">
          <li>
            <p class="termChild">
              Tidak menggunakan atau menyalahgunakan Layanan Assist.id dengan
              cara apapun yang dapat mengganggu kemampuan pengguna lain untuk
              menggunakan Layanan atau Website;
            </p>
          </li>
          <li>
            <p class="termChild">
              Tidak mencoba untuk mendapatkan akses yang tidak sah kepada materi
              apapun selain yang sudah dinyatakan dengan jelas bahwa Anda telah
              mendapatkan izin untuk mengakses-nya, atau untuk mengakses sistem
              komputer kami dimana Layanan-nya di host;
            </p>
          </li>
          <li>
            <p class="termChild">
              Tidak mengirimkan, atau memasukan kedalam Website: file apapun
              yang dapat merusak alat komputer atau software orang lain,
              bahan-bahan yang menghina, atau materi atau Data yang melanggar
              hukum apapun (termasuk Data atau materi lainnya yang terlindungi
              oleh hak cipta atau rahasia dagang dimana Anda tidak memiliki hak
              untuk memakainya);
            </p>
          </li>
          <li>
            <p class="termChild">
              Tidak mencoba untuk mengubah, menyalin, meniru, membongkar, atau
              melakukan reverse engineering untuk program komputer apapun yang
              dipakai untuk memberi Layanan Assist.id, atau untuk menggunakan
              Website diluar penggunaan yang diperlukan dan dimaksudkan.
            </p>
          </li>
        </ol>
        <ol>
          <ol style="list-style-type: lower-alpha">
            <li>
              Batasan Penggunaan<br />
              <p class="termChild">
                Penggunaan Layanan Assist.id mungkin dapat dibatasi melingkup,
                tapi tidak terbatas kepada, volume transaksi bulanan dan jumlah
                panggilan yang Anda diizinkan untuk menggunakan dengan memanggil
                kepada programming interface aplikasi Assist.id. Bila ada,
                batasan-batasan tersebut akan ditentukan dan dicantumkan pada
                Layanan yang terkait.
              </p>
            </li>
            <li>
              <p class="termChild">Syarat Komunikasi</p>
              <p class="termChild">
                Sebagai syarat pada Ketentuan ini, jika Anda memakai alat
                komunikasi apapun yang tersedia melalui Website (seperti forum
                apapun atau ruang chat), Anda setuju untuk memakai alat-alat
                komunikasi tersebut hanya untuk tujuan yang sah. Anda tidak
                boleh memakai alat-alat komunikasi tersebut untuk memasang atau
                menyebarkan materi apapun yang tidak terkait dengan pemakaian
                Layanan-nya, termasuk (tapi tidak terbatas dengan): menawarkan
                barang dan jasa untuk dijual, e-mail komersial yang tidak
                diminta atau diinginkan, file yang dapat merusak alat komputer
                atau software orang lain, bahan-bahan yang mungkin dapat
                menghina pengguna Layanan atau Website yang lain, atau materi
                yang melanggar hukum apapun (termasuk materi yang terlindungi
                oleh hak cipta atau rahasia dagang dimana Anda tidak memiliki
                hak untuk memakainya).<br />
                Saat Anda melakukan komunikasi dalam bentuk apapun di Website,
                Anda menjamin bahwa Anda diperbolehkan untuk membuat komunikasi
                tersebut. Assist.id tidak berkewajiban untuk memastikan bahwa
                komunikasi pada Website adalah sah dan benar, atau bahwa mereka
                terkait hanya pada penggunaan Layanan. Assist.id berhak untuk
                menghapus komunikasi apapun setiap saat atas kebijakannya
                sendiri.
              </p>
            </li>
            <li>
              <p class="termChild">Tanggung Jawab Ganti Rugi</p>
              <p class="termChild">
                Anda membebaskan Assist.id dari semua: tuntutan, gugatan, biaya
                kerugian, kerusakan, dan kehilangan yang timbul sebagai hasil
                dari pelanggaran Anda kepada Syarat dan Ketentuan yang tertera
                di Perjanjian ini, atau kewajiban apapun yang mungkin Anda punya
                kepada Assist.id, termasuk (tapi tidak terbatas kepada) biaya
                apapun yang berkaitan kepada perolehan Biaya Akses apapun yang
                sudah jatuh tempo tetapi belum Anda bayar.
              </p>
            </li>
          </ol>
        </ol>
        <div class="row ggrx" style="text-align: justify">
          <span style="color: #255cff"
            ><strong>6. Kerahasiaan dan Privasi</strong></span
          >
        </div>
        <p style="padding-left: 30px">a. Kerahasiaan</p>
        <p class="termChild" style="padding-left: 60px">
          Masing-masing pihak berjanji untuk menjaga kerahasiaan semua Informasi
          Rahasia pihak lainnya sehubungan dengan ketentuan ini. Setiap pihak
          TIDAK AKAN, tanpa persetujuan tertulis dari pihak yang lain,
          mengungkapkan atau memberi Informasi Rahasia kepada siapapun, atau
          menggunakannya untuk kepentingan sendiri, selain sebagaimana dimaksud
          oleh Ketentuan ini.<br />
          Kewajiban masing-masing pihak dalam ketentuan ini akan bertahan
          walaupun setelah pemutusan Ketentuan ini.<br />
          Ketentuan-ketentuan pasal tidak berlaku untuk informasi yang:
        </p>
        <ol type="i">
          <li>
            <p class="termChild">
              Telah menjadi pengetahuan umum selain karena pelanggaran ketentuan
              ini;
            </p>
          </li>
          <li>
            <p class="termChild">
              Diterima dari pihak ketiga yang dengan secara sah memperolehnya,
              dan tidak mempunyai kewajiban untuk membatasi pengungkapannya;
            </p>
          </li>
          <li>
            <p class="termChild">
              Dikembangkan dengan sendiri tanpa akses kepada Informasi Rahasia.
            </p>
          </li>
        </ol>
        <p class="termChild" style="padding-left: 30px">b. Privasi</p>
        <p class="termChild">
          Assist.id memiliki dan mempertahankan kebijakan privasi yang
          menjelaskan dan menetapkan kewajiban para pihak untuk menghormati
          informasi pribadi. Anda disarankan membaca kebijakan privasi kami di
          <a href="https://assist.id/privacy" target="_blank" rel="noopener"
            >https://assist.id/privacy</a
          >, dan Anda akan dianggap sudah menyetujui kebijakan itu saat Anda
          menyetujui ketentuan ini.
        </p>
        <p class="termChild">
          <strong style="color: #255cff">7. Intellectual Property</strong>
        </p>
        <p class="termChild">
          Kepemilikan dan semua Hak Kekayaan Intelektual yang didapat pada
          Layanan, Website, dan dokumentasi apapun yang terkait dengan Layanan
          tetap menjadi hak milik Assist.id.
        </p>
        <p class="termChild">
          Kepemilikan dan semua Hak Kekayaan Intelektual yang terdapat di Data
          tetap menjadi hak milik Anda. Akan tetapi, akses kepada Data Anda
          bergantung pada pelunasan Biaya Akses Assist.id saat tagihan jatuh
          tempo. Anda memberi izin kepada Assist.id untuk menggunakan, menyalin,
          mengirim, menyimpan, dan melakukan back-up untuk informasi dan Data
          Anda dengan maksud dan tujuan memberi Anda akses kepada dan agar dapat
          menggunakan Layanan Assist.id, atau untuk tujuan lainnya yang terkait
          dengan penyediaan layanan kami untuk Anda.
        </p>
        <p class="termChild">
          Anda sangat disarankan untuk menyimpan salinan untuk semua Data yang
          Anda masukan ke dalam Layanan Assist.id. Assist.id mematuhi kebijakan
          dan menjalani prosedur terbaik untuk mencegah kehilangan data,
          termasuk rutinitas sistem harian untuk back-up data, tetapi tidak
          membuat jaminan apapun bahwa tidak akan pernah adanya kehilangan Data.
          Assist.id dengan jelas mengesampingkan tanggung jawab untuk setiap
          kehilangan Data dengan sebab apapun.
        </p>
        <p class="termChild">
          <strong style="color: #255cff"
            >8. Layanan Assist.id disediakan "Sebagaimana Adanya"</strong
          >
        </p>
        <p class="termChild">
          Layanan diberikan dengan dasar "sebagaimana adanya" dan "sebagaimana
          tersedia", dan penggunaan Layanan oleh Anda adalah pada risiko
          tanggungan Anda sendiri. Kami akan berusaha untuk memberitahukan (pada
          jam kerja normal) seluruh permasalahan teknis yang muncul sehubungan
          dengan Layanan.
        </p>
        <p class="termChild">Kami tidak menjamin bahwa:</p>
        <ul>
          <li class="termChild">
            Layanan akan memenuhi kebutuhan khusus Anda;
          </li>
          <li class="termChild">
            Layanan akan tidak terganggu, cepat, aman, atau bebas dari
            kekeliruan;
          </li>
          <li class="termChild">Layanan akan akurat dan dapat diandalkan;</li>
          <li class="termChild">
            kualitas dari segala produk, layanan, informasi, atau material lain
            yang dibeli atau diperoleh oleh Anda melalui Layanan akan memenuhi
            ekspektasi Anda; atau
          </li>
          <li class="termChild">
            segala kekeliruan dalam Layanan akan diperbaiki.
          </li>
        </ul>
        <p>
          Anda mengakui bahwa Assist.id dapat menggunakan pemasok pihak ketiga
          untuk menyediakan perangkat keras, perangkat lunak, jaringan,
          sambungan, penyimpanan, dan teknologi lain untuk dapat menyediakan
          Layanan. Tindakan dan kelalaian pemasok pihak ketiga tersebut mungkin
          di luar kendali Assist.id, dan Assist.id tidak menerima tanggung jawab
          atas kerugian atau kerusakan yang diderita sebagai akibat dari segala
          tindakan atau kelalaian oleh pemasok pihak ketiga manapun.
        </p>
        <p>
          Atas nama diri sendiri dan pihak ketiga manapun tersebut, Assist.id
          mengecualikan segala jaminan lain yang mungkin tersirat ataupun
          berlaku berdasarkan peraturan atau undang-undang lain yang berlaku,
          sepanjang diperkenankan berdasarkan hukum.
        </p>
        <p>
          Untuk kemudahan Anda, Assist.id dapat mencantumkan tautan ke situs
          atau konten lain dalam internet yang dimiliki atau dioperasikan oleh
          pihak ketiga. Situs atau konten yang ditautkan tidak berada di bawah
          kendali Kami dan Assist.id tidak bertanggung jawab untuk segala
          kekeliruan, kelalaian, keterlambatan, penghinaan, fitnah, kebohongan,
          pornografi, konten asusila, ketidaktepatan, atau material lain yang
          dimuat dalam konten, atau konsekuensi dari mengakses website terkait
          manapun serta akurasi informasi, konten, produk, atau layanan yang
          ditawarkan oleh, atau informasi yang terdapat dalam situs yang
          bertautan dengan atau dari Situs. Mengingat bahwa website pihak ketiga
          mungkin memiliki kebijakan privasi dan/atau standar keamanan berbeda
          yang berlaku dalam website mereka, kami menganjurkan Anda untuk
          memeriksa kebijakan privasi dan syarat dan ketentuan situs-situs
          tersebut sebelum memberikan informasi pribadi apapun.
        </p>
        <p>
          Harap diketahui bahwa segala tautan ke situs atau konten lain manapun
          bukan merupakan bentuk dukungan atau verifikasi atas situs atau konten
          tersebut dan Anda setuju bahwa risiko dari akses terhadap situs atau
          konten yang ditautkan tersebut sepenuhnya ada pada Anda.
        </p>
        <p>
          <strong style="color: #255cff"
            >9. Tanggung Jawab Kami Terbatas</strong
          >
        </p>
        <p>
          Sepanjang diperkenankan oleh hukum, Assist.id tidak bertanggung jawab
          atas segala kerugian langsung, tidak langsung, tidak diduga, khusus,
          berkelanjutan, atau tipikal, termasuk namun tidak terbatas pada,
          kerugian atas kehilangan laba, usaha, goodwill, penggunaan, data atau
          kehilangan tidak berwujud lainnya (sekalipun jika Assist.id telah
          mengetahui kemungkinan atas kerugian tersebut), yang diakibatkan oleh:
        </p>
        <ul>
          <li>
            penggunaan atau ketidakmampuan penggunaan Layanan (secara
            keseluruhan atau sebagian) atau malfungsi teknis apapun:
          </li>
          <li>biaya pengadaan barang dan jasa pengganti;</li>
          <li>
            akses yang tidak sah pada, atau perubahan dari, komunikasi atau data
            Anda;
          </li>
          <li>
            pernyataan atau tindakan pihak ketiga sehubungan dengan Layanan;
          </li>
          <li>hal lain sehubungan dengan Layanan;</li>
          <li>pelanggaran Ketentuan ini oleh Anda;</li>
          <li>
            tuntutan atas pelanggaran hak cipta, merek dagang, rahasia dagang,
            atau hak kekayaan intelektual pihak ketiga lainnya, hak publikasi,
            hak privasi, atau pencemaran nama baik;
          </li>
          <li>
            pelanggaran oleh Anda atas hukum yang berlaku atau perjanjian
            manapun terkait ketentuan dengan pihak ketiga, dalam hal mana Anda
            terikat; dan/atau
          </li>
          <li>
            hal lainnya sehubngan dengan Layanan dan akses serta penggunaan Anda
            atas Layanan.
          </li>
        </ul>
        <p>
          <strong style="color: #255cff"
            >10. Dalam hal apapun, keseluruhan tanggung jawab maksimal dari
            Assist.id berdasarkan atau sehubungan dengan Ketentuan ini atau
            penggunaan Layanan oleh Anda terbatas pada besar Biaya yang Anda
            bayarkan dalam kurun waktu 12 bulan terakhir</strong
          >
        </p>
        <p><strong style="color: #255cff">11. Jaminan dan Pengakuan</strong></p>
        <div class="container margi-lef">
          <ol>
            <li>
              Anda menjamin bahwa, jika Anda mendaftar untuk menggunakan Layanan
              atas nama orang lain, Anda memiliki wewenang untuk menyetujui
              Ketentuan-ketentuan ini atas nama orang tersebut, dan menyetujui
              bahwa dengan mendaftar untuk memakai Layanan Assist.id, Anda
              mengikat orang yang Anda atas namakan untuk, atau dengan niat
              untuk, membuat tindakan atas nama mereka kepada setiap kewajiban
              manapun yang Anda telah setujui pada Ketentuan-ketentuan ini,
              tanpa membatasi kewajiban Anda sendiri kepada ketentuannya.
            </li>
            <li>
              Anda mengakui bahwa:
              <ol type="i">
                <li>
                  <p class="termChild">
                    Anda memiliki wewenang untuk menggunakan Layanan dan
                    Website, dan untuk mengakses informasi dan Data yang Anda
                    masukan kedalam Website, termasuk informasi atau Data apapun
                    yang dimasukan kedalam Website oleh siapapun yang Anda telah
                    beri kewenangan untuk menggunakan Layanan Assist.id.<br />
                    Anda juga berwenang untuk mengakses informasi dan data yang
                    sudah di proses, yang disediakan untuk Anda melalui
                    penggunaan Anda pada Website dan Layanan kami (maupun
                    informasi dan Data itu Anda miliki sendiri atau milik orang
                    lain).
                  </p>
                </li>
                <li>
                  <p class="termChild">
                    Assist.id tidak bertanggung jawab kepada siapapun selain
                    Anda, dan tidak ada maksud apapun dalam Perjanjian ini untuk
                    memberi manfaat kepada siapapun selain Anda. Jika Anda
                    memakai Layanan atau mengakses Website atas nama atau untuk
                    manfaat seseorang selain Anda (maupun organisasi berbadan
                    hukum atau tidak, atau lainnya), Anda menyetujui bahwa:
                  </p>
                  <ol type="1">
                    <li>
                      <p class="termChild">
                        Anda bertanggung jawab untuk memastikan bahwa Anda
                        memiliki hak untuk melakukannya;
                      </p>
                    </li>
                    <li>
                      <p class="termChild">
                        Anda bertanggung jawab atas memberi wewenang kepada
                        siapapun yang Anda berikan akses kepada informasi atau
                        Data, dan Anda menyutujui bahwa Assist.id tidak memiliki
                        tanggung jawab untuk menyediakan siapapun akses kepada
                        informasi atau Data tersebut tanpa otorisasi Anda, dan
                        boleh menunjukan permohonan apapun untuk mendapatkan
                        informasi kepada Anda untuk dilayani;
                      </p>
                    </li>
                    <li>
                      <p class="termChild">
                        Anda membebaskan Assist.id dari klaim apapun atau
                        kehilangan yang terkait pada: Penolakan Assist.id untuk
                        menyediakan akses pada siapapun kepada informasi atau
                        Data Anda sesuai dengan ketentuan ini; Penyediaan
                        informasi atau Data oleh Assist.id kepada siapapun
                        berdasarkan otorisasi Anda.
                      </p>
                    </li>
                  </ol>
                </li>
                <li>
                  <p class="termChild">
                    Penyediaan, akses kepada, dan pemakaian Layanan Assist.id
                    tersedia sebagaimana adanya dan pada resiko Anda sendiri.
                  </p>
                </li>
                <li>
                  <p class="termChild">
                    Assist.id tidak menjamin bahwa penggunaan Layanan tidak akan
                    pernah terganggu atau bebas dari kesalahan. Di antara lain,
                    operasi dan ketersediaan sistem yang digunakan untuk
                    mengakses Layanan, termasuk layanan jaringan komputer dan
                    internet, bisa susah diprediksi dan mungkin bisa dari waktu
                    ke waktu mengganggu atau mencegah akses kepada Layanan.
                    Assist.id dengan bagaimanapun tidak bertanggung jawab atas
                    gangguan tersebut, atau pencegahan akses kepada penggunaan
                    Layanan.
                  </p>
                </li>
                <li>
                  <p class="termChild">
                    Untuk menentukan bahwa Layanan kami memenuhi keperluan
                    bisnis Anda dan bisa digunakan sesuai dengan tujuan adalah
                    tanggung jawab Anda sendiri.
                  </p>
                </li>
                <li>
                  <p class="termChild">
                    Anda tetap memiliki tanggung jawab untuk mematuhi semua
                    undang-undang yang berlaku. Menjadi tanggung jawab Anda
                    untuk memeriksa bahwa penyimpanan dan akses kepada Data Anda
                    melalui Layanan dan Website tetap mematuhi undang-undang
                    yang berlaku kepada Anda (termasuk undang-undang apapun yang
                    membutuhkan Anda untuk menyimpan arsip).
                  </p>
                </li>
              </ol>
            </li>
          </ol>
        </div>
        <div class="row ggrx">
          <div class="row ggrx">
            <ol>
              <ol>
                <ol type="a">
                  <li>
                    <p class="termChild">
                      Assist.id tidak memberi jaminan untuk Layanan-nya. Tanpa
                      mengabaikan ketentuan di atas, Assist.id tidak menjamin
                      bahwa Layanan kami akan memenuhi keperluan Anda, atau
                      bahwa akan sesuai untuk tujuan yang Anda niatkan. Untuk
                      menghindari keraguan, semua ketentuan atau jaminan yang
                      bisa diartikan dikecualikan sejauh yang diizinkan oleh
                      hukum, termasuk (tanpa batasan) jaminan penjualan,
                      kesesuaian untuk tujuan, dan tanpa pelanggaran.
                    </p>
                  </li>
                  <li>
                    <p class="termChild">
                      Anda menjamin dan menunjukkan bahwa Anda sedang memperoleh
                      hak untuk mengakses dan menggunakan Layanan untuk tujuan
                      bisnis dan bahwa, sampai batas maksimum yang diizinkan
                      oleh hukum, jaminan konsumen berdasarkan hukum atau
                      undang-undang yang dimaksudkan untuk melindungi konsumen
                      non-bisnis di yurisdiksi manapun tidak berlaku untuk
                      penyediaan Layanan, Website, atau ketentuan ini.
                    </p>
                  </li>
                </ol>
              </ol>
            </ol>
          </div>
        </div>
        <p><strong style="color: #255cff">12. Batasan Kewajiban</strong></p>
        <ol style="list-style-type: lower-alpha">
          <li>
            Sampai batas maksimal yang diizinkan oleh hukum, Assist.id
            mengecualikan semua kewajiban dan tanggung jawab kepada Anda (atau
            orang lain manapun) dalam kontrak, gugatan kesalahan (termasuk
            kelalaian), atau selainya, untuk kehilangan apapun (termasuk
            kehilangan informasi, Data, keuntungan, dan tabungan) atau kerusakan
            yang diakibatkan, secara langsung atau tidak langsung, dari
            penggunaan apapun, atau ketergantungan kepada, Layanan atau Website.
          </li>
          <li>
            Jika Anda mengalami kerugian atau kerusakan apapun karena kelalaian
            atau kegagalan Assist.id untuk memenuhi ketentuan ini, klaim apapun
            dari Anda kepada Assist.id yang timbul dari kelalaian atau kegagalan
            Assist.id akan dibataskan mengenai satu kejadian, atau serangkaian
            kejadian yang terhubung, kepada Biaya Akses yang sudah Anda lunaskan
            dalam 12 bulan sebelumnya.
          </li>
          <li>
            Jika Anda tidak puas dengan layanannya, jalur penyelesaian tunggal
            dan eksklusif Anda adalah untuk menghentikan ketentuan ini sesuai
            dengan pasal.
          </li>
        </ol>
        <p><strong style="color: #255cff">13. Pemutusan Kontrak</strong></p>
        <ol style="list-style-type: lower-alpha">
          <li>
            Kebijakan Masa trial: Anda diberi kesempatan untuk mengevaluasi
            Layanan yang diberikan kepada Anda oleh Assist.id sebelum memutuskan
            untuk mengikat kontrak. Dalam masa ini, Anda diberi batasan waktu
            dan wajib memberikan keputusan apakah akan mengikat kontrak dengan
            Assist.id pada waktu yang telah ditentukan. Anda dikenakan biaya
            jika memutuskan untuk mengikat kontrak sesuai dengan masa penggunaan
            Layanan dan Jenis Layanan yang akan Anda gunakan.
          </li>
          <li>
            Assist.id tidak menyediakan pengembalian uang untuk periode prabayar
            yang tersisa pada langganan Biaya Akses Anda.
          </li>
          <li>
            Ketentuan ini akan berlaku untuk periode yang dicakup oleh Biaya
            Akses yang telah atau dapat dibayar pada pasal 3 ayat 1. Pada masa
            akhir setiap periode penagihan, Ketentuan ini akan berlanjut secara
            otomatis untuk periode selanjutnya untuk jangka waktu yang sama,
            asalkan Anda terus membayar Biaya Akses yang sudah ditentukan saat
            jatuh tempo, kecuali salah satu pihak mengakhiri Ketentuan ini
            dengan pemberitahuan kepada pihak lainnya setidaknya
            <u>30 hari</u> sebelum akhir periode pembayaran yang bersangkutan.
          </li>
          <li>
            &nbsp;Pelanggaran
            <ol type="i">
              <li>
                <p class="termChild">
                  Jika Anda melanggar apapun dari Ketentuan ini (termasuk, tapi
                  tidak terbatas dengan, tidak membayar Biaya Akses apapun) dan
                  tidak menyelesaikan masalah pelanggaran dalam 14 hari setelah
                  menerima pemberitahuan pelanggaran tersebut jika permasalahan
                  pelanggaran tersebut bisa diselesaikan;
                </p>
              </li>
              <li>
                <p class="termChild">
                  Jika Anda melanggar apapun dari Ketentuan ini dan pelanggaran
                  itu tidak bisa diselesaikan (termasuk, tapi tidak terbatas
                  dengan) pelanggaran apapun mengenai pasal 3 ayat 4 atau
                  kegagalan untuk membayar Biaya Akses yang sudah melewati
                  tanggal jatuh tempo lebih dari 30 hari;
                </p>
              </li>
              <li>
                <p class="termChild">
                  Jika Anda atau bisnis Anda bangkrut, atau sedang melewati
                  proses untuk mengakhiri keberadaan organisasi, Assist.id bisa
                  mengambil salah satu atau semua tindakan berikut:
                </p>
                <ol type="1">
                  <li>
                    <p class="termChild">
                      Mengakhiri Perjanjian ini dan penggunaan Anda untuk
                      Layanan dan Website kami;
                    </p>
                  </li>
                  <li>
                    <p class="termChild">
                      Menunda akses Anda kepada Layanan dan Website Assist.id
                      untuk periode yang tidak menentu;
                    </p>
                  </li>
                  <li>
                    <p class="termChild">
                      Menunda akses atau mengakhiri akses kepada semua Data atau
                      Data apapun;
                    </p>
                  </li>
                </ol>
              </li>
              <li>
                <p class="termChild">
                  Pemutusan Ketentuan ini tidak mengurangi hak dan kewajiban
                  para pihak yang masih harus dibayar sampai dengan tanggal
                  terminasi. Pada pengakhiran Perjanjian ini Anda akan tetap
                  menanggung biaya yang masih harus dibayar dan jumlah yang
                  jatuh tempo untuk pembayaran sebelum atau setelah pengakhiran,
                  dan segera berhenti menggunakan Layanan dan Website kami.
                </p>
              </li>
            </ol>
          </li>
        </ol>
        <p class="termChild">
          <strong style="color: #255cff"
            >14. Kebijakan Penggunaan Yang Dibenarkan</strong
          >
        </p>
        <p class="termChild">
          Assist.id memiliki hak untuk menentukan apakah suatu pengguna memiliki
          kualifikasi dan dapat diterima untuk menggunakan Layanan. Dalam hal
          apapun, Assist.id dapat melarang, mencegah, atau membatalkan akses
          terhadap Layanan pada setiap waktu, kepada pengguna manapun, dengan
          alasan yang wajar, yang semata-mata bergantung pada kebijakan
          Assist.id tanpa kewajiban bagi Assist.id untuk mengungkapkan atau
          menjelaskan kepada pihak manapun.
        </p>
        <p class="termChild">
          Anda bertanggung jawab sepenuhnya atas penggunaan Layanan dalam cara
          yang wajar dan setuju untuk tidak meminta pertanggungjawaban dari
          Assist.id atas segala tuntutan, kerugian, dan/atau kehilangan
          sehubungan dengan penggunaan Layanan. Tanpa Batasan, Anda setuju bahwa
          Anda tidak akan mengaitkan Layanan dengan aktivitas apapun yang
          mungkin dianggap, termasuk namun tidak terbatas, sebagai:
        </p>
        <ul>
          <li class="termChild">
            Menyalahi atau melanggar hak kekayaan intelektual pihak lain;
          </li>
          <li class="termChild">
            Melanggar hak publikasi atau hak privasi orang lain;
          </li>
          <li class="termChild">
            Ilegal atau mendorong atau sehubungan dengan, baik secara langsung
            maupun tidak langsung, tindakan ilegal apapun;
          </li>
          <li class="termChild">
            Mengandung virus perangkat lunak atau kode, file, atau program
            computer lain apapun yang dirancang untuk menginterupsi,
            menghancurkan, memanipulasi, merusak, atau membatasi fungsi atas
            suatu perangkat lunak atau perangkat keras komputer apapun atau
            peralatan telekomunikasi;
          </li>
          <li class="termChild">
            Menjual penggunaan, akses, atau mereproduksi Layanan kepada pihak
            ketiga manapun; dan/atau
          </li>
          <li class="termChild">
            Suatu penipuan, memperdaya, atau menyesatkan dengan cara apapun.
          </li>
        </ul>
        <p>&nbsp;</p>
        <p>
          Dengan adanya indikasi atas pelanggaran terhadap kebijakan penggunaan
          yang dibenarkan, Assist.id memiliki hak untuk mengakhiri penyediaan
          Layanan dan melakukan pembatalan akun, tanpa kewajiban apapun untuk
          mengembalikan, mengganti, atau membayarkan kembali biaya berlangganan
          dan/atau untuk bertanggung jawab atas segala ganti rugi dalam bentuk
          apapun, atau untuk menerapkan pembatasan atas penggunaan Layanan oleh
          Anda. Apabila memungkinkan, kami akan berusaha untuk menyediakan
          pemberitahuan 24 jam sebelumnya dan meminta bahwa penggunaan Anda
          dikurangi sebelum menerapkan pembatasan apapun. Terlepas dari hal
          tersebut, Assist.id memilik hak untuk membuat laporan apapun kepada
          institusi pemerintah yang berwenang dan institusi penegak hukum
          sehubungan dengan adanya indikasi pelanggaran, sebagaimana relevan.
        </p>
      </div>
      <div class="row ggrx" style="padding-left: 30px; text-align: justify">
        &nbsp;
      </div>
      <div class="row ggrx" style="text-align: justify">
        <span style="color: #255cff"
          ><strong>15. Ketentuan Umum Lainnya</strong></span
        >
      </div>
      <ol>
        <ol type="a">
          <li>
            <p class="termChild" style="text-align: justify">
              Syarat dan Ketentuan ini, bersama dengan Kebijakan Privasi
              Assist.id dan ketentuan dari pemberitahuan atau instruksi yang
              diberikan kepada Anda dibawah Syarat dan Ketentuan ini
              menggantikan dan menghapus semua perjanjian sebelumnya,
              representasi (baik lisan maupun tulisan), dan pemahaman, dan
              merupakan keseluruhan perjanjian antara Anda dan Assist.id yang
              berhubungan dengan Layanan dan hal lainnya yang dibahas dalam
              Ketentuan ini.
            </p>
          </li>
          <li>
            <p class="termChild" style="text-align: justify">
              Jika salah satu pihak melepaskan tuntutan dari pelanggaran apapun
              pada Ketentuan ini, ini tidak akan melepaskan mereka dari tuntutan
              pelanggaran lainnya. Pelepasan dari tuntuntan tidak efektif
              kecuali dibuat secara tulisan.
            </p>
          </li>
          <li>
            <p class="termChild" style="text-align: justify">
              Para pihak tidak harus bertanggung jawab atas keterlambatan atau
              kegagalan dalam untuk menyelesaikan kewajibannya dibawah Ketentuan
              ini jika keterlambatan atau kegagalannya adalah karena sebab
              apapun yang di luar kendali. Ayat ini tidak berlaku untuk
              kewajiban pembayaran uang apapun.
            </p>
          </li>
          <li>
            <p class="termChild" style="text-align: justify">
              Anda tidak dapat mengalihkan atau mentransfer hak kepada orang
              lain tanpa persetujuan tertulis dari Assist.id.
            </p>
          </li>
          <li>
            <p class="termChild" style="text-align: justify">
              Apabila terjadi perselisihan antara kedua belah pihak, akan coba
              diselesaikan secara musyawarah terlebih dahulu untuk mencapai
              mufakat. Apabila dengan cara tersebut tidak tercapai kata sepakat,
              maka kedua belah pihak sepakat untuk menyelesaikan permasalahan
              tersebut dilakukan melalui prosedur hukum dengan memilih kedudukan
              hukum Republik Indonesia di Kantor Pengadilan Negeri Jakarta
              Pusat.
            </p>
          </li>
          <li>
            <p class="termChild" style="text-align: justify">
              Setiap pemberitahuan yang diberikan berdasarkan Persyaratan ini
              oleh satu pihak ke yang lain harus dilakukan secara tertulis
              melalui email dan akan dianggap telah diberikan pada saat
              transmisi dilakukan. Pemberitahuan kepada Assist.id harus dikirim
              ke <u>support@Assist.id.id</u> atau ke alamat email lainnya yang
              diberitahukan kepada Anda oleh Assist.id. Pemberitahuan kepada
              Anda akan dikirim ke alamat email yang Anda berikan saat membuat
              akses Anda pada Layanan kami.
            </p>
          </li>
          <li>
            <p class="termChild" style="text-align: justify">
              Subscription adalah pembayaran berulang yang dibayar di muka untuk
              mengkonsumsi jasa sistem infromasi yang disediakan Assist.id .
              Setelah subscription telah dibeli, Anda bisa membatalkan setiap
              saat tanpa biaya tambahan kecuali yang sudah dibayarkan.
              Pembatalan membutuhkan paling lama <u>31 hari</u> sebelum efektif.
            </p>
          </li>
        </ol>
      </ol>
      <div class="footer-copy" style="margin-bottom: -50px">
        <div class="row">
          <div class="col-12">
            <p style="color: gray; text-align: center">PT. JAGA</p>
          </div>
          <!-- col -->
        </div>
        <!-- row -->
      </div>
      <!-- footer-copy -->
    </section>
  </body>
</html>
""";

  // FORGOT PASSWORD PAGE
  static const forgotPassword = 'Lupa Password';

  static const forgotTo = 'Sudah punya akun? Login';

  // VERIFY FORGOT PASSWORD PAGE
  static const verifyForgotPass = 'Email Verifikasi';

  static const verifyForgotPassBody =
      'Recovery password telah di kirim ke email anda, silahkan cek email yang terdaftar';

  static const verifyForgotPassBackTo = 'Kembali ke login';

  // VERIFY OTP
  static const verifyOTP = 'Verifikasi OTP';
  static const verifyOTPBody =
      'Masukkan kode verifikasi yang baru saja kami kirimkan melalui SMS ke nomor ';
  static const verifyOTPRetry = 'Kirim Ulang SMS';
  static const verifyOTPFailed = 'Kode otp tidak sesuai';

  // PREFERENSI PAGE
  static const pref = 'Preferensi';
  static const prefTitle = 'Bantu kami memahami anda';

  static const prefTitleLongClinicOperating =
      'Berapa lama klinik anda beroperasi?';

  static const prefTitleRMD = 'Rekam medis digital';
  static const prefSubtitleRMD =
      'Apakah anda tertarik untuk cantumkan rekam medis digital?';

  static const prefTitleStock = 'Stok obat dan pembayaran';
  static const prefSubtitleStock =
      'Apakah anda tertarik untuk mengatur stok obat dan pembayaran secara digital?';

  static const prefTitleNumberVisitors =
      'Berapa banyak kunjungan pasien dalam sebulan?';

  static const prefListLongClinicOperating = [
    '1 - 2 Tahun',
    '2 - 5 Tahun',
    '5 - 10 Tahun',
    'Lebih dari 10 tahun',
    'Masih rencana',
  ];

  static const prefListNumberVisitors = [
    '1 - 2000 Kunjungan',
    '2000 - 5000 Kunjungan',
    '5000 - 10000 Kunjungan',
    'Masih rencana',
  ];

  // INFO FASKES
  static const faskesInfo = 'Info Faskes';

  static const faskesListType = [
    'Klinik Pratama',
    'Klinik Utama',
    'Klinik Gigi',
    'Klinik Kecantikan',
    'Praktek Mandiri',
    'Apotek',
    'Lab',
  ];

  static const fullName = 'Nama Lengkap';
  static const hintFullName = 'Misal Budi Setiawan';
  static const noMR = 'Nomor MR';
  static const hintNoMR = 'Misal 0xxxxxx';
  static const placeBirth = 'Tempat Lahir';
  static const hintPlaceBirth = 'Misal Jakarta';
  static const birthDate = 'Tanggal Lahir';
  static const address = 'Alamat';
  static const hintAddress = 'Misal Jalan Soekarno Hatta';
  static const postalCode = 'Kode Pos';
  static const hintPostalCode = 'Misal xxxxx';

  static const province = 'Provinsi';
  static const regency = 'Kabupaten/Kota';
  static const district = 'Kecamatan';
  static const village = 'Kelurahan';

  static const noPhone = 'No HP';
  static const hintNoPhone = 'Misal 08xxxxxxxxxx';
  static const noKTP = 'No KTP';
  static const hintNoKTP = 'Misal xxxxxxxxxx';

  static const gender = 'Jenis Kelamin';
  static const religion = 'Agama';
  static const marriedStatus = 'Status';
  static const bloodType = 'Golongan Darah';
  static const lastEducation = 'Pendidikan Terakhir';
  static const job = 'Pekerjaan';

  static final dataStatus = [
    StatusModel(
      value: 'succeed',
      color: SharedTheme.successColor,
    ),
    StatusModel(
      value: 'engaged',
      color: Get.theme.colorScheme.primary,
    ),
    StatusModel(
      value: 'confirmed',
      color: Colors.orange,
    ),
    StatusModel(
      value: 'waiting',
      color: Colors.purple,
    ),
    StatusModel(
      value: 'reschedule',
      color: SharedTheme.warningColor,
    ),
    StatusModel(
      value: 'pending',
      color: Get.theme.colorScheme.error,
    ),
    StatusModel(
      value: 'delete',
      color: Get.theme.colorScheme.onSurface,
    ),
  ];

  static const dataActions = [
    'Whatsapp',
    'SMS',
    'Telepon',
    // 'Catatan Perawat',
    // 'Vital Sign',
  ];

  static const dataGender = [
    'Laki-laki',
    'Perempuan',
  ];

  static const dataReligion = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Budha',
    'Konghucu',
    'Lainnya',
    'Tidak tahu',
  ];

  static const dataMarriedStatus = [
    'Menikah',
    'Belum Menikah',
    'Tidak Menikah',
  ];

  static const dataBloodType = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
    'Tidak Tahu',
  ];

  static const dataLastEducation = [
    'SMP dan Sebelumnya',
    'SMA',
    'Diploma (D3)',
    'Sarjana (S1)',
    'Master (S2)',
    'Lainnya',
  ];

  static const dataJob = [
    'Pegawai Negeri',
    'Pegawai Swasta',
    'Wiraswasta',
    'Pelajar',
    'Freelancer',
    'Mengurus Rumah Tangga',
    'Pensiun',
    'Tentara',
    'Kepolisian',
    'Dosen',
    'Guru',
    'Pilot',
    'Pengacara',
    'Notaris',
    'Dokter',
    'Bidan',
    'Perawat',
    'Apoteker',
    'Psikiater/Psikolog',
    'Petani',
    'Nelayan',
    'Lainnya',
    'Tidak Bekerja',
  ];

  static const email = 'Email';
  static const hintEmail = 'Misal test@gmail.com';

  static const doctorName = 'Nama Dokter';
  static const hintDoctorName = 'Misal Dr. John';
  static const str = 'Lembaga Registrasi (STR)';
  static const noSTR = 'Nomor Registrasi (Nomor STR)';
  static const hintNoSTR = 'Misal 12345678';
  static const expireDateSTR = 'Tanggal Expire STR';
  static const sip = 'Lembaga Registrasi (SIP)';
  static const noSIP = 'Nomor Registrasi (Nomor SIP)';
  static const hintNoSIP = 'Misal 12345678';
  static const registDateSIP = 'Tanggal Registrasi SIP';
  static const degreeTitle = 'Gelar';
  static const degree = 'Depan';
  static const lastDegree = 'Belakang';
  static const lastHintDegree = 'Misal S.T.';
  static const medicalJob = 'Job Medis';
  static const specialist = 'Spesialis';
  static const subSpecialist = 'Subspesialis';
  static const estimateConsultTime = 'Estimasi Waktu Konsultasi Per Pasien';
  static const hintEstimateConsultTime = 'Misal 100 ';
  static const practiceScheduleTitle = 'Jadwal Praktik';

  static const titleStart = 'Jam Mulai';
  static const titleEnd = 'Jam Selesai';
  static const hintTime = '--:--';
  static const days = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    "Jum'at",
    'Sabtu',
    'Minggu',
  ];

  static const dataSTR = [
    'Konsil Kedokteran Indonesia',
    'Majelis Tenaga Kesehatan Provinsi',
    'Majelis Tenaga Kesehatan Indonesia',
    'Himpunan Psikologi Indonesia',
    'Ikatan Fisioterapi Indonesia',
    'Perhimpunan Dokter Hewan Indonesia',
    'Ikatan Okupasi Terapi Indonesia',
    'Ikatan Psikologi Klinis Indonesia',
    'Ikatan Sinse Indonesia',
    'Persatuan Perawat Nasional Indonesia (PPNI)',
    'Ikatan Bidan Indonesia (IBI)',
    'Ikatan Apoteker Indonesia (IAI)',
  ];

  static const dataSIP = [
    'Ikatan Dokter Indonesia (IDI)',
    'Persatuan Dokter Gigi Indon;esia (PDGI)',
  ];

  static const dataDegree = [
    'Prof.',
    'dr.',
    'Dr.(H.C.)',
    'drh.',
    'drg.',
    'Dr. med. dent.',
    'Dr. med. vet.',
    'Dr. nat med.',
    'Dr. rer. med.',
    'Dr. rer. medic',
    'Dr. sc. med.',
    'Dr. PH',
    'Dr. pharm.',
    'Dr. scient. med.',
    'Dr. med. dent. et scient. med.'
  ];

  static const dataMedicalJob = [
    'Dokter',
    'Dokter Gigi',
    ' Dokter Hewan',
    'Fisioterapis',
    'Psikolog',
    'Sinshe',
    'Ahli Chiropractic',
    'Okupasi Terapi',
    'Bidan',
  ];

  static const dataSpecialist = [
    'Dokter Umum',
    'Dokter Spesialis Anak',
    'Dokter Spesialis Anestesiologi dan Terapi Intensif',
    'Dokter Spesialis Bedah Umum',
    'Dokter Spesialis Bedah Anak',
    'Dokter Spesialis Bedah Plastik Rekonstruksi dan Estetik',
    'Dokter Spesialis Bedah Syaraf',
    'Dokter Spesialis Bedah Ortopedi dan Traumatologi',
    'Dokter Spesialis Bedah Thorak dan Kardiovaskular',
    'Dokter Spesialis Forensik dan Medikolegal',
  ];

  static const dataSubSpecialist = {
    1: [
      'Perinatologi',
      'Gastro-Hepatologi',
      'Neurologi',
      'Kardiologi',
      'Pulmonologi/Respirologi',
      'Endokrinologi',
      'Hematologi dan Onkologi',
      'Nefrologi',
    ]
  };

  static const String dummy =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  // PENDAFTARAN KUNJUNGAN
  static const dataMethodPayment = [
    'Tunai',
    'BPJS Kesehatan',
    'BPJS Ketenagakerjaan',
    'Asuransi',
    'Perusahaan',
    'Kartu Debit',
    'Kartu Kredit',
    'Lainnya',
  ];

  static const dataVisitType = [
    'Kunjungan Sakit',
    // 'Kunjungan Sehat',
    // 'Perawatan',
  ];

  static const dataServiceType = [
    'Rawat Jalan',
    // 'Rawat Inap',
    // 'Rawat Inap Persalinan'
  ];

  static const dataServiceTypeBody = [
    'Tubuh',
    'Wajah',
  ];

  static const dataPoly = ['Umum'];

  static const dataBeautyPoly = ['Kecantikan'];

  static const dummyDataRoomType = ['Mawar', 'VVIP'];

  static const dummyDataActivity = [
    'Home-Visit',
    'Konseling',
    'Imunisasi (BCG)'
  ];

  static const dummyDataMedicalPersonnel = [
    'drs. Eka Sinta Aprilia',
    'dr. Andrean Ramadhan',
  ];

  // RESEP OBAT
  static const medicineName = 'Nama Obat';
  static const hintMedicineName = 'Masukkan nama obat';

  static const medicineUnit = 'Satuan Obat';

  static const dataMedicineUnit = [
    'Tablet',
    'Pil',
    'Botol',
    'Salep',
    'Kapsul',
  ];

  static const drinkingRules = 'Aturan Minum';
  static const hintdrinkingRules = 'Masukkan aturan minum obat';

  // PROFILE

  // SUBSCRIPTION

  // static const product = [
  //   'Clinica',
  //   'Hemoda',
  //   'Hospita',
  //   'Privata',
  //   'Pharma',
  // ];

  static const duration = [
    '3 Bulan',
    '6 Bulan',
    '1 Tahun',
    '2 Tahun',
    '3 Tahun',
  ];

  static const titleDuration = 'Durasi';
  static const hintDuration = 'Pilih Durasi';
  static const titleModalDuration = 'Pilih Durasi Langganan';

  static const titleVoucher = 'Voucher';
  static const hintVoucher = 'Punya Kode Voucher?';
  static const titleModalVoucher = 'Input Kode Voucher';
}
