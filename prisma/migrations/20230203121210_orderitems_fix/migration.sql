/*
  Warnings:

  - You are about to drop the column `orderId` on the `orderitems` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `orderitems` DROP FOREIGN KEY `orderitems_orderId_fkey`;

-- AlterTable
ALTER TABLE `orderitems` DROP COLUMN `orderId`,
    ADD COLUMN `order_id` INTEGER NULL;

-- AddForeignKey
ALTER TABLE `orderitems` ADD CONSTRAINT `orderitems_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `order`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
