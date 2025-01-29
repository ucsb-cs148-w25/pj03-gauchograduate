-- AlterTable
ALTER TABLE "User" ADD COLUMN     "courses" JSONB NOT NULL DEFAULT '[]';
