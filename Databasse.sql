/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     12/12/2022 05:07:37                          */
/*==============================================================*/


alter table ACAO
   drop constraint FK_ACAO_ACAO_UTILIZAD;

alter table ACAO
   drop constraint FK_ACAO_ACAO2_REGISTO;

alter table ALUNO
   drop constraint FK_ALUNO_INHERITAN_UTILIZAD;

alter table ATRIBUIDO
   drop constraint FK_ATRIBUID_ATRIBUIDO_FUNCIONA;

alter table ATRIBUIDO
   drop constraint FK_ATRIBUID_ATRIBUIDO_SERVICO;

alter table AULA
   drop constraint FK_AULA_DA_PROFESSO;

alter table AULA
   drop constraint FK_AULA_LOCALIZA__SALA;

alter table AVALIACAO_ESCRITA
   drop constraint FK_AVALIACA_AGENDA_DISCIPLI;

alter table DISCIPLINA
   drop constraint FK_DISCIPLI_POSSUI_CURSO;

alter table DISCIPLINA
   drop constraint FK_DISCIPLI_RESPONSAV_PROFESSO;

alter table FAZER
   drop constraint FK_FAZER_FAZ_ALUNO;

alter table FAZER
   drop constraint FK_FAZER_MARCACAO_TRABALHO;

alter table FREQUENTA
   drop constraint FK_FREQUENT_FREQUENTA_AULA;

alter table FREQUENTA
   drop constraint FK_FREQUENT_FREQUENTA_ALUNO;

alter table FUNCIONARIOS
   drop constraint FK_FUNCIONA_INHERITAN_UTILIZAD;

alter table LECIONA
   drop constraint FK_LECIONA_ENSINA_PROFESSO;

alter table LECIONA
   drop constraint FK_LECIONA_MATERIA_DISCIPLI;

alter table PERTENCE
   drop constraint FK_PERTENCE_PERTENCE_FUNCIONA;

alter table PERTENCE
   drop constraint FK_PERTENCE_PERTENCE2_CARGO;

alter table PRIVILEGIOS
   drop constraint FK_PRIVILEG_CONTEM_CARGO;

alter table PRIVILEGIOS
   drop constraint FK_PRIVILEG_TEM_SERVICO;

alter table PROFESSOR
   drop constraint FK_PROFESSO_CARGO_NO__DEPARTAM;

alter table PROFESSOR
   drop constraint FK_PROFESSO_FAZ_PARTE_CATEGORI;

alter table PROFESSOR
   drop constraint FK_PROFESSO_INHERITAN_UTILIZAD;

alter table PROPINAS
   drop constraint FK_PROPINAS_GESTAO_ALUNO;

alter table REALIZACAO
   drop constraint FK_REALIZAC_MARCACAO2_AVALIACA;

alter table REALIZACAO
   drop constraint FK_REALIZAC_PRESENCA_ALUNO;

alter table SALA
   drop constraint FK_SALA_ESTA_DEPARTAM;

alter table TRABALHO
   drop constraint FK_TRABALHO_ENUNCIA_DISCIPLI;

alter table UTILIZADOR_DO_ISEC
   drop constraint FK_UTILIZAD_HABITA_MORADA;

drop index ACAO2_FK;

drop index ACAO_FK;

drop table ACAO cascade constraints;

drop index INHERITANCE_1_FK;

drop table ALUNO cascade constraints;

drop index ATRIBUIDO2_FK;

drop index ATRIBUIDO_FK;

drop table ATRIBUIDO cascade constraints;

drop index LOCALIZA_SE_FK;

drop index DA_FK;

drop table AULA cascade constraints;

drop index AGENDA_FK;

drop table AVALIACAO_ESCRITA cascade constraints;

drop table CARGO cascade constraints;

drop table CATEGORIA cascade constraints;

drop table CURSO cascade constraints;

drop table DEPARTAMENTO cascade constraints;

drop index RESPONSAVEL_FK;

drop index POSSUI_FK;

drop table DISCIPLINA cascade constraints;

drop index FAZ_FK;

drop index MARCACAO_FK;

drop table FAZER cascade constraints;

drop index FREQUENTA2_FK;

drop index FREQUENTA_FK;

drop table FREQUENTA cascade constraints;

drop index INHERITANCE_2_FK;

drop table FUNCIONARIOS cascade constraints;

drop index ENSINA_FK;

drop index MATERIA_FK;

drop table LECIONA cascade constraints;

drop table MORADA cascade constraints;

drop index PERTENCE2_FK;

drop index PERTENCE_FK;

drop table PERTENCE cascade constraints;

drop index CONTEM_FK;

drop index TEM_FK;

drop table PRIVILEGIOS cascade constraints;

drop index INHERITANCE_3_FK;

drop index FAZ_PARTE_FK;

drop index POSICAO_CARGO_NO_DEPARTAMENTO_;

drop table PROFESSOR cascade constraints;

drop index GESTAO_FK;

drop table PROPINAS cascade constraints;

drop index PRESENCA_FK;

drop index MARCACAO2_FK;

drop table REALIZACAO cascade constraints;

drop table REGISTO cascade constraints;

drop index ESTA_FK;

drop table SALA cascade constraints;

drop table SERVICO cascade constraints;

drop index ENUNCIA_FK;

drop table TRABALHO cascade constraints;

drop index HABITA_FK;

drop table UTILIZADOR_DO_ISEC cascade constraints;

/*==============================================================*/
/* Table: ACAO                                                  */
/*==============================================================*/
create table ACAO 
(
   NUM_UTILIZADOR       NUMBER               not null,
   ID_REGISTO           NUMBER               not null,
   constraint PK_ACAO primary key (NUM_UTILIZADOR, ID_REGISTO)
);

/*==============================================================*/
/* Index: ACAO_FK                                               */
/*==============================================================*/
create index ACAO_FK on ACAO (
   NUM_UTILIZADOR ASC
);

/*==============================================================*/
/* Index: ACAO2_FK                                              */
/*==============================================================*/
create index ACAO2_FK on ACAO (
   ID_REGISTO ASC
);

/*==============================================================*/
/* Table: ALUNO                                                 */
/*==============================================================*/
create table ALUNO 
(
   NUM_UTILIZADOR       NUMBER               not null,
   NUM_ALUNO            NUMBER               not null,
   CODIGO_MORADA        NUMBER,
   UTI_NOME             VARCHAR2(20),
   DATA_ENTRADA         DATE,
   NACIONALIDADE        VARCHAR2(20),
   NOME                 VARCHAR2(20),
   ECTS                 NUMBER,
   MEDIA                NUMBER,
   RAMO                 VARCHAR2(20),
   constraint PK_ALUNO primary key (NUM_UTILIZADOR, NUM_ALUNO)
);

/*==============================================================*/
/* Index: INHERITANCE_1_FK                                      */
/*==============================================================*/
create index INHERITANCE_1_FK on ALUNO (
   NUM_UTILIZADOR ASC
);

/*==============================================================*/
/* Table: ATRIBUIDO                                             */
/*==============================================================*/
create table ATRIBUIDO 
(
   NUM_UTILIZADOR       NUMBER               not null,
   NUM_FUNCIONARIO      NUMBER               not null,
   CODIGO_SERVICO       NUMBER               not null,
   constraint PK_ATRIBUIDO primary key (NUM_UTILIZADOR, NUM_FUNCIONARIO, CODIGO_SERVICO)
);

/*==============================================================*/
/* Index: ATRIBUIDO_FK                                          */
/*==============================================================*/
create index ATRIBUIDO_FK on ATRIBUIDO (
   NUM_UTILIZADOR ASC,
   NUM_FUNCIONARIO ASC
);

/*==============================================================*/
/* Index: ATRIBUIDO2_FK                                         */
/*==============================================================*/
create index ATRIBUIDO2_FK on ATRIBUIDO (
   CODIGO_SERVICO ASC
);

/*==============================================================*/
/* Table: AULA                                                  */
/*==============================================================*/
create table AULA 
(
   NUM_SALA             NUMBER               not null,
   CODIGO_AULA          NUMBER               not null,
   NUM_UTILIZADOR       NUMBER               not null,
   NUM_PROFESSOR        NUMBER               not null,
   DURACAO              DATE,
   HORARIO              DATE,
   constraint PK_AULA primary key (NUM_SALA, CODIGO_AULA)
);

/*==============================================================*/
/* Index: DA_FK                                                 */
/*==============================================================*/
create index DA_FK on AULA (
   NUM_UTILIZADOR ASC,
   NUM_PROFESSOR ASC
);

/*==============================================================*/
/* Index: LOCALIZA_SE_FK                                        */
/*==============================================================*/
create index LOCALIZA_SE_FK on AULA (
   NUM_SALA ASC
);

/*==============================================================*/
/* Table: AVALIACAO_ESCRITA                                     */
/*==============================================================*/
create table AVALIACAO_ESCRITA 
(
   CODIGO_TRABALHO2     NUMBER(10)           not null,
   CODIGO_DISCIPLINA    NUMBER,
   DATA                 DATE,
   COTACAO              NUMBER,
   DURACAO              DATE,
   constraint PK_AVALIACAO_ESCRITA primary key (CODIGO_TRABALHO2)
);

/*==============================================================*/
/* Index: AGENDA_FK                                             */
/*==============================================================*/
create index AGENDA_FK on AVALIACAO_ESCRITA (
   CODIGO_DISCIPLINA ASC
);

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO 
(
   CODIGO_CARGO         NUMBER               not null,
   NOME                 VARCHAR2(20),
   constraint PK_CARGO primary key (CODIGO_CARGO)
);

/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA 
(
   CODIGO_CATEGORIA     NUMBER               not null,
   NOME                 VARCHAR2(20),
   FUNCAO               CLOB,
   constraint PK_CATEGORIA primary key (CODIGO_CATEGORIA)
);

/*==============================================================*/
/* Table: CURSO                                                 */
/*==============================================================*/
create table CURSO 
(
   NUM_CURSO            NUMBER               not null,
   NOME                 VARCHAR2(20),
   NUM_DISCIPLINAS      NUMBER,
   NUM_ECTS             NUMBER,
   NUM_ANOS             NUMBER,
   constraint PK_CURSO primary key (NUM_CURSO)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO 
(
   NUM_DEPARTAMENTO     NUMBER               not null,
   NOME                 VARCHAR2(20),
   NUM_ANDARES          NUMBER,
   constraint PK_DEPARTAMENTO primary key (NUM_DEPARTAMENTO)
);

/*==============================================================*/
/* Table: DISCIPLINA                                            */
/*==============================================================*/
create table DISCIPLINA 
(
   CODIGO_DISCIPLINA    NUMBER               not null,
   NUM_UTILIZADOR       NUMBER,
   NUM_PROFESSOR        NUMBER,
   NUM_CURSO            NUMBER               not null,
   NOME                 VARCHAR2(20),
   SEMESTRE             NUMBER,
   NUM_ECTS             NUMBER,
   constraint PK_DISCIPLINA primary key (CODIGO_DISCIPLINA)
);

/*==============================================================*/
/* Index: POSSUI_FK                                             */
/*==============================================================*/
create index POSSUI_FK on DISCIPLINA (
   NUM_CURSO ASC
);

/*==============================================================*/
/* Index: RESPONSAVEL_FK                                        */
/*==============================================================*/
create index RESPONSAVEL_FK on DISCIPLINA (
   NUM_UTILIZADOR ASC,
   NUM_PROFESSOR ASC
);

/*==============================================================*/
/* Table: FAZER                                                 */
/*==============================================================*/
create table FAZER 
(
   CODIGO_TRABALHO      NUMBER(10)           not null,
   NUM_UTILIZADOR       NUMBER               not null,
   NUM_ALUNO            NUMBER               not null,
   DATA_ENTREGA         DATE,
   REALIZACAO           SMALLINT             not null,
   constraint PK_FAZER primary key (CODIGO_TRABALHO, NUM_UTILIZADOR, NUM_ALUNO)
);

/*==============================================================*/
/* Index: MARCACAO_FK                                           */
/*==============================================================*/
create index MARCACAO_FK on FAZER (
   CODIGO_TRABALHO ASC
);

/*==============================================================*/
/* Index: FAZ_FK                                                */
/*==============================================================*/
create index FAZ_FK on FAZER (
   NUM_UTILIZADOR ASC,
   NUM_ALUNO ASC
);

/*==============================================================*/
/* Table: FREQUENTA                                             */
/*==============================================================*/
create table FREQUENTA 
(
   NUM_SALA             NUMBER               not null,
   CODIGO_AULA          NUMBER               not null,
   NUM_UTILIZADOR       NUMBER               not null,
   NUM_ALUNO            NUMBER               not null,
   constraint PK_FREQUENTA primary key (NUM_SALA, CODIGO_AULA, NUM_UTILIZADOR, NUM_ALUNO)
);

/*==============================================================*/
/* Index: FREQUENTA_FK                                          */
/*==============================================================*/
create index FREQUENTA_FK on FREQUENTA (
   NUM_SALA ASC,
   CODIGO_AULA ASC
);

/*==============================================================*/
/* Index: FREQUENTA2_FK                                         */
/*==============================================================*/
create index FREQUENTA2_FK on FREQUENTA (
   NUM_UTILIZADOR ASC,
   NUM_ALUNO ASC
);

/*==============================================================*/
/* Table: FUNCIONARIOS                                          */
/*==============================================================*/
create table FUNCIONARIOS 
(
   NUM_UTILIZADOR       NUMBER               not null,
   NUM_FUNCIONARIO      NUMBER               not null,
   CODIGO_MORADA        NUMBER,
   UTI_NOME             VARCHAR2(20),
   DATA_ENTRADA         DATE,
   NACIONALIDADE        VARCHAR2(20),
   NOME                 VARCHAR2(20),
   constraint PK_FUNCIONARIOS primary key (NUM_UTILIZADOR, NUM_FUNCIONARIO)
);

/*==============================================================*/
/* Index: INHERITANCE_2_FK                                      */
/*==============================================================*/
create index INHERITANCE_2_FK on FUNCIONARIOS (
   NUM_UTILIZADOR ASC
);

/*==============================================================*/
/* Table: LECIONA                                               */
/*==============================================================*/
create table LECIONA 
(
   CODIGO_DISCIPLINA    NUMBER               not null,
   NUM_UTILIZADOR       NUMBER,
   NUM_PROFESSOR        NUMBER,
   ANO_LETIVO           NUMBER               not null
);

/*==============================================================*/
/* Index: MATERIA_FK                                            */
/*==============================================================*/
create index MATERIA_FK on LECIONA (
   CODIGO_DISCIPLINA ASC
);

/*==============================================================*/
/* Index: ENSINA_FK                                             */
/*==============================================================*/
create index ENSINA_FK on LECIONA (
   NUM_UTILIZADOR ASC,
   NUM_PROFESSOR ASC
);

/*==============================================================*/
/* Table: MORADA                                                */
/*==============================================================*/
create table MORADA 
(
   CODIGO_MORADA        NUMBER               not null,
   PAIS                 VARCHAR2(20),
   CIDADE               VARCHAR2(20),
   CODIGO_POSTAL        VARCHAR2(8),
   RUA                  CLOB,
   constraint PK_MORADA primary key (CODIGO_MORADA)
);

/*==============================================================*/
/* Table: PERTENCE                                              */
/*==============================================================*/
create table PERTENCE 
(
   NUM_UTILIZADOR       NUMBER               not null,
   NUM_FUNCIONARIO      NUMBER               not null,
   CODIGO_CARGO         NUMBER               not null,
   constraint PK_PERTENCE primary key (NUM_UTILIZADOR, NUM_FUNCIONARIO, CODIGO_CARGO)
);

/*==============================================================*/
/* Index: PERTENCE_FK                                           */
/*==============================================================*/
create index PERTENCE_FK on PERTENCE (
   NUM_UTILIZADOR ASC,
   NUM_FUNCIONARIO ASC
);

/*==============================================================*/
/* Index: PERTENCE2_FK                                          */
/*==============================================================*/
create index PERTENCE2_FK on PERTENCE (
   CODIGO_CARGO ASC
);

/*==============================================================*/
/* Table: PRIVILEGIOS                                           */
/*==============================================================*/
create table PRIVILEGIOS 
(
   ID                   NUMBER               not null,
   CODIGO_CARGO         NUMBER,
   CODIGO_SERVICO       NUMBER,
   ID_TABELA            NUMBER,
   EDITAR               SMALLINT,
   VER                  SMALLINT,
   constraint PK_PRIVILEGIOS primary key (ID)
);

/*==============================================================*/
/* Index: TEM_FK                                                */
/*==============================================================*/
create index TEM_FK on PRIVILEGIOS (
   CODIGO_SERVICO ASC
);

/*==============================================================*/
/* Index: CONTEM_FK                                             */
/*==============================================================*/
create index CONTEM_FK on PRIVILEGIOS (
   CODIGO_CARGO ASC
);

/*==============================================================*/
/* Table: PROFESSOR                                             */
/*==============================================================*/
create table PROFESSOR 
(
   NUM_UTILIZADOR       NUMBER               not null,
   NUM_PROFESSOR        NUMBER               not null,
   NUM_DEPARTAMENTO     NUMBER               not null,
   CODIGO_CATEGORIA     NUMBER               not null,
   CODIGO_MORADA        NUMBER,
   UTI_NOME             VARCHAR2(20),
   DATA_ENTRADA         DATE,
   NACIONALIDADE        VARCHAR2(20),
   NOME                 VARCHAR2(20),
   constraint PK_PROFESSOR primary key (NUM_UTILIZADOR, NUM_PROFESSOR)
);

/*==============================================================*/
/* Index: POSICAO_CARGO_NO_DEPARTAMENTO_                        */
/*==============================================================*/
create index POSICAO_CARGO_NO_DEPARTAMENTO_ on PROFESSOR (
   NUM_DEPARTAMENTO ASC
);

/*==============================================================*/
/* Index: FAZ_PARTE_FK                                          */
/*==============================================================*/
create index FAZ_PARTE_FK on PROFESSOR (
   CODIGO_CATEGORIA ASC
);

/*==============================================================*/
/* Index: INHERITANCE_3_FK                                      */
/*==============================================================*/
create index INHERITANCE_3_FK on PROFESSOR (
   NUM_UTILIZADOR ASC
);

/*==============================================================*/
/* Table: PROPINAS                                              */
/*==============================================================*/
create table PROPINAS 
(
   CODIGO_PROPINA       NUMBER               not null,
   NUM_UTILIZADOR       NUMBER,
   NUM_ALUNO            NUMBER,
   MONTANTE             NUMBER(8,2),
   DATA_LIMITE          DATE,
   VENCIMENTO           SMALLINT,
   REFERENCIA           NUMBER,
   ENTIDADE             NUMBER,
   ESTADO_PAGAMENTO     SMALLINT,
   constraint PK_PROPINAS primary key (CODIGO_PROPINA)
);

/*==============================================================*/
/* Index: GESTAO_FK                                             */
/*==============================================================*/
create index GESTAO_FK on PROPINAS (
   NUM_UTILIZADOR ASC,
   NUM_ALUNO ASC
);

/*==============================================================*/
/* Table: REALIZACAO                                            */
/*==============================================================*/
create table REALIZACAO 
(
   CODIGO_TRABALHO2     NUMBER(10)           not null,
   NUM_UTILIZADOR       NUMBER               not null,
   NUM_ALUNO            NUMBER               not null,
   DATA_ENTREGA         DATE,
   REALIZACAO           SMALLINT             not null,
   constraint PK_REALIZACAO primary key (CODIGO_TRABALHO2, NUM_UTILIZADOR, NUM_ALUNO)
);

/*==============================================================*/
/* Index: MARCACAO2_FK                                          */
/*==============================================================*/
create index MARCACAO2_FK on REALIZACAO (
   CODIGO_TRABALHO2 ASC
);

/*==============================================================*/
/* Index: PRESENCA_FK                                           */
/*==============================================================*/
create index PRESENCA_FK on REALIZACAO (
   NUM_UTILIZADOR ASC,
   NUM_ALUNO ASC
);

/*==============================================================*/
/* Table: REGISTO                                               */
/*==============================================================*/
create table REGISTO 
(
   ID_REGISTO           NUMBER               not null,
   TAREFA               CLOB,
   LOG                  DATE,
   constraint PK_REGISTO primary key (ID_REGISTO)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA 
(
   NUM_SALA             NUMBER               not null,
   NUM_DEPARTAMENTO     NUMBER               not null,
   NOME                 VARCHAR2(20),
   CAPACIDADE           NUMBER,
   constraint PK_SALA primary key (NUM_SALA)
);

/*==============================================================*/
/* Index: ESTA_FK                                               */
/*==============================================================*/
create index ESTA_FK on SALA (
   NUM_DEPARTAMENTO ASC
);

/*==============================================================*/
/* Table: SERVICO                                               */
/*==============================================================*/
create table SERVICO 
(
   CODIGO_SERVICO       NUMBER               not null,
   DATA                 DATE,
   TAREFA               CLOB,
   constraint PK_SERVICO primary key (CODIGO_SERVICO)
);

/*==============================================================*/
/* Table: TRABALHO                                              */
/*==============================================================*/
create table TRABALHO 
(
   CODIGO_TRABALHO      NUMBER(10)           not null,
   CODIGO_DISCIPLINA    NUMBER,
   DATA                 DATE,
   COTACAO              NUMBER,
   constraint PK_TRABALHO primary key (CODIGO_TRABALHO)
);

/*==============================================================*/
/* Index: ENUNCIA_FK                                            */
/*==============================================================*/
create index ENUNCIA_FK on TRABALHO (
   CODIGO_DISCIPLINA ASC
);

/*==============================================================*/
/* Table: UTILIZADOR_DO_ISEC                                    */
/*==============================================================*/
create table UTILIZADOR_DO_ISEC 
(
   NUM_UTILIZADOR       NUMBER               not null,
   CODIGO_MORADA        NUMBER,
   NOME                 VARCHAR2(20),
   DATA_ENTRADA         DATE,
   NACIONALIDADE        VARCHAR2(20),
   constraint PK_UTILIZADOR_DO_ISEC primary key (NUM_UTILIZADOR)
);

/*==============================================================*/
/* Index: HABITA_FK                                             */
/*==============================================================*/
create index HABITA_FK on UTILIZADOR_DO_ISEC (
   CODIGO_MORADA ASC
);

alter table ACAO
   add constraint FK_ACAO_ACAO_UTILIZAD foreign key (NUM_UTILIZADOR)
      references UTILIZADOR_DO_ISEC (NUM_UTILIZADOR);

alter table ACAO
   add constraint FK_ACAO_ACAO2_REGISTO foreign key (ID_REGISTO)
      references REGISTO (ID_REGISTO);

alter table ALUNO
   add constraint FK_ALUNO_INHERITAN_UTILIZAD foreign key (NUM_UTILIZADOR)
      references UTILIZADOR_DO_ISEC (NUM_UTILIZADOR);

alter table ATRIBUIDO
   add constraint FK_ATRIBUID_ATRIBUIDO_FUNCIONA foreign key (NUM_UTILIZADOR, NUM_FUNCIONARIO)
      references FUNCIONARIOS (NUM_UTILIZADOR, NUM_FUNCIONARIO);

alter table ATRIBUIDO
   add constraint FK_ATRIBUID_ATRIBUIDO_SERVICO foreign key (CODIGO_SERVICO)
      references SERVICO (CODIGO_SERVICO);

alter table AULA
   add constraint FK_AULA_DA_PROFESSO foreign key (NUM_UTILIZADOR, NUM_PROFESSOR)
      references PROFESSOR (NUM_UTILIZADOR, NUM_PROFESSOR);

alter table AULA
   add constraint FK_AULA_LOCALIZA__SALA foreign key (NUM_SALA)
      references SALA (NUM_SALA);

alter table AVALIACAO_ESCRITA
   add constraint FK_AVALIACA_AGENDA_DISCIPLI foreign key (CODIGO_DISCIPLINA)
      references DISCIPLINA (CODIGO_DISCIPLINA);

alter table DISCIPLINA
   add constraint FK_DISCIPLI_POSSUI_CURSO foreign key (NUM_CURSO)
      references CURSO (NUM_CURSO);

alter table DISCIPLINA
   add constraint FK_DISCIPLI_RESPONSAV_PROFESSO foreign key (NUM_UTILIZADOR, NUM_PROFESSOR)
      references PROFESSOR (NUM_UTILIZADOR, NUM_PROFESSOR);

alter table FAZER
   add constraint FK_FAZER_FAZ_ALUNO foreign key (NUM_UTILIZADOR, NUM_ALUNO)
      references ALUNO (NUM_UTILIZADOR, NUM_ALUNO);

alter table FAZER
   add constraint FK_FAZER_MARCACAO_TRABALHO foreign key (CODIGO_TRABALHO)
      references TRABALHO (CODIGO_TRABALHO);

alter table FREQUENTA
   add constraint FK_FREQUENT_FREQUENTA_AULA foreign key (NUM_SALA, CODIGO_AULA)
      references AULA (NUM_SALA, CODIGO_AULA);

alter table FREQUENTA
   add constraint FK_FREQUENT_FREQUENTA_ALUNO foreign key (NUM_UTILIZADOR, NUM_ALUNO)
      references ALUNO (NUM_UTILIZADOR, NUM_ALUNO);

alter table FUNCIONARIOS
   add constraint FK_FUNCIONA_INHERITAN_UTILIZAD foreign key (NUM_UTILIZADOR)
      references UTILIZADOR_DO_ISEC (NUM_UTILIZADOR);

alter table LECIONA
   add constraint FK_LECIONA_ENSINA_PROFESSO foreign key (NUM_UTILIZADOR, NUM_PROFESSOR)
      references PROFESSOR (NUM_UTILIZADOR, NUM_PROFESSOR);

alter table LECIONA
   add constraint FK_LECIONA_MATERIA_DISCIPLI foreign key (CODIGO_DISCIPLINA)
      references DISCIPLINA (CODIGO_DISCIPLINA);

alter table PERTENCE
   add constraint FK_PERTENCE_PERTENCE_FUNCIONA foreign key (NUM_UTILIZADOR, NUM_FUNCIONARIO)
      references FUNCIONARIOS (NUM_UTILIZADOR, NUM_FUNCIONARIO);

alter table PERTENCE
   add constraint FK_PERTENCE_PERTENCE2_CARGO foreign key (CODIGO_CARGO)
      references CARGO (CODIGO_CARGO);

alter table PRIVILEGIOS
   add constraint FK_PRIVILEG_CONTEM_CARGO foreign key (CODIGO_CARGO)
      references CARGO (CODIGO_CARGO);

alter table PRIVILEGIOS
   add constraint FK_PRIVILEG_TEM_SERVICO foreign key (CODIGO_SERVICO)
      references SERVICO (CODIGO_SERVICO);

alter table PROFESSOR
   add constraint FK_PROFESSO_CARGO_NO__DEPARTAM foreign key (NUM_DEPARTAMENTO)
      references DEPARTAMENTO (NUM_DEPARTAMENTO);

alter table PROFESSOR
   add constraint FK_PROFESSO_FAZ_PARTE_CATEGORI foreign key (CODIGO_CATEGORIA)
      references CATEGORIA (CODIGO_CATEGORIA);

alter table PROFESSOR
   add constraint FK_PROFESSO_INHERITAN_UTILIZAD foreign key (NUM_UTILIZADOR)
      references UTILIZADOR_DO_ISEC (NUM_UTILIZADOR);

alter table PROPINAS
   add constraint FK_PROPINAS_GESTAO_ALUNO foreign key (NUM_UTILIZADOR, NUM_ALUNO)
      references ALUNO (NUM_UTILIZADOR, NUM_ALUNO);

alter table REALIZACAO
   add constraint FK_REALIZAC_MARCACAO2_AVALIACA foreign key (CODIGO_TRABALHO2)
      references AVALIACAO_ESCRITA (CODIGO_TRABALHO2);

alter table REALIZACAO
   add constraint FK_REALIZAC_PRESENCA_ALUNO foreign key (NUM_UTILIZADOR, NUM_ALUNO)
      references ALUNO (NUM_UTILIZADOR, NUM_ALUNO);

alter table SALA
   add constraint FK_SALA_ESTA_DEPARTAM foreign key (NUM_DEPARTAMENTO)
      references DEPARTAMENTO (NUM_DEPARTAMENTO);

alter table TRABALHO
   add constraint FK_TRABALHO_ENUNCIA_DISCIPLI foreign key (CODIGO_DISCIPLINA)
      references DISCIPLINA (CODIGO_DISCIPLINA);

alter table UTILIZADOR_DO_ISEC
   add constraint FK_UTILIZAD_HABITA_MORADA foreign key (CODIGO_MORADA)
      references MORADA (CODIGO_MORADA);

