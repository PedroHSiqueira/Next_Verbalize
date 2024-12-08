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
    "nascimento" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
    "recuperacao" VARCHAR(6),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "conversas" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "conversas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "mensagens" (
    "id" VARCHAR(36) NOT NULL,
    "usuarioId" VARCHAR(36) NOT NULL,
    "texto" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "mensagens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "administradores" (
    "id" VARCHAR(36) NOT NULL,
    "nome" VARCHAR(60) NOT NULL,
    "email" VARCHAR(60) NOT NULL,
    "senha" VARCHAR(60) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "administradores_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ConversaToUsuario" (
    "A" INTEGER NOT NULL,
    "B" VARCHAR(36) NOT NULL
);

-- CreateTable
CREATE TABLE "_ConversaToMensagem" (
    "A" INTEGER NOT NULL,
    "B" VARCHAR(36) NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_email_key" ON "usuarios"("email");

-- CreateIndex
CREATE UNIQUE INDEX "administradores_email_key" ON "administradores"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_ConversaToUsuario_AB_unique" ON "_ConversaToUsuario"("A", "B");

-- CreateIndex
CREATE INDEX "_ConversaToUsuario_B_index" ON "_ConversaToUsuario"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ConversaToMensagem_AB_unique" ON "_ConversaToMensagem"("A", "B");

-- CreateIndex
CREATE INDEX "_ConversaToMensagem_B_index" ON "_ConversaToMensagem"("B");

-- AddForeignKey
ALTER TABLE "idiomas_usuarios" ADD CONSTRAINT "idiomas_usuarios_idiomaId_fkey" FOREIGN KEY ("idiomaId") REFERENCES "idiomas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "idiomas_usuarios" ADD CONSTRAINT "idiomas_usuarios_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "usuarios" ADD CONSTRAINT "usuarios_linguaMaternaId_fkey" FOREIGN KEY ("linguaMaternaId") REFERENCES "idiomas"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ConversaToUsuario" ADD CONSTRAINT "_ConversaToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "conversas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ConversaToUsuario" ADD CONSTRAINT "_ConversaToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "usuarios"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ConversaToMensagem" ADD CONSTRAINT "_ConversaToMensagem_A_fkey" FOREIGN KEY ("A") REFERENCES "conversas"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ConversaToMensagem" ADD CONSTRAINT "_ConversaToMensagem_B_fkey" FOREIGN KEY ("B") REFERENCES "mensagens"("id") ON DELETE CASCADE ON UPDATE CASCADE;
