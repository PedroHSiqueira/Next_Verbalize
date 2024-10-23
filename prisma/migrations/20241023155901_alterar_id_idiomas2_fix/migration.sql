-- DropForeignKey
ALTER TABLE `usuarios` DROP FOREIGN KEY `usuarios_linguaMaternaId_fkey`;

-- AlterTable
ALTER TABLE `usuarios` MODIFY `linguaMaternaId` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `usuarios` ADD CONSTRAINT `usuarios_linguaMaternaId_fkey` FOREIGN KEY (`linguaMaternaId`) REFERENCES `idiomas`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
