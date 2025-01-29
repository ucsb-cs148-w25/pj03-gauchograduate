-- CreateTable
CREATE TABLE "Course" (
    "id" TEXT NOT NULL,
    "quarter" INTEGER NOT NULL,
    "course_id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "subject_area" TEXT NOT NULL,
    "units" INTEGER NOT NULL,
    "general_ed" JSONB NOT NULL,
    "prerequisites" JSONB NOT NULL,
    "unlocks" JSONB NOT NULL,

    CONSTRAINT "Course_pkey" PRIMARY KEY ("id")
);
