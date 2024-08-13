/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     3/12/2024 12:56:37 AM                        */
/*==============================================================*/


drop table if exists ABSENSI;

drop table if exists GURU;

drop table if exists JADWAL;

drop table if exists MTPELAJARAN;

drop table if exists SISWA;

/*==============================================================*/
/* Table: ABSENSI                                               */
/*==============================================================*/
create table ABSENSI
(
   ID_ABSENSI           varchar(10) not null,
   ID_PEL               varchar(10),
   NISN                 varchar(10),
   KELASA               varchar(10),
   STATUS               varchar(20),
   TGL                  date,
   KET                  varchar(50),
   MATERIPEL            varchar(50),
   CATATANPEL           varchar(50),
   MTPELAJARAN          varchar(30),
   primary key (ID_ABSENSI)
);

/*==============================================================*/
/* Table: GURU                                                  */
/*==============================================================*/
create table GURU
(
   ID_GURU              varchar(10) not null,
   ID_ABSENSI           varchar(10),
   NUPTK                varchar(15),
   NIY                  varchar(15),
   NAMA_GURU            varchar(50),
   TTL_GURU             varchar(50),
   ALAMAT_GURU          varchar(50),
   NO_TELP              varchar(20),
   USERNAME             varchar(20),
   PASSWORD             varchar(20),
   primary key (ID_GURU)
);

/*==============================================================*/
/* Table: JADWAL                                                */
/*==============================================================*/
create table JADWAL
(
   ID_JADWAL            varchar(10) not null,
   ID_GURU              varchar(10),
   ID_PEL               varchar(10),
   HARI                 varchar(10),
   JAM_MULAI            time,
   JAM_SELESAI          time,
   KELAS_MENGAJAR       varchar(10),
   primary key (ID_JADWAL)
);

/*==============================================================*/
/* Table: MTPELAJARAN                                           */
/*==============================================================*/
create table MTPELAJARAN
(
   ID_PEL               varchar(10) not null,
   NM_PELAJARAN         varchar(20),
   primary key (ID_PEL)
);

/*==============================================================*/
/* Table: SISWA                                                 */
/*==============================================================*/
create table SISWA
(
   NISN                 varchar(10) not null,
   NO_ABSEN             varchar(10),
   NAMA_LENGKAP         varchar(50),
   JK                   varchar(1),
   NIK                  varchar(10),
   TTL                  varchar(100),
   AGAMA                varchar(10),
   ALAMAT               varchar(100),
   KELURAHAN_DESA       varchar(50),
   KECAMATAN            varchar(50),
   KODDE_POS            varchar(10),
   JENIS_TINGGAL        varchar(10),
   TLPN                 varchar(20),
   ALAT_TRANSPORRTASI   varchar(20),
   SEKOLAH_ASAL         varchar(50),
   JML_DANEM            int,
   NAMA_SAUDARA         varchar(50),
   KELAS                varchar(10),
   primary key (NISN)
);

alter table ABSENSI add constraint FK_MEMILIKI foreign key (NISN)
      references SISWA (NISN) on delete restrict on update restrict;

alter table ABSENSI add constraint FK_MEMILIKI2 foreign key (ID_PEL)
      references MTPELAJARAN (ID_PEL) on delete restrict on update restrict;

alter table GURU add constraint FK_MEMILIKI3 foreign key (ID_ABSENSI)
      references ABSENSI (ID_ABSENSI) on delete restrict on update restrict;

alter table JADWAL add constraint FK_MEMILIKI4 foreign key (ID_GURU)
      references GURU (ID_GURU) on delete restrict on update restrict;

alter table JADWAL add constraint FK_TERDIRI_DARI foreign key (ID_PEL)
      references MTPELAJARAN (ID_PEL) on delete restrict on update restrict;

