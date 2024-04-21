-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Apr 2024 pada 06.41
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `talentern`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `document_syarat`
--

CREATE TABLE `document_syarat` (
  `id_document` char(36) NOT NULL,
  `id_jenismagang` char(36) NOT NULL,
  `namadocument` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen_pendaftaran_magang`
--

CREATE TABLE `dokumen_pendaftaran_magang` (
  `id_doc_pendaftaran` char(36) NOT NULL,
  `id_pendaftaran` char(36) NOT NULL,
  `id_document` char(36) NOT NULL,
  `file` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `nip` int(11) NOT NULL,
  `kode_dosen` char(5) NOT NULL,
  `id_prodi` char(36) NOT NULL,
  `id_univ` char(36) NOT NULL,
  `namadosen` varchar(255) NOT NULL,
  `nohpdosen` varchar(15) NOT NULL,
  `emaildosen` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `email_template`
--

CREATE TABLE `email_template` (
  `id_email_template` char(36) NOT NULL,
  `subject_email` varchar(255) NOT NULL,
  `headline_email` varchar(255) NOT NULL,
  `content_email` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fakultas`
--

CREATE TABLE `fakultas` (
  `id_fakultas` char(36) NOT NULL,
  `namafakultas` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `id_univ` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `fakultas`
--

INSERT INTO `fakultas` (`id_fakultas`, `namafakultas`, `status`, `id_univ`) VALUES
('0c4c6d14-7457-4858-a844-315936e5825c', 'FIT', 1, 'c1bc5845-06fb-49b2-ad1b-fff94f5884ed'),
('6c39f720-58d8-4890-957e-2bcebe562095', 'FIK', 1, 'c1bc5845-06fb-49b2-ad1b-fff94f5884ed'),
('d8c34ec5-a0e4-479f-84a2-67dcc9d7fc7b', 'FEB', 1, '7e724275-a2c6-45cd-876a-0e259bc726fb');

-- --------------------------------------------------------

--
-- Struktur dari tabel `flow`
--

CREATE TABLE `flow` (
  `id_flow` int(11) NOT NULL,
  `prev` int(11) DEFAULT NULL,
  `next` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `industri`
--

CREATE TABLE `industri` (
  `id_industri` char(36) NOT NULL,
  `namaindustri` varchar(255) NOT NULL,
  `notelpon` varchar(15) DEFAULT NULL,
  `alamatindustri` varchar(255) DEFAULT NULL,
  `kategori_industri` varchar(255) DEFAULT NULL,
  `statuskerjasama` varchar(255) DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `email` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `statusapprove` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_magang`
--

CREATE TABLE `jenis_magang` (
  `id_jenismagang` char(36) NOT NULL,
  `namajenis` varchar(255) NOT NULL,
  `durasimagang` varchar(255) DEFAULT NULL,
  `is_review_process` tinyint(1) NOT NULL DEFAULT 0,
  `is_document_upload` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jenis_magang`
--

INSERT INTO `jenis_magang` (`id_jenismagang`, `namajenis`, `durasimagang`, `is_review_process`, `is_document_upload`, `type`, `status`) VALUES
('9ad80e4d-7d08-4f3e-8f59-5beb65ff3cc8', 'industri', '1 Semester', 2, 1, '1', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_categories`
--

CREATE TABLE `job_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_industries`
--

CREATE TABLE `job_industries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `komponen_nilai`
--

CREATE TABLE `komponen_nilai` (
  `id_kompnilai` char(36) NOT NULL,
  `id_jenismagang` char(36) NOT NULL,
  `namakomponen` varchar(255) NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `bobot` int(11) NOT NULL,
  `scoredby` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `total_bobot` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_book_activity`
--

CREATE TABLE `log_book_activity` (
  `id_log` char(36) NOT NULL,
  `id_mhsmagang` char(36) NOT NULL,
  `date` date NOT NULL,
  `activity` varchar(255) NOT NULL,
  `documentation` varchar(255) NOT NULL,
  `approvelap` int(11) NOT NULL,
  `date_approvelap` date NOT NULL,
  `approve_akademik` int(11) NOT NULL,
  `date_approve_akademik` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` char(36) NOT NULL,
  `kota` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `kota`) VALUES
('010bccc8-9daf-11ee-bdcc-70665517fcc8', 'bandung'),
('010c0aea-9daf-11ee-bdcc-70665517fcc8', 'jakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lowongan_magang`
--

CREATE TABLE `lowongan_magang` (
  `id_lowongan` char(36) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `id_jenismagang` char(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `intern_position` varchar(255) NOT NULL,
  `durasimagang` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `requirements` text NOT NULL,
  `id_lokasi` char(36) NOT NULL,
  `kuota` int(11) NOT NULL,
  `benefitmagang` text DEFAULT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `tahapan_seleksi` varchar(255) NOT NULL,
  `date_confirm_closing` date DEFAULT NULL,
  `applicant_status` varchar(255) DEFAULT 'tertunda',
  `paid` tinyint(1) DEFAULT 0,
  `pelaksanaan` varchar(255) DEFAULT NULL,
  `jenjang` varchar(255) NOT NULL,
  `keterampilan` varchar(255) NOT NULL,
  `id_industri` char(36) DEFAULT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT 1,
  `nominal_salary` varchar(255) NOT NULL,
  `prodi` varchar(255) NOT NULL,
  `id_prodi` char(36) DEFAULT NULL,
  `fakultas` varchar(255) NOT NULL,
  `id_fakultas` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lowongan_magang`
--

INSERT INTO `lowongan_magang` (`id_lowongan`, `created_by`, `id_jenismagang`, `created_at`, `intern_position`, `durasimagang`, `deskripsi`, `requirements`, `id_lokasi`, `kuota`, `benefitmagang`, `startdate`, `enddate`, `tahapan_seleksi`, `date_confirm_closing`, `applicant_status`, `paid`, `pelaksanaan`, `jenjang`, `keterampilan`, `id_industri`, `gender`, `nominal_salary`, `prodi`, `id_prodi`, `fakultas`, `id_fakultas`) VALUES
('9bd7c118-fdbd-4470-811f-92732c62299e', NULL, '9ad80e4d-7d08-4f3e-8f59-5beb65ff3cc8', '2024-04-19 06:54:47', 'FrontEnd Developer', '1 Semester', 'membuat tampilan web sesuai request', 'disiplin \r\nbertanggur jawab \r\nrajin', '010c0aea-9daf-11ee-bdcc-70665517fcc8', 5, 'uang saku \r\nuang makan', '2024-04-08', '2024-05-02', '0', NULL, 'tertunda', 1, NULL, 's1', 'PostgreSQL', NULL, 1, '100000000', 'D3 Elektronika', NULL, 'FIT', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(255) NOT NULL,
  `angkatan` int(11) NOT NULL,
  `id_prodi` char(36) DEFAULT NULL,
  `id_univ` char(36) DEFAULT NULL,
  `id_fakultas` char(36) DEFAULT NULL,
  `namamhs` varchar(255) NOT NULL,
  `alamatmhs` varchar(255) NOT NULL,
  `emailmhs` varchar(255) NOT NULL,
  `nohpmhs` varchar(15) NOT NULL,
  `kelas` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `master_majors`
--

CREATE TABLE `master_majors` (
  `master_major_id` bigint(20) UNSIGNED NOT NULL,
  `major` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mhs_magang`
--

CREATE TABLE `mhs_magang` (
  `id_mhsmagang` char(36) NOT NULL,
  `id_pendaftaran` char(36) NOT NULL,
  `nim` int(11) NOT NULL,
  `nip` int(11) NOT NULL,
  `id_pemblap` char(36) NOT NULL,
  `nilai_akhir_magang` int(11) NOT NULL,
  `indeks_nilai_akhir_magang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_06_03_132522_create_job_categories_table', 1),
(5, '2019_08_19_000000_create_failed_jobs_table', 1),
(6, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(7, '2022_09_26_100042_create_job_industries_table', 1),
(8, '2022_11_14_032042_create_master_majors_table', 1),
(9, '2023_10_04_141626_create_pekerjaan_tersimpans_table', 1),
(10, '2023_10_09_062928_create_admins_table', 1),
(11, '2023_10_09_095448_create_universitas_table', 1),
(12, '2023_10_09_101032_create_fakultas_table', 1),
(13, '2023_10_10_024605_create_program_studi_table', 1),
(14, '2023_10_10_030906_create_dosen_table', 1),
(15, '2023_10_10_033904_create_jenis_magang_table', 1),
(16, '2023_10_11_093115_create_tahun_akademik_table', 1),
(17, '2023_10_11_094241_create_mahasiswa_table', 1),
(18, '2023_10_11_094737_create_industri_table', 1),
(19, '2023_10_11_095339_create_pegawai_industri_table', 1),
(20, '2023_10_11_100204_create_nilai_mutu_table', 1),
(21, '2023_10_11_135619_create_komponen_nilai_table', 1),
(22, '2023_10_11_142207_create_document_syarat_table', 1),
(23, '2023_10_11_142705_create_pendaftaran_magang_table', 1),
(24, '2023_10_11_143534_create_lowongan_magang_table', 1),
(25, '2023_10_11_145238_create_mhs_magang_table', 1),
(26, '2023_10_11_150437_create_seleksi_table', 1),
(27, '2023_10_11_150836_create_nilai_pemblap_table', 1),
(28, '2023_10_11_151229_create_log_book_activity_table', 1),
(29, '2023_10_11_152023_create_dokumen_pendaftaran_magang_table', 1),
(30, '2023_10_11_152340_create_selection_schedule_table', 1),
(31, '2023_10_11_152721_create_selection_schedule_student_table', 1),
(32, '2023_10_11_152916_create_nilai_intern_table', 1),
(33, '2023_10_20_071543_create_sessions_table', 1),
(34, '2023_10_24_070645_drop_foreign_in_mhs_magang', 1),
(35, '2023_10_24_071543_change_column_nim_in_mahasiswa', 1),
(36, '2023_10_31_033116_add_is_admin_in_users_table', 1),
(37, '2023_11_03_025508_add_status_to_industri', 2),
(38, '2023_11_03_072110_change_column_statuskerjasma_in_industri', 2),
(39, '2023_11_06_095855_change_tipe_nim_to_string_in_mahasiswa', 2),
(40, '2023_11_06_102837_add_email_to_industri', 2),
(41, '2023_11_06_133616_add_column_to_industri', 3),
(42, '2023_11_07_031020_change_column_to_pendaftaran_magang', 4),
(43, '2023_11_07_033014_change_column_kategori_to_industri', 4),
(44, '2023_11_09_045649_change_column_to_industri', 4),
(45, '2023_11_13_063519_add_column_to_lowongan_magang', 4),
(46, '2023_11_13_064046_create_lokasi_table', 4),
(47, '2023_11_13_065814_create_permission_tables', 4),
(48, '2023_11_13_071457_add_column_to_industri', 4),
(49, '2023_11_16_081438_change_column_total_bobot_to_komponen_nilai', 4),
(50, '2023_11_21_075155_change_durasimagang_in_jenis_magang', 4),
(51, '2023_11_22_092521_change_column_in_seleksi', 4),
(52, '2023_11_22_092640_add_column_in_seleksi', 4),
(53, '2023_11_22_093746_change_column_in_pendaftaran_magang', 4),
(54, '2023_11_23_033152_remove_column_in_pendaftaran_magang', 4),
(55, '2023_11_23_033204_add_column_in_pendaftaran_magang', 5),
(56, '2023_11_23_034524_change_column_in_lowongan_magang', 5),
(57, '2023_11_23_034531_remove_column_in_lowongan_magang', 5),
(58, '2023_11_23_071535_add_column_in_lowongan_magang', 6),
(59, '2023_11_28_035511_change_column_id_lokasi_in_lowongan_magang', 6),
(60, '2023_11_28_035939_create_status_table', 6),
(61, '2023_11_28_040012_create_flow_table', 6),
(62, '2023_11_29_071213_add_column_statusapprove_in_industri', 7),
(63, '2023_11_29_080342_add_column_in_users_table', 7),
(64, '2023_11_29_080436_add_column_in_users_table', 7),
(65, '2023_12_04_043851_change_column_date_confirm_in_lowongan_magang', 7),
(66, '2023_12_06_094807_change_column_id_mahasiswa_in_users_table', 7),
(67, '2023_12_13_072540_change_column_id_industri_in_users_table', 7),
(68, '2023_12_14_034508_change_column_created_by_in_lowongan_magang', 7),
(69, '2023_12_14_035658_rename_column_id_mahasiswa_in_users_table', 8),
(70, '2023_12_16_104917_add_columns_to_lowongan_magang', 8),
(71, '2023_12_16_105617_create_email_template_table', 8),
(72, '2023_12_16_110103_create_status_seleksi_table', 8),
(73, '2023_12_16_110531_create_seleksi_lowongan_table', 8),
(74, '2023_12_17_081556_drop_columns_in_lowongan_magang', 9),
(75, '2023_12_17_170843_drop_id_year_akademik_in_lowongan_magang', 10),
(76, '2023_12_18_134327_drop_id_prodi_in_lowongan_magang', 11),
(77, '2023_12_18_135335_drop_keilmuan_in_lowongan_magang', 12),
(78, '2023_12_18_031240_add_id_industri_in_lowongan_magang', 13),
(79, '2023_12_18_131429_add_column_status_in_email_template', 13),
(80, '2023_12_19_042327_rename_column_id_email_tamplate_in_email_template_table', 13),
(81, '2024_04_07_143018_add_gender_to_lowongan_magang', 14),
(82, '2024_04_07_144157_add_nominal_salary_to_lowongan_magang', 15),
(83, '2024_04_08_032429_change_durasi_magang_in_lowongan_magang', 16),
(84, '2024_04_08_034007_add_column_to_lowongan_magang', 17),
(85, '2024_04_17_025316_change_pelaksanaan_in_lowongan_magang', 18),
(86, '2024_04_17_123659_add_id_lowongan_in_seleksi', 19),
(87, '2024_04_17_150449_add_columns_in_seleksi', 20),
(88, '2024_04_19_014808_remove_column_in_seleksi', 21),
(89, '2024_04_19_015858_remove_column_in_status_seleksi', 22),
(90, '2024_04_19_020148_remove_column_in_seleksi', 23),
(91, '2024_04_19_020320_remove_column_in_seleksi', 24);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` char(36) NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` char(36) NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
('9abbea0b-e3ee-40ce-a5df-28149e740b59', 'App\\Models\\User', 1),
('9abbea0c-27ff-43be-9ac3-ee227cccc801', 'App\\Models\\User', 2),
('9abbea0c-40d4-4a4a-a7e6-e9a61421ce9b', 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_intern`
--

CREATE TABLE `nilai_intern` (
  `id_nilai_intern` char(36) NOT NULL,
  `id_nilai` char(36) NOT NULL,
  `id_kompnilai` char(36) NOT NULL,
  `nilai` int(11) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `id_mhsmagang` char(36) NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `nilaiadjust` int(11) NOT NULL,
  `tgladjust` date NOT NULL,
  `alasanadjust` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_mutu`
--

CREATE TABLE `nilai_mutu` (
  `id_nilai` char(36) NOT NULL,
  `nilaimin` varchar(5) NOT NULL,
  `nilaimax` varchar(5) NOT NULL,
  `nilaimutu` varchar(5) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai_pemblap`
--

CREATE TABLE `nilai_pemblap` (
  `id_nilai` char(36) NOT NULL,
  `id_mhsmagang` char(36) NOT NULL,
  `id_kompnilai` char(36) NOT NULL,
  `nilai` int(11) NOT NULL,
  `oleh` varchar(255) NOT NULL,
  `dateinputnilai` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai_industri`
--

CREATE TABLE `pegawai_industri` (
  `id_peg_industri` char(36) NOT NULL,
  `id_industri` char(36) NOT NULL,
  `namapeg` varchar(255) NOT NULL,
  `nohppeg` varchar(255) NOT NULL,
  `emailpeg` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `statuspeg` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pekerjaan_tersimpans`
--

CREATE TABLE `pekerjaan_tersimpans` (
  `id` char(36) NOT NULL,
  `job_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran_magang`
--

CREATE TABLE `pendaftaran_magang` (
  `id_pendaftaran` char(36) NOT NULL,
  `id_lowongan` char(36) NOT NULL,
  `applicant_status` varchar(255) NOT NULL DEFAULT 'blm',
  `id_year_akademik` char(36) NOT NULL,
  `approval` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `nim` varchar(255) NOT NULL,
  `tanggaldaftar` timestamp NULL DEFAULT NULL,
  `approvetime` timestamp NULL DEFAULT NULL,
  `approved_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`uuid`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
('9abbea0e-626b-46d3-b94e-16a0a17e371a', 'only.lkm', 'web', '2023-11-29 21:32:43', '2023-11-29 21:32:43'),
('9abbea0e-9301-4b4a-9421-7401ee382b9d', 'slidebar.lkm', 'web', '2023-11-29 21:32:43', '2023-11-29 21:32:43'),
('9abbea0f-d735-4fe4-83cd-4c80efe448f9', 'create.mahasiswa', 'web', '2023-11-29 21:32:44', '2023-11-29 21:32:44'),
('9abbea10-77db-49b0-a200-f90759889091', 'create.industri', 'web', '2023-11-29 21:32:45', '2023-11-29 21:32:45'),
('9abbea11-292d-45b9-98ac-d97a2659162c', 'view.industri', 'web', '2023-11-29 21:32:45', '2023-11-29 21:32:45'),
('9abbea11-5163-4255-a16b-65ed427a2394', 'edit.industri', 'web', '2023-11-29 21:32:45', '2023-11-29 21:32:45'),
('9abbea11-708b-4fa8-a925-21d3b7007a15', 'status.industri', 'web', '2023-11-29 21:32:45', '2023-11-29 21:32:45'),
('9abbea11-9816-4f0f-abe7-787871a02e4c', 'view.fakultas', 'web', '2023-11-29 21:32:45', '2023-11-29 21:32:45'),
('9abbea11-e636-4614-9974-a36e269acacb', 'edit.fakultas', 'web', '2023-11-29 21:32:46', '2023-11-29 21:32:46'),
('9abbea12-0afd-4c8d-ab45-d8bd2573df84', 'status.fakultas', 'web', '2023-11-29 21:32:46', '2023-11-29 21:32:46'),
('9abbea12-51cc-45b8-afb4-028cb1d25940', 'create.fakultas', 'web', '2023-11-29 21:32:46', '2023-11-29 21:32:46'),
('9abbea12-7bbc-41c3-8e7e-9995bac7e73c', 'table.informasi.admin', 'web', '2023-11-29 21:32:46', '2023-11-29 21:32:46'),
('9abbea12-be9a-40fd-ad46-589cfc7c067b', 'edit.status.candidate', 'web', '2023-11-29 21:32:46', '2023-11-29 21:32:46'),
('9abbea12-df28-4e79-aa61-34f7357c3a10', 'chekbox.tabel', 'web', '2023-11-29 21:32:46', '2023-11-29 21:32:46'),
('9abbea13-0a8c-4d1d-9bd9-65dafa6375a0', 'information.title', 'web', '2023-11-29 21:32:46', '2023-11-29 21:32:46'),
('9abbea13-1d1b-4cae-adbf-0ee0f7264b62', 'edit.actions', 'web', '2023-11-29 21:32:46', '2023-11-29 21:32:46'),
('9abbea13-3fdd-479d-aa9b-d04bd155ef0f', 'agree.and.reject.buttons', 'web', '2023-11-29 21:32:46', '2023-11-29 21:32:46'),
('9abbea13-9dd0-478f-bbeb-cea9470a880d', 'approval.page', 'web', '2023-11-29 21:32:47', '2023-11-29 21:32:47'),
('9abbea13-ca55-4381-82aa-ebe9358bbccc', 'can.view.data.table', 'web', '2023-11-29 21:32:47', '2023-11-29 21:32:47'),
('9abbea13-f1c6-492f-8f3b-4b4999ce4209', 'slidebar.mitra', 'web', '2023-11-29 21:32:47', '2023-11-29 21:32:47'),
('9abbea14-1a74-4b16-9051-acccaa44c84c', 'information.vacancies', 'web', '2023-11-29 21:32:47', '2023-11-29 21:32:47'),
('9abbea14-4a03-44f1-b522-1e27cbbb5f7d', 'confirmation.limit', 'web', '2023-11-29 21:32:47', '2023-11-29 21:32:47'),
('9abbea14-d1a7-4c21-9d56-7fb62dc843e8', 'tab.title', 'web', '2023-11-29 21:32:47', '2023-11-29 21:32:47'),
('9abbea15-3bfa-4b9f-b250-6c9a9b4ba9da', 'button.submit.improvement', 'web', '2023-11-29 21:32:48', '2023-11-29 21:32:48'),
('9abbea15-564c-4b7d-a6eb-9a1c4d670582', 'create.data', 'web', '2023-11-29 21:32:48', '2023-11-29 21:32:48'),
('9abbea15-75ae-4647-9431-9d1fc6adfbf0', 'edit.data.table', 'web', '2023-11-29 21:32:48', '2023-11-29 21:32:48'),
('9abbea15-9c99-4b6f-8c2f-b27e7ed3476c', 'delete.data.table', 'web', '2023-11-29 21:32:48', '2023-11-29 21:32:48'),
('9abbea15-f6c3-4162-8195-950b1ff0dde7', 'button.tnglbts.mitra', 'web', '2023-11-29 21:32:48', '2023-11-29 21:32:48');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `program_studi`
--

CREATE TABLE `program_studi` (
  `id_prodi` char(36) NOT NULL,
  `id_fakultas` char(36) NOT NULL,
  `namaprodi` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `id_univ` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `program_studi`
--

INSERT INTO `program_studi` (`id_prodi`, `id_fakultas`, `namaprodi`, `status`, `id_univ`) VALUES
('9bd788aa-7424-4ae3-b451-8be82c7c9051', '6c39f720-58d8-4890-957e-2bcebe562095', 'D3 Elektronika', 1, 'c1bc5845-06fb-49b2-ad1b-fff94f5884ed'),
('9bd788ce-bd68-48ff-b1ec-d7ebd8df09da', 'd8c34ec5-a0e4-479f-84a2-67dcc9d7fc7b', 'D3 Informatika', 1, '7e724275-a2c6-45cd-876a-0e259bc726fb'),
('ad54a912-e4bf-4560-8bfe-22d24ee5360d', 'd8c34ec5-a0e4-479f-84a2-67dcc9d7fc7b', 'D3 Sistem Informasi', 1, '7e724275-a2c6-45cd-876a-0e259bc726fb'),
('e9129bed-7dbc-4480-a041-05534b4d32f4', '6c39f720-58d8-4890-957e-2bcebe562095', 'D3 RPL', 1, 'c1bc5845-06fb-49b2-ad1b-fff94f5884ed');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`uuid`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
('9abbea0b-e3ee-40ce-a5df-28149e740b59', 'superadmin', 'web', '2023-11-29 21:32:42', '2023-11-29 21:32:42'),
('9abbea0c-27ff-43be-9ac3-ee227cccc801', 'admin', 'web', '2023-11-29 21:32:42', '2023-11-29 21:32:42'),
('9abbea0c-40d4-4a4a-a7e6-e9a61421ce9b', 'user', 'web', '2023-11-29 21:32:42', '2023-11-29 21:32:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` char(36) NOT NULL,
  `role_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
('9abbea0e-626b-46d3-b94e-16a0a17e371a', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea0e-9301-4b4a-9421-7401ee382b9d', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea0f-d735-4fe4-83cd-4c80efe448f9', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea10-77db-49b0-a200-f90759889091', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea11-292d-45b9-98ac-d97a2659162c', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea11-5163-4255-a16b-65ed427a2394', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea11-708b-4fa8-a925-21d3b7007a15', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea11-9816-4f0f-abe7-787871a02e4c', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea11-e636-4614-9974-a36e269acacb', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea12-0afd-4c8d-ab45-d8bd2573df84', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea12-51cc-45b8-afb4-028cb1d25940', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea12-7bbc-41c3-8e7e-9995bac7e73c', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea12-be9a-40fd-ad46-589cfc7c067b', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea12-be9a-40fd-ad46-589cfc7c067b', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea12-df28-4e79-aa61-34f7357c3a10', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea12-df28-4e79-aa61-34f7357c3a10', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea13-0a8c-4d1d-9bd9-65dafa6375a0', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea13-0a8c-4d1d-9bd9-65dafa6375a0', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea13-1d1b-4cae-adbf-0ee0f7264b62', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea13-3fdd-479d-aa9b-d04bd155ef0f', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea13-3fdd-479d-aa9b-d04bd155ef0f', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea13-9dd0-478f-bbeb-cea9470a880d', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea13-9dd0-478f-bbeb-cea9470a880d', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea13-ca55-4381-82aa-ebe9358bbccc', '9abbea0b-e3ee-40ce-a5df-28149e740b59'),
('9abbea13-f1c6-492f-8f3b-4b4999ce4209', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea14-1a74-4b16-9051-acccaa44c84c', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea14-4a03-44f1-b522-1e27cbbb5f7d', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea14-d1a7-4c21-9d56-7fb62dc843e8', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea15-3bfa-4b9f-b250-6c9a9b4ba9da', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea15-564c-4b7d-a6eb-9a1c4d670582', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea15-75ae-4647-9431-9d1fc6adfbf0', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea15-9c99-4b6f-8c2f-b27e7ed3476c', '9abbea0c-27ff-43be-9ac3-ee227cccc801'),
('9abbea15-f6c3-4162-8195-950b1ff0dde7', '9abbea0c-27ff-43be-9ac3-ee227cccc801');

-- --------------------------------------------------------

--
-- Struktur dari tabel `selection_schedule`
--

CREATE TABLE `selection_schedule` (
  `id_schedule` char(36) NOT NULL,
  `id_lowongan` char(36) NOT NULL,
  `schedule_date` date NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `selection_schedule_student`
--

CREATE TABLE `selection_schedule_student` (
  `id_schedule_student` char(36) NOT NULL,
  `id_schedule` char(36) NOT NULL,
  `nim` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `seleksi`
--

CREATE TABLE `seleksi` (
  `id_seleksi` char(36) NOT NULL,
  `statusseleksi` tinyint(1) NOT NULL DEFAULT 0,
  `pelaksanaan` tinyint(1) NOT NULL DEFAULT 1,
  `detail` text DEFAULT NULL,
  `id_lowongan` char(36) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `seleksi`
--

INSERT INTO `seleksi` (`id_seleksi`, `statusseleksi`, `pelaksanaan`, `detail`, `id_lowongan`, `tgl_mulai`, `tgl_akhir`, `deskripsi`) VALUES
('9bd7c1a0-bc15-4629-a1b8-c968b9ef6e4c', 0, 1, NULL, '9bd7c118-fdbd-4470-811f-92732c62299e', '2024-04-11', '2024-04-30', 'nmdbfnms'),
('9bd7c1a0-c18d-450d-a3f7-e6436cac7d96', 0, 1, NULL, '9bd7c118-fdbd-4470-811f-92732c62299e', '2024-04-10', '2024-04-22', 'sdhhja'),
('9bd7c1a0-f655-40eb-ad39-771fedd1986a', 0, 1, NULL, '9bd7c118-fdbd-4470-811f-92732c62299e', '2024-04-09', '2024-04-25', 'sfags');

-- --------------------------------------------------------

--
-- Struktur dari tabel `seleksi_lowongan`
--

CREATE TABLE `seleksi_lowongan` (
  `id_seleksi_lowongan` char(36) NOT NULL,
  `id_email_tamplate` char(36) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `no_tahapan` int(11) NOT NULL DEFAULT 1,
  `namatahap_seleksi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `cat` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_seleksi`
--

CREATE TABLE `status_seleksi` (
  `id_status_seleksi` char(36) NOT NULL,
  `id_pendaftaran` char(36) NOT NULL,
  `status_seleksi` tinyint(1) NOT NULL DEFAULT 0,
  `waktu_seleksi` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_akademik`
--

CREATE TABLE `tahun_akademik` (
  `id_year_akademik` char(36) NOT NULL,
  `semester` varchar(255) NOT NULL,
  `tahun` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `universitas`
--

CREATE TABLE `universitas` (
  `id_univ` char(36) NOT NULL,
  `namauniv` varchar(255) NOT NULL,
  `jalan` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `universitas`
--

INSERT INTO `universitas` (`id_univ`, `namauniv`, `jalan`, `kota`, `telp`, `status`) VALUES
('7e724275-a2c6-45cd-876a-0e259bc726fb', 'Telyu', 'jln.telokmunikasi', 'bandung', '0987654', 1),
('c1bc5845-06fb-49b2-ad1b-fff94f5884ed', 'Telkom University', 'jln.telokmunikasi', 'bandung', '098765432', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isAdmin` int(11) DEFAULT NULL,
  `nim` char(36) DEFAULT NULL,
  `id_industri` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `isAdmin`, `nim`, `id_industri`) VALUES
(1, 'Super Admin Role', 'SuperAdmin', 'superadmin@demo.test', NULL, '$2y$10$rDv9nIKSkpPuI4RwPiwSLeC3SAt4DO6mfobIu1ONBeEMLk2HrHxwG', NULL, '2023-11-29 21:32:42', '2023-11-29 21:32:42', 0, NULL, NULL),
(2, 'Admin Role', 'Admin', 'admin@role.test', NULL, '$2y$10$7Zg3mgrZciFsyDDWhx3HPOYTMyweCUjKr5xdANmq9/1fD1fCsE./W', NULL, '2023-11-29 21:32:43', '2023-11-29 21:32:43', 1, NULL, NULL),
(3, 'User Role', 'User', 'user@role.test', NULL, '$2y$10$m/1RtfYItyxHSXgsF6aayeV8vIWHtL0RiIw/03e/lRjZboZ0pxBQy', NULL, '2023-11-29 21:32:43', '2023-11-29 21:32:43', 2, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indeks untuk tabel `document_syarat`
--
ALTER TABLE `document_syarat`
  ADD PRIMARY KEY (`id_document`),
  ADD KEY `document_syarat_id_jenismagang_foreign` (`id_jenismagang`);

--
-- Indeks untuk tabel `dokumen_pendaftaran_magang`
--
ALTER TABLE `dokumen_pendaftaran_magang`
  ADD PRIMARY KEY (`id_doc_pendaftaran`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `dosen_id_prodi_foreign` (`id_prodi`),
  ADD KEY `dosen_id_univ_foreign` (`id_univ`);

--
-- Indeks untuk tabel `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id_email_template`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`id_fakultas`),
  ADD KEY `fakultas_id_univ_foreign` (`id_univ`);

--
-- Indeks untuk tabel `flow`
--
ALTER TABLE `flow`
  ADD PRIMARY KEY (`id_flow`),
  ADD KEY `flow_next_foreign` (`next`);

--
-- Indeks untuk tabel `industri`
--
ALTER TABLE `industri`
  ADD PRIMARY KEY (`id_industri`);

--
-- Indeks untuk tabel `jenis_magang`
--
ALTER TABLE `jenis_magang`
  ADD PRIMARY KEY (`id_jenismagang`);

--
-- Indeks untuk tabel `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `job_industries`
--
ALTER TABLE `job_industries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_industries_name_unique` (`name`);

--
-- Indeks untuk tabel `komponen_nilai`
--
ALTER TABLE `komponen_nilai`
  ADD PRIMARY KEY (`id_kompnilai`),
  ADD KEY `komponen_nilai_id_jenismagang_foreign` (`id_jenismagang`);

--
-- Indeks untuk tabel `log_book_activity`
--
ALTER TABLE `log_book_activity`
  ADD PRIMARY KEY (`id_log`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indeks untuk tabel `lowongan_magang`
--
ALTER TABLE `lowongan_magang`
  ADD PRIMARY KEY (`id_lowongan`),
  ADD KEY `lowongan_magang_id_jenismagang_foreign` (`id_jenismagang`),
  ADD KEY `lowongan_magang_id_lokasi_foreign` (`id_lokasi`),
  ADD KEY `lowongan_magang_id_industri_foreign` (`id_industri`),
  ADD KEY `lowongan_magang_id_prodi_foreign` (`id_prodi`),
  ADD KEY `lowongan_magang_id_fakultas_foreign` (`id_fakultas`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `mahasiswa_id_prodi_foreign` (`id_prodi`),
  ADD KEY `mahasiswa_id_univ_foreign` (`id_univ`),
  ADD KEY `mahasiswa_id_fakultas_foreign` (`id_fakultas`);

--
-- Indeks untuk tabel `master_majors`
--
ALTER TABLE `master_majors`
  ADD PRIMARY KEY (`master_major_id`);

--
-- Indeks untuk tabel `mhs_magang`
--
ALTER TABLE `mhs_magang`
  ADD PRIMARY KEY (`id_mhsmagang`),
  ADD KEY `mhs_magang_id_pendaftaran_foreign` (`id_pendaftaran`),
  ADD KEY `mhs_magang_nim_foreign` (`nim`),
  ADD KEY `mhs_magang_nip_foreign` (`nip`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `nilai_intern`
--
ALTER TABLE `nilai_intern`
  ADD PRIMARY KEY (`id_nilai_intern`);

--
-- Indeks untuk tabel `nilai_mutu`
--
ALTER TABLE `nilai_mutu`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `nilai_pemblap`
--
ALTER TABLE `nilai_pemblap`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `pegawai_industri`
--
ALTER TABLE `pegawai_industri`
  ADD PRIMARY KEY (`id_peg_industri`),
  ADD KEY `pegawai_industri_id_industri_foreign` (`id_industri`);

--
-- Indeks untuk tabel `pekerjaan_tersimpans`
--
ALTER TABLE `pekerjaan_tersimpans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pendaftaran_magang`
--
ALTER TABLE `pendaftaran_magang`
  ADD PRIMARY KEY (`id_pendaftaran`),
  ADD KEY `pendaftaran_magang_nim_foreign` (`nim`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`id_prodi`),
  ADD KEY `program_studi_id_univ_foreign` (`id_univ`),
  ADD KEY `program_studi_id_fakultas_foreign` (`id_fakultas`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `selection_schedule`
--
ALTER TABLE `selection_schedule`
  ADD PRIMARY KEY (`id_schedule`);

--
-- Indeks untuk tabel `selection_schedule_student`
--
ALTER TABLE `selection_schedule_student`
  ADD PRIMARY KEY (`id_schedule_student`);

--
-- Indeks untuk tabel `seleksi`
--
ALTER TABLE `seleksi`
  ADD PRIMARY KEY (`id_seleksi`),
  ADD KEY `seleksi_id_lowongan_foreign` (`id_lowongan`);

--
-- Indeks untuk tabel `seleksi_lowongan`
--
ALTER TABLE `seleksi_lowongan`
  ADD PRIMARY KEY (`id_seleksi_lowongan`),
  ADD KEY `seleksi_lowongan_id_email_tamplate_foreign` (`id_email_tamplate`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indeks untuk tabel `status_seleksi`
--
ALTER TABLE `status_seleksi`
  ADD PRIMARY KEY (`id_status_seleksi`),
  ADD KEY `status_seleksi_id_pendaftaran_foreign` (`id_pendaftaran`);

--
-- Indeks untuk tabel `tahun_akademik`
--
ALTER TABLE `tahun_akademik`
  ADD PRIMARY KEY (`id_year_akademik`);

--
-- Indeks untuk tabel `universitas`
--
ALTER TABLE `universitas`
  ADD PRIMARY KEY (`id_univ`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_id_industri_foreign` (`id_industri`),
  ADD KEY `users_nim_foreign` (`nim`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `job_industries`
--
ALTER TABLE `job_industries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `master_majors`
--
ALTER TABLE `master_majors`
  MODIFY `master_major_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `document_syarat`
--
ALTER TABLE `document_syarat`
  ADD CONSTRAINT `document_syarat_id_jenismagang_foreign` FOREIGN KEY (`id_jenismagang`) REFERENCES `jenis_magang` (`id_jenismagang`);

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `program_studi` (`id_prodi`),
  ADD CONSTRAINT `dosen_id_univ_foreign` FOREIGN KEY (`id_univ`) REFERENCES `universitas` (`id_univ`);

--
-- Ketidakleluasaan untuk tabel `fakultas`
--
ALTER TABLE `fakultas`
  ADD CONSTRAINT `fakultas_id_univ_foreign` FOREIGN KEY (`id_univ`) REFERENCES `universitas` (`id_univ`);

--
-- Ketidakleluasaan untuk tabel `flow`
--
ALTER TABLE `flow`
  ADD CONSTRAINT `flow_next_foreign` FOREIGN KEY (`next`) REFERENCES `status` (`id_status`);

--
-- Ketidakleluasaan untuk tabel `komponen_nilai`
--
ALTER TABLE `komponen_nilai`
  ADD CONSTRAINT `komponen_nilai_id_jenismagang_foreign` FOREIGN KEY (`id_jenismagang`) REFERENCES `jenis_magang` (`id_jenismagang`);

--
-- Ketidakleluasaan untuk tabel `lowongan_magang`
--
ALTER TABLE `lowongan_magang`
  ADD CONSTRAINT `lowongan_magang_id_fakultas_foreign` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id_fakultas`),
  ADD CONSTRAINT `lowongan_magang_id_industri_foreign` FOREIGN KEY (`id_industri`) REFERENCES `industri` (`id_industri`),
  ADD CONSTRAINT `lowongan_magang_id_jenismagang_foreign` FOREIGN KEY (`id_jenismagang`) REFERENCES `jenis_magang` (`id_jenismagang`),
  ADD CONSTRAINT `lowongan_magang_id_lokasi_foreign` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id_lokasi`),
  ADD CONSTRAINT `lowongan_magang_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `program_studi` (`id_prodi`);

--
-- Ketidakleluasaan untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD CONSTRAINT `mahasiswa_id_fakultas_foreign` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id_fakultas`),
  ADD CONSTRAINT `mahasiswa_id_prodi_foreign` FOREIGN KEY (`id_prodi`) REFERENCES `program_studi` (`id_prodi`),
  ADD CONSTRAINT `mahasiswa_id_univ_foreign` FOREIGN KEY (`id_univ`) REFERENCES `universitas` (`id_univ`);

--
-- Ketidakleluasaan untuk tabel `mhs_magang`
--
ALTER TABLE `mhs_magang`
  ADD CONSTRAINT `mhs_magang_id_pendaftaran_foreign` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran_magang` (`id_pendaftaran`),
  ADD CONSTRAINT `mhs_magang_nip_foreign` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`);

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`uuid`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`uuid`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pegawai_industri`
--
ALTER TABLE `pegawai_industri`
  ADD CONSTRAINT `pegawai_industri_id_industri_foreign` FOREIGN KEY (`id_industri`) REFERENCES `industri` (`id_industri`);

--
-- Ketidakleluasaan untuk tabel `pendaftaran_magang`
--
ALTER TABLE `pendaftaran_magang`
  ADD CONSTRAINT `pendaftaran_magang_nim_foreign` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);

--
-- Ketidakleluasaan untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  ADD CONSTRAINT `program_studi_id_fakultas_foreign` FOREIGN KEY (`id_fakultas`) REFERENCES `fakultas` (`id_fakultas`),
  ADD CONSTRAINT `program_studi_id_univ_foreign` FOREIGN KEY (`id_univ`) REFERENCES `universitas` (`id_univ`);

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`uuid`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`uuid`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `seleksi`
--
ALTER TABLE `seleksi`
  ADD CONSTRAINT `seleksi_id_lowongan_foreign` FOREIGN KEY (`id_lowongan`) REFERENCES `lowongan_magang` (`id_lowongan`);

--
-- Ketidakleluasaan untuk tabel `seleksi_lowongan`
--
ALTER TABLE `seleksi_lowongan`
  ADD CONSTRAINT `seleksi_lowongan_id_email_tamplate_foreign` FOREIGN KEY (`id_email_tamplate`) REFERENCES `email_template` (`id_email_template`);

--
-- Ketidakleluasaan untuk tabel `status_seleksi`
--
ALTER TABLE `status_seleksi`
  ADD CONSTRAINT `status_seleksi_id_pendaftaran_foreign` FOREIGN KEY (`id_pendaftaran`) REFERENCES `pendaftaran_magang` (`id_pendaftaran`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_industri_foreign` FOREIGN KEY (`id_industri`) REFERENCES `industri` (`id_industri`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_id_mahasiswa_foreign` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_nim_foreign` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
