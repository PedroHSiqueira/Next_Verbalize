/*
  Warnings:

  - The primary key for the `idiomas_usuarios` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `idiomas_usuarios` table. The data in that column could be lost. The data in that column will be cast from `VarChar(36)` to `Int`.
  - You are about to drop the column `linguaMaterna` on the `usuarios` table. All the data in the column will be lost.
  - Added the required column `linguaMaternaId` to the `usuarios` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `idiomas_usuarios` DROP PRIMARY KEY,
    MODIFY `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `usuarios` DROP COLUMN `linguaMaterna`,
    ADD COLUMN `linguaMaternaId` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `usuarios` ADD CONSTRAINT `usuarios_linguaMaternaId_fkey` FOREIGN KEY (`linguaMaternaId`) REFERENCES `idiomas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
