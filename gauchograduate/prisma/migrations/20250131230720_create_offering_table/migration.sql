/*
  Warnings:

  - You are about to drop the column `quarter` on the `Course` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Course" DROP COLUMN "quarter";

-- CreateTable
CREATE TABLE "Offering" (
    "id" SERIAL NOT NULL,
    "quarter" TEXT NOT NULL,
    "year" TEXT NOT NULL,
    "courseId" INTEGER NOT NULL,

    CONSTRAINT "Offering_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Offering" ADD CONSTRAINT "Offering_courseId_fkey" FOREIGN KEY ("courseId") REFERENCES "Course"("id") ON DELETE CASCADE ON UPDATE CASCADE;
