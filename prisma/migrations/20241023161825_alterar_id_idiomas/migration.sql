-- CreateTable
CREATE TABLE `idiomas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(60) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `idiomas_usuarios` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idiomaId` INTEGER NOT NULL,
    `usuarioId` VARCHAR(36) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuarios` (
    `id` VARCHAR(36) NOT NULL,
    `nome` VARCHAR(60) NOT NULL,
    `idade` INTEGER NULL DEFAULT 0,
    `nacionalidade` VARCHAR(60) NULL DEFAULT 'Aguardando',
    `descricao` TEXT NULL,
    `foto` VARCHAR(255) NOT NULL DEFAULT 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpxzMJ80PmPGQIrDCKHeRwyW7nWreGvtR3ng&s',
    `genero` ENUM('HOMEM', 'MULHER', 'NAO_INFORMADO') NULL DEFAULT 'NAO_INFORMADO',
    `linguaMaternaId` INTEGER NULL,
    `tempoDeUso` INTEGER NULL DEFAULT 0,
    `mensagensTotais` INTEGER NULL DEFAULT 0,
    `sessoesTotais` INTEGER NULL DEFAULT 0,
    `email` VARCHAR(60) NOT NULL,
    `senha` VARCHAR(60) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `usuarios_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `idiomas_usuarios` ADD CONSTRAINT `idiomas_usuarios_idiomaId_fkey` FOREIGN KEY (`idiomaId`) REFERENCES `idiomas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `idiomas_usuarios` ADD CONSTRAINT `idiomas_usuarios_usuarioId_fkey` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `usuarios` ADD CONSTRAINT `usuarios_linguaMaternaId_fkey` FOREIGN KEY (`linguaMaternaId`) REFERENCES `idiomas`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
