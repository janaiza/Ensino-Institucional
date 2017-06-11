SET FOREIGN_KEY_CHECKS=0;
drop table if exists rl_curso_aluno;
drop table if exists rl_curso_materia;
drop table if exists rl_materia_professor;
drop table if exists rl_turmaformacao_materiaprofessor;
drop table if exists tb_avaliacao_aluno;
drop table if exists tb_curso;
drop table if exists tb_materia;
drop table if exists tb_perfil;
drop table if exists tb_periodo_avaliacao;
drop table if exists tb_sexo;
drop table if exists tb_turma_formacao;
drop table if exists tb_usuario;
SET FOREIGN_KEY_CHECKS=1; 

/*==============================================================*/
/* Table: tb_curso                                              */
/*==============================================================*/
create table tb_curso
(
   id_curso             int not null auto_increment comment 'Código identificador do curso',
   nm_curso             varchar(100) not null comment 'Nome do curso',
   sg_curso             varchar(10) not null comment 'Sigla identificadora do curso',
   nu_carga_horario     int(4) not null comment 'Quantidade de horas totais do curso completo',
   primary key (id_curso)
);

alter table tb_curso comment 'Mantém os cursos disponíveis para formação';

/*==============================================================*/
/* Table: tb_turma_formacao                                     */
/*==============================================================*/
create table tb_turma_formacao
(
   id_turma_formacao    int not null auto_increment comment 'Código identificador da turma de formação.',
   id_curso             int not null comment 'Código identificador do curso',
   nu_ano_inicio        int(4) not null comment 'Ano de início do curso da turma de formação.',
   nu_vagas             int(4) not null comment 'Quantidade de vagas aberta para o curso na respectiva turma de formação',
   st_turma_formacao    char(1) not null default '1' comment 'Situação da turma de formação. Possíveis valores:
            1 - Disponível para novas incrições
            2 - Inscrição finalizada.',
   primary key (id_turma_formacao),
   constraint fk_reference_13 foreign key (id_curso)
      references tb_curso (id_curso) on delete restrict on update restrict
);

alter table tb_turma_formacao comment 'Tabela que mantém as infomações de abertura da turma de form';

/*==============================================================*/
/* Table: tb_sexo                                               */
/*==============================================================*/
create table tb_sexo
(
   id_sexo              int not null comment 'Código identificador do sexo.',
   nm_sexo              varchar(10) not null comment 'Nome do sexo',
   primary key (id_sexo)
);

alter table tb_sexo comment 'Mantém o sexo. Valores Permitidos:
1 - Masculino
2 - Feminino';

/*==============================================================*/
/* Table: tb_perfil                                             */
/*==============================================================*/
create table tb_perfil
(
   id_perfil            int not null,
   nm_perfil            varchar(100) not null,
   ds_perfil            varchar(250),
   primary key (id_perfil)
);

alter table tb_perfil comment 'Mantém o perfil do usuário. Possíveis valores:
1 - Adm';

/*==============================================================*/
/* Table: tb_usuario                                            */
/*==============================================================*/
create table tb_usuario
(
   id_usuario           int not null auto_increment comment 'Código identificador do professor',
   id_sexo              int comment 'Código identificador do sexo.',
   id_perfil            int,
   nm_usuario           varchar(100) not null comment 'Nome do professor',
   nu_cpf               int(11) not null comment 'CPF do professor',
   dt_nascimento        date not null comment 'Data de nascimento do professor',
   primary key (id_usuario),
   constraint fk_fk_sexo_professor foreign key (id_sexo)
      references tb_sexo (id_sexo) on delete restrict on update restrict,
   constraint fk_reference_18 foreign key (id_perfil)
      references tb_perfil (id_perfil) on delete restrict on update restrict
);

alter table tb_usuario comment 'Mantém as informações dos usuários.';

/*==============================================================*/
/* Table: rl_curso_aluno                                        */
/*==============================================================*/
create table rl_curso_aluno
(
   id_curso_aluno       int not null auto_increment comment 'Código identificador do curso X aluno',
   id_turma_formacao    int comment 'Código identificador da turma de formação.',
   id_usuario           int comment 'Código identificador do professor',
   nu_matricula_aluno   int(2) zerofill not null comment 'Número da matrícula do aluno',
   dt_matricula         int not null comment 'Data em que o aluno realizou a matrícula no curso em questão',
   primary key (id_curso_aluno),
   constraint fk_reference_14 foreign key (id_turma_formacao)
      references tb_turma_formacao (id_turma_formacao) on delete restrict on update restrict,
   constraint fk_reference_17 foreign key (id_usuario)
      references tb_usuario (id_usuario) on delete restrict on update restrict
);

alter table rl_curso_aluno comment 'Mantém os cursos em que o aluno está matriculado';

/*==============================================================*/
/* Table: tb_materia                                            */
/*==============================================================*/
create table tb_materia
(
   id_materia           int not null auto_increment comment 'Código identificador da matéria',
   nm_materia           varchar(100) not null comment 'Nome da matéria',
   primary key (id_materia)
);

alter table tb_materia comment 'Mantém as tabelas disponíveis';

/*==============================================================*/
/* Table: rl_curso_materia                                      */
/*==============================================================*/
create table rl_curso_materia
(
   id_curso_materia     int not null auto_increment comment 'Código identificador do relacionamento entre curso e matéria',
   id_curso             int comment 'Código identificador do curso',
   id_materia           int comment 'Código identificador da matéria',
   primary key (id_curso_materia),
   constraint fk_fk_curso_cursomateria foreign key (id_curso)
      references tb_curso (id_curso) on delete restrict on update restrict,
   constraint fk_fk_materia_cursomateria foreign key (id_materia)
      references tb_materia (id_materia) on delete restrict on update restrict
);

alter table rl_curso_materia comment 'Mantém o relacionamento entre o curso e suas respectivas mat';

/*==============================================================*/
/* Table: rl_materia_professor                                  */
/*==============================================================*/
create table rl_materia_professor
(
   id_materia_professor int not null auto_increment comment 'Código identificador do relacionamento entre matéria e professor',
   id_materia           int comment 'Código identificador da matéria',
   id_professor         int comment 'Código identificador do professor',
   primary key (id_materia_professor),
   constraint fk_fk_materia_materiaprofessor foreign key (id_materia)
      references tb_materia (id_materia) on delete restrict on update restrict,
   constraint fk_fk_professor_materiaprofessor foreign key (id_professor)
      references tb_usuario (id_usuario) on delete restrict on update restrict
);

alter table rl_materia_professor comment 'Mantém o relacionamento entre a matéria e o professor, ou se';

/*==============================================================*/
/* Table: rl_turmaformacao_materiaprofessor                     */
/*==============================================================*/
create table rl_turmaformacao_materiaprofessor
(
   id_materia_professor int not null comment 'Código identificador do relacionamento entre matéria e professor',
   id_turma_formacao    int not null comment 'Código identificador da turma de formação.',
   primary key (id_materia_professor, id_turma_formacao),
   constraint fk_reference_15 foreign key (id_materia_professor)
      references rl_materia_professor (id_materia_professor) on delete restrict on update restrict,
   constraint fk_reference_16 foreign key (id_turma_formacao)
      references tb_turma_formacao (id_turma_formacao) on delete restrict on update restrict
);

alter table rl_turmaformacao_materiaprofessor comment 'Mantém a definição dos professores que darão aula para deter';

/*==============================================================*/
/* Table: tb_periodo_avaliacao                                  */
/*==============================================================*/
create table tb_periodo_avaliacao
(
   id_periodo_avaliacao int not null comment 'Código identificador do período da avaliação',
   nm_periodo_avaliacao varchar(10) not null comment 'Nome do período da avaliação',
   primary key (id_periodo_avaliacao)
);

alter table tb_periodo_avaliacao comment 'Mantém o período de avalização. Possíveis valores:
1 -';

/*==============================================================*/
/* Table: tb_avaliacao_aluno                                    */
/*==============================================================*/
create table tb_avaliacao_aluno
(
   id_avaliacao_aluno   int not null auto_increment comment 'Código identificador da avaliação do aluno',
   id_materia_professor int comment 'Código identificador do relacionamento entre matéria e professor',
   id_curso_aluno       int comment 'Código identificador do curso X aluno',
   id_periodo_avaliacao int comment 'Código identificador do período da avaliação',
   nu_nota              decimal(2,1) not null comment 'Número da nota do aluno',
   dt_avaliacao         date not null,
   primary key (id_avaliacao_aluno),
   constraint fk_fk_periodoaval_avaliacaoaluno foreign key (id_periodo_avaliacao)
      references tb_periodo_avaliacao (id_periodo_avaliacao) on delete restrict on update restrict,
   constraint fk_reference_11 foreign key (id_materia_professor)
      references rl_materia_professor (id_materia_professor) on delete restrict on update restrict,
   constraint fk_reference_12 foreign key (id_curso_aluno)
      references rl_curso_aluno (id_curso_aluno) on delete restrict on update restrict
);

alter table tb_avaliacao_aluno comment 'Mantém as informações de avaliação do aluno';