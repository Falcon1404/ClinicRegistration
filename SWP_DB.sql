BEGIN
	CREATE DATABASE SWP;
END;

USE SWP
GO

/*==============================================================*/
/* Table: Lekarz                                                */
/*==============================================================*/
create table Lekarz (
   ID             int                  not null,
   Imie          varchar(30)          not null,
   Nazwisko       varchar(50)          not null,
   constraint PK_LEKARZ primary key (ID)
)
go

/*==============================================================*/
/* Table: Pacjent                                               */
/*==============================================================*/
create table Pacjent (
   PESEL                char(11)             not null,
   Imie                 varchar(30)          not null,
   Nazwisko             varchar(50)          not null,
   Telefon              varchar(20)          not null,
   constraint PK_PACJENT primary key (PESEL)
)
go

/*==============================================================*/
/* Table: Specjalnosc                                           */
/*==============================================================*/
create table Specjalnosc (
   ID        int                  not null,
   Nazwa    varchar(255)         not null,
   constraint PK_SPECJALNOSC primary key (ID)
)
go

/*==============================================================*/
/* Table: Wizyta                                                */
/*==============================================================*/
create table Wizyta (
   IDLekarz             int                  not null,
   IDSpecjalnosc        int                  not null,
   PESEL                char(11)             not null,
   Data                 datetime             not null,
   Godzina              datetime             not null,
   CzyWizytaOdbyta      bit                  not null default 0, -- bit to odpowiednik booleana, wartoœci: 0/1
   CzyRezerwacja		bit				     not null default 0,
   constraint PK_WIZYTA primary key (IDLekarz, IDSpecjalnosc, PESEL)
)
go

alter table Wizyta
   add constraint FK_WIZYTA_LEKARZ foreign key (IDLekarz)
      references Lekarz (ID)
go

alter table Wizyta
   add constraint FK_WIZYTA_SPECJALNOSC foreign key (IDSpecjalnosc)
      references Specjalnosc (ID)
go

alter table Wizyta
   add constraint FK_WIZYTA_PACJENT foreign key (PESEL)
      references Pacjent (PESEL)
go