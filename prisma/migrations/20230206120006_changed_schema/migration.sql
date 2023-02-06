/*
  Warnings:

  - You are about to drop the column `customer_adress` on the `order` table. All the data in the column will be lost.
  - You are about to alter the column `product_id` on the `orderitems` table. The data in that column could be lost. The data in that column will be cast from `UnsignedInt` to `Int`.
  - Added the required column `customer_address` to the `order` table without a default value. This is not possible if the table is not empty.
  - Made the column `order_id` on table `orderitems` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `orderitems` DROP FOREIGN KEY `orderitems_order_id_fkey`;

-- AlterTable
ALTER TABLE `order` DROP COLUMN `customer_adress`,
    ADD COLUMN `customer_address` VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE `orderitems` MODIFY `product_id` INTEGER NOT NULL,
    MODIFY `order_id` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `orderitems` ADD CONSTRAINT `orderitems_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `order`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `orderitems` ADD CONSTRAINT `orderitems_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `product`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
