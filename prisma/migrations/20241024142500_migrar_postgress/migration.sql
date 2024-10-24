-- CreateEnum
CREATE TYPE "Genero" AS ENUM ('HOMEM', 'MULHER', 'NAO_INFORMADO');

-- CreateTable
CREATE TABLE "idiomas" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(60) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "idiomas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "idiomas_usuarios" (
    "id" SERIAL NOT NULL,
    "idiomaId" INTEGER NOT NULL,
    "usuarioId" VARCHAR(36) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "idiomas_usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuarios" (
    "id" VARCHAR(36) NOT NULL,
    "nome" VARCHAR(60) NOT NULL,
    "idade" INTEGER DEFAULT 0,
    "nacionalidade" VARCHAR(60) DEFAULT 'Aguardando',
    "descricao" TEXT,
    "foto" VARCHAR(255) NOT NULL DEFAULT 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpxzMJ80PmPGQIrDCKHeRwyW7nWreGvtR3ng&s',
    "genero" "Genero" DEFAULT 'NAO_INFORMADO',
    "linguaMaternaId" INTEGER,
    "tempoDeUso" INTEGER DEFAULT 0,
    "mensagensTotais" INTEGER DEFAULT 0,
    "sessoesTotais" INTEGER DEFAULT 0,
    "email" VARCHAR(60) NOT NULL,
    "senha" VARCHAR(60) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_email_key" ON "usuarios"("email");

-- AddForeignKey
ALTER TABLE "idiomas_usuarios" ADD CONSTRAINT "idiomas_usuarios_idiomaId_fkey" FOREIGN KEY ("idiomaId") REFERENCES "idiomas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "idiomas_usuarios" ADD CONSTRAINT "idiomas_usuarios_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios" ADD CONSTRAINT "usuarios_linguaMaternaId_fkey" FOREIGN KEY ("linguaMaternaId") REFERENCES "idiomas"("id") ON DELETE SET NULL ON UPDATE CASCADE;
