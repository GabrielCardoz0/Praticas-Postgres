CREATE TABLE "alunos" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"cpf" TEXT(11) NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	CONSTRAINT "alunos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "turmas" (
	"id" serial NOT NULL,
	"cod" integer NOT NULL UNIQUE,
	CONSTRAINT "turmas_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "alunosTurma" (
	"id" serial NOT NULL,
	"alunoId" integer NOT NULL UNIQUE,
	"turmaId" integer NOT NULL UNIQUE,
	"entrada" DATE NOT NULL,
	"saída" DATE,
	CONSTRAINT "alunosTurma_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "projetos" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"moduloId" integer NOT NULL,
	CONSTRAINT "projetos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "modulos" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL UNIQUE,
	CONSTRAINT "modulos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "alunosProjeto" (
	"id" serial NOT NULL,
	"alunoId" integer NOT NULL,
	"projetoId" integer NOT NULL,
	"nota" TEXT NOT NULL,
	CONSTRAINT "alunosProjeto_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


ALTER TABLE "alunosTurma" ADD CONSTRAINT "alunosTurma_fk0" FOREIGN KEY ("alunoId") REFERENCES "alunos"("id");

ALTER TABLE "alunosTurma" ADD CONSTRAINT "alunosTurma_fk1" FOREIGN KEY ("turmaId") REFERENCES "turmas"("id");

ALTER TABLE "projetos" ADD CONSTRAINT "projetos_fk0" FOREIGN KEY ("moduloId") REFERENCES "modulos"("id");

ALTER TABLE "alunosProjeto" ADD CONSTRAINT "alunosProjeto_fk0" FOREIGN KEY ("alunoId") REFERENCES "alunos"("id");

ALTER TABLE "alunosProjeto" ADD CONSTRAINT "alunosProjeto_fk1" FOREIGN KEY ("projetoId") REFERENCES "projetos"("id");