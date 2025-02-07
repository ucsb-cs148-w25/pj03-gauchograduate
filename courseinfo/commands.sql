
DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 29C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 29C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 29C', 'COSTUME PRACTICUM', 'Empirical understanding of methods of assembly and materials for stage dress. Costume shop organization and operation are experienced during the construction process.', 'THTR', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 29D') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 29D';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 29D', 'RUN CREW PRACTICUM', 'Empirical understanding of backstage organization and operation during live performance.', 'THTR', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 40') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 40';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 40', 'THEATER GAMES', 'Using theater games, improvisation and storytelling, this   course expands the   imagination and frees the instincts of the actor.   Exercises reflect the work of   improvisation icons such as Viola Spolin, Augusto Boal,   and Paul Sills. Students   also explore techniques for sharing/teaching these games   in community settings such   as schools, senior citizen centers, etc. Prerequisite:   Theater 5 or Instructor''s Approval. Highly recommended for students focusing on   Theater and Community.', 'THTR', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 42') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 42';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 42', 'I.V. LIVE', 'This course produces a weekly performance series in Isla Vista.  Students get   first-hand experience in the rigors of theatrical production, as they learn to   execute all logistical, technical, and promotional details. The course is affiliated   with Isla Vista Arts (www.islavista-arts.org).', 'THTR', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 49') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 49';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 49', 'THEATER WORKSHOP', 'Projects in costume, scenery, lighting, acting, directing.', 'THTR', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 95') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 95';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 95', 'STAGE MANAGEMENT', 'Foundational course exploring the full range of duties and responsibilities of a stage manager, a vital role for all   theatrical and dance productions.', 'THTR', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 110A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 110A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 110A', 'ADV MOVEMENT STAGE', 'A continuation of the Theater 10 series with increased focus on physical ch aracterization and technical skills.', 'THTR', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 111A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 111A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 111A', 'ADV VOICE LAB', 'Advanced problems in voice for the actor with continued emphasis on craft, plus the creative and expressive uses of the voice with the body.', 'THTR', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 112') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 112';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 112', 'SENIOR VOICE LAB', 'Seminar in advanced voice work for senior students in B.F.A.-Acting program . Concentration on projects to find a personal voice in the theatre.', 'THTR', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 142') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 142';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 142', 'I.V. LIVE', 'This course produces a weekly performance series in Isla Vista. Students get   first-hand experience in the rigors of theatrical production, as they learn to   execute all logistical, technical and promotional details. The course is affiliated   with Isla Vista Arts (www.islavista-arts.org).', 'THTR', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 149') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 149';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 149', 'THEATRE WORKSHOP', 'Projects in costume, scenery, lighting, acting, directing.', 'THTR', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 151A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 151A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 151A', 'ADVANCED ACTING', 'Scene work and exercises exploring various acting styles which may include Shakespeare, Boal, Artaud, Greek, period comedy and farce, and Absurd.', 'THTR', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 151F') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 151F';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 151F', 'SENIOR AUDITIONS', 'Preparation and study of material and techniques for professional and gradu ate school audition.', 'THTR', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 152A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 152A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 152A', 'INTRO STAGE DIRECT', 'Basic principles of directing. Lectures, demonstrations, and small practica l projects offer the non-specialist and potential directing concentration s tudent a broad understanding of the directorial process.', 'THTR', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 152D') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 152D';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 152D', 'DIRECTORIAL PRODUCT', 'Full directorial responsibility for the mounting of a one-act play.', 'THTR', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 153P') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 153P';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 153P', 'DESIGN & PRODUCTION', 'Special projects in each area of concentration.', 'THTR', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 193H') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 193H';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 193H', 'SR HONORS PROJECT', 'Senior honors project. Advanced thesis project in either academic researchor creative activity, supervised by a faculty adviser. Students successfully completing the project, as evalutated by a three-person committee, will graduate with distinction in the major.', 'THTR', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 193HA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 193HA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 193HA', 'SR HONORS PROJECT', 'Senior honors project. Advanced thesis project in either academic research or creative activity, supervised by a faculty advisor. Students successfully completing the project, as evaluated by a three-person committee, will graduate with distinction in the major.', 'THTR', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 194A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 194A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 194A', 'GRP STD: ACT/DIRECT', 'Intensive study, research, and project preparation in acting and directing.', 'THTR', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 195') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 195';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 195', 'STAGE MANAGEMENT', 'Upper division course that builds upon the foundational   information of THTR 95, providing a greater depth and   breadth of exploration into the duties of the stage manager   from pre-production through strike. Topics include   communication, organizational skills, rehearsal procedures, and performance responsibilities. Greater stage management   practical experience gained through in-class exercises and   outside assignments.', 'THTR', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 195P') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 195P';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 195P', 'STG MANAGEMENT PRAC', 'Production oriented course allowing student practical experience in stage m anagement training. Student will serve as assistant stage manager or stagem anager for a main stage or student directed departmental production.', 'THTR', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 199', 'INDEPENDENT STUDIES', 'Independent studies in theater.', 'THTR', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 199RA', 'IND RES ASST DRAMA', 'Independent research assistance in theater. Supervised   assistance in faculty research project.', 'THTR', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 199', 'IND STUDY', 'Serious independent study in writing and literature with   consenting faculty member.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 1') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 1';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 1', 'APP TO UNIV WRIT', 'Principles of critical reading, thinking, and writing in the university. Wr iting focuses on analysis of academic discourse and development of rhetoric al strategies. Completion with a grade of C or better meets Entry Level Wri ting Requirement.', 'WRIT', '5', '[{"geCode": "SUB", "geCollege": "UCSB"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 1E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 1E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 1E', 'UNIV WRIT FOR ENGR', 'Principles of critical reading, thinking, and writing in the university. St udents analyze academic discourse, develop rhetorical strategies for exposi tion and   argument, practice examination writing, and write and revise pap ers.', 'WRIT', '4', '[{"geCode": "SUB", "geCollege": "UCSB"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 2') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 2';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 2', 'ACADEMIC WRITING', 'A writing course focusing on developing analytical skills,   synthesizing m ultiple sources, sustaining coherent   arguments, and revising for clarity of style. Reading and   writing assignments are drawn from a range of acade mic   disciplines.', 'WRIT', '5', '[{"geCode": "A1 ", "geCollege": "ENGR"}, {"geCode": "A1 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 2E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 2E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 2E', 'ACAD WRIT FOR ENGR', 'A writing course focusing on developing analytical skills, synthesizing mul tiple sources, sustaining coherent arguments, and revising for clarity of s tyle. Reading and writing assignments are drawn from a range of engineering disciplines.', 'WRIT', '4', '[{"geCode": "A1 ", "geCollege": "L&S "}, {"geCode": "A1 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 28') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 28';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 28', 'GBLR PRMS SCHL SEM', 'The Gabler Promise Scholars Writing Seminar is for selected students in the Promise Scholars Program who will take the course each quarter of their so phomore year. The course is designed to help scholars develop strategies fo r writing effectively in personal/creative, academic, and civic contexts. M entoring and support through this course is intended to support students? d evelopment as writers and enhance opportunities for success at UC Santa Bar bara and beyond.', 'WRIT', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 99', 'IND STUDIES WRITING', 'Independent studies in writing.', 'WRIT', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 105C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105C', 'WRIT CREAT NONFICT', 'Course in creative nonfiction, a prose form whose practitioners consciously merge elements of traditional fiction and nonfiction. Students get extensi ve practice in reading and composing within this genre.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105CD') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 105CD';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105CD', 'WRIT WITH CODE', 'Design and analysis of texts that integrate both writing and coding compone nts, such as video games, data visualizations, web documents, and interacti ve narratives. No prior coding experience necessary.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "ENGR"}, {"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105CR') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 105CR';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105CR', 'WRIT CULTURAL RHET', 'Writing 105CR offers students writing practice that will serve both to adva nce their undergraduate work in cultural rhetorics and to prepare them for graduate level study or professional activity relating to cultural rhetoric s. Students explore central issues and problems within cultural rhetorics s cholarship while practicing strategies for evaluating and writing short and long papers.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105G') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 105G';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105G', 'GRAMMAR STYLISTICS', 'Focuses on grammar and stylistics for professional writers and editors. The emphasis is practical and analytical, attending to issues of sentence structure and semantics and stylistics, in order to become more rhetoricall rhetorically effective writers.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105M') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 105M';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105M', 'MULTIMEDIA WRITING', 'Focuses on new modes of writing and publishing enabled by computer technolo gy. Projects involve analyzing, creating, reading about, and reflecting on multimedia writing. Students create works suitable for web or other digital formats.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105PS') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 105PS';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105PS', 'WRIT PUB SPEAKING', 'Analysis and practice of writing, researching, and delivering oral presentations for various academic and professional audiences. Course efforts focus primarily on creating clear and engaging speech scripts, multimedia support, and related presentation documents.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105R') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 105R';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105R', 'RHETORIC AND WRIT', 'Traces the history, theory, and practice of rhetoric (effective persuasion) from classical times to the modern era. Students analyze key works and app ly rhetorical strategies in written argumentation.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105SW') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 105SW';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105SW', 'SCI WRIT FOR PUBLIC', 'Focus on analyzing, practicing, and applying strategies for   communicating scientific concepts, research projects, and   findings with non-specialist audiences. Students will employ   both traditional and new media forms of communicating   scientific knowledge.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 107A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107A', 'WRIT ACCOUNTING', 'Writing practices in academic and professional accounting. Research sources include publications, databases, case studies, interviews. Assignments inc lude reports, correspondence, memorandum, presentations. Attention to criti cal thinking, research techniques, international context, use of informatio n   technology, and visual communications.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 107B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107B', 'BUS ADMIN WRIT', 'Analysis and practice in business genres that focuses on writing strategy, concise style, and visual aspects of communication. Attention to typical documents such as letters, memos, e-mail, proposals, and collaborative reports. Courses also typically integrate oral presentations, job search documents, and the use of relevant technology.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107DJ') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 107DJ';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107DJ', 'DIGITAL JOURNALISM', 'Students acquire skills in digital journalism, including writing for web an d social media using text, photo, graphics and video. The class forms an ed itorial group that covers campus events as well as profiles, interviews, bl ogs, and social media. Course work may be offered to UCSB''s College of Lett ers and Science for publication.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107G') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 107G';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107G', 'WRIT GLOBAL CAREERS', 'Analysis and practice of writing in global contexts related to business, government, and non-governmental organizations. Attention to typical formats such as formal email, proposals, job application materials, and and research reports, including a significant collaborative project. Emphasis on factors affecting international research and document design.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107J') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 107J';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107J', 'JOURNALISM WRIT', 'Analysis and practice of news writing for print, broadcast and digital media, with focus on inverted pyramid and feature style, interview techniques, background research, editing, writing to deadline, and ethical issues.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107L') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 107L';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107L', 'LEGAL WRITING', 'Practice in applying rules to facts, analyzing issues, and writing clearly, succinctly, and cogently in various forms of legal discourse such as case briefs, law essays, persuasive letters, short office memoranda, mediation and appellate briefs. Fundamentals of legal research are touched upon.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107M') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 107M';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107M', 'WRIT MAGAZINE', 'Focuses on interviews, writing, reviews, and general articles for print media, and submitting them for publication. Students learn about the audience and the demands of each genre, as well as editing skills and the rigor of deadlines.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109ED') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 109ED';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109ED', 'WRIT TEACHING PROF', 'Research, discussion, and analysis of current issues in educational theory, practice, and policy. Appropriate for prospective credential students.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109F') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 109F';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109F', 'WRIT ABOUT FILM', 'Analysis and practice of various forms of writing for film, including argumentative writing, film reviews, critical texts, and essays. Of special interest to majors in film studies, English, and social sciences.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109HP') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 109HP';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109HP', 'WRIT HEALTH PRFSSN', 'Strategy, analysis, format for various types of academic and professional writing in the health care field. Contemporary topics/issues will be the basis of study, discussion, research, and writing.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109HU') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 109HU';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109HU', 'WRIT FOR HUMANITIES', 'Writing 109HU focuses on the analysis of various forms of writing for the humanities, both academic and professional. Attention is paid to the modes of argumentation, research methods, stylistic conventions, and development of original inquiry.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109SS') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 109SS';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109SS', 'WRIT SOC SCIENCE', 'Analysis and practice of various forms of writing appropriate for primary a and secondary research in the social sciences. Research writing projects include literature reviews, research proposals, research reports, case studies, and theoretical analyses. Attention to disciplinary resources, formal conventions, and style.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109V') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 109V';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109V', 'WRIT FOR VIS ARTS', 'Description, analysis, investigation, and theorization of art and its practice. Students will engage in various forms of critical and generative writing and multimedia composition for the visual arts, such as press releases, artist statements, curatorial statements, proposals, exhibition reviews, analytical essays, and creative projects. Of special interest to majors in the arts, communications, and cultural studies.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 124') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 124';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 124', 'WEB MEDIA INTERN', 'Students work in a small team to create, maintain and distribute digital co ntent for the website and social media platforms of the Division of Humanit ies and Fine Arts, including written features, photography, videos and soci al media posts.', 'WRIT', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 131A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 131A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 131A', 'RAAB SEM', 'First course in the seminar-style year-long series for Raab Writing Fellows (WRIT 131A-B-C). Students work on individual projects while consulting wit h mentors and preparing for the year-end showcase. Classes include workshop s on research-based writing, guest lectures, and peer activities. Enrollmen t restricted to students accepted in Raab Writing Fellows program.', 'WRIT', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 160') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 160';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 160', 'WRITING CENTER CONS', 'Prepares students to tutor writing at the college level.   Students respond to tutoring scenarios, respond to each   others writing, learn to work wit h OWLS (on-line writing   labs), and prepare a resource notebook for tutori ng.', 'WRIT', '4', '[{"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 199', 'IND STUDIES WRIT', 'Writing, reading, and conference with specialized research or   focus topic.', 'WRIT', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 199RA', 'IND RSRCH ASST WRIT', 'Faculty-supervised research assistance.', 'WRIT', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT W 6R') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT W 6R';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT W 6R', 'ROME: THE GAME', 'THIS ONLINE COURSE - PRESENTED AS AN ADVENTURE GAME - INTRODUCES STUDENTS T O THE ART AND ARCHAEOLOGY OF ROME, WITH ASSIGNMENTS THAT FOCUS ON WRITING A ND THE RESEARCH PROCESS. THE COURSE ASKS STUDENTS TO DETERMINE WHETHER OR N OT A COLLECTION OF ANCIENT OBJECTS FROM AN AMERICAN MUSEUM SHOULD REMAIN IN THE US OR BE SENT BACK TO ITALY. THROUGHOUT THE COURSE, STUDENTS EXCAVATE ARTIFACTS AT A DIGITAL DIG SITE, VISIT MUSEUMS, EXPLORE ROMAN MONUMENTS, AN D NAVIGATE THE SHADOWY WORLD OF THE TOMBAROLI (TOMB ROBBERS) AND MAFIA-RUN BLACK MARKET FOR ANTIQUITIES.', 'WRIT W', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "EUR", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "F  ", "geCollege": "ENGR"}, {"geCode": "EUR", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 104A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 104A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 104A', 'PLAYWRITING WKSHP', 'An exploration of the essential components of playwriting.   Exercises focu s on writing dialogue, monologue, creating three-dimensional characters, bu ilding effective story structures, and developing action through language a nd stage images. A series of written assignments.', 'THTR', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 133B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 133B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 133B', 'HISTORY COSTUME II', 'A survey of the development of western clothing and costume from early Georgian to the present as related to the changing patterns of culture. Short survey of non-Western clothing and costume.', 'THTR', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 188S') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 188S';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 188S', 'SHAKESPEARE', 'An investigation of Shakespeare''s plays through the media of performance; viewing of Shakespearean productions on film and videotape, in calssroom rehearsal, and in stage performances as available; reading and critical analysis of selected Shakespearean plays.', 'THTR', '4', '[{"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "F  ", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 110') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 110';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 110', 'POETRY WORKSHOP', 'Students write original poems to be read and discussed in a   workshop sett ing.   Students learn the essentials of the craft of poetry as   well as st rategies to generate and revise work.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105CH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 105CH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105CH', 'WRITING FOR CHANGE', 'Students apply rhetorical strategies in a series of assignments designed to implement change. Emphasis on writing, speaking, and visuals as a means of effecting change acrosspersonal, academic, workplace, and civic contexts.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105PD') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 105PD';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105PD', 'WRIT PUB DISCOURSE', 'Introduction to writing and public discourse in local,   regional, national , and global contexts through analysis of   writing in civic contexts, poli tical activism, and public   policy. Students reflect on, and produce writt en research in   a related area of inquiry.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105S') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 105S';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105S', 'WRIT SUSTAINABILITY', 'Analysis and practice of various forms of writing that address sustainabili ty in interdisciplinary contexts. Students will research, write, and reflec t on concepts and practices of sustainability, examining the role of words and images in communicating sustainability ideas to diverse audiences.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105WE') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 105WE';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105WE', 'WRITING & ETHICS', 'Focus on ethics in writing, rhetoric, and communication. By   researching, analyzing, and composing texts related to ethics in various genres and disc iplines, students explore how writing contributes to the good life for indi viduals and   communities.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107T') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 107T';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107T', 'TECHNICAL WRITING', 'Analysis and practice in writing for technology users with attention given to task analysis, design principles, and writing strategies. Projects inclu de technology related documents such as instructions, user manuals, online documentation, and web content. Final documents suitable for professional p ortfolio.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109CS') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 109CS';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109CS', 'WRIT CHICANO/A ST', 'Analysis and practice of various forms of writing and research methods in Chicana/o Studies. Attention to strategies for argumentation, analysis, organization, and documentation used in humanities and social sciences', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109ST') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'WRIT 109ST';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109ST', 'WRIT SCIENCE/TECH', 'Analysis and practice of various forms of scientific and   technical writing,both academic and professional, such as   reports, proposals, journal articles, and abstracts.   Attention to research methods, design of papers,   development of graphics, technical style, and editing strategies.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "ENGR"}, {"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 142') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 142';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 142', 'GRAPHIC NOVEL', 'Students write and illustrate original comic scripts to be   read and discussed in a workshop setting. Students learn   the essentials of the craft of graphic novel writing as   well as strategies to generate and revise work.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 1') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 1';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 1', 'WRIT/LIT COLLOQUIUM', 'UCSB faculty working in Creative Writing, Writing Studies,   and Literary Studies present their research or creative work to expose   students to examples of topics, theories, and methods in those   disciplines.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 180B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 180B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 180B', 'AM DRAMA 1940 TO PR', 'History of the American drama and theater from 1940 to the present. Important plays, performers, institutions, and styles of production are given selective attention.', 'THTR', '4', '[{"geCode": "AMH", "geCollege": "UCSB"}, {"geCode": "F  ", "geCollege": "ENGR"}, {"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 2') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 2';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 2', 'FIRST YR COLL SEM', 'Students engage in discussions of the presentations given   in the Writing and Literature Colloquium. Focuses on introducing   the disciplines and exploring the relationships between the   material and the students? interests.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 3') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 3';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 3', 'SOPH COLL SEM', 'Students engage in discussions of the presentations given   in the Writing and Literature Colloquium. Encourages deeper   engagement with the material of the colloquium through reading of   complementary texts and exploring application of methods and theories to the   work students will commit to in the Mid-Residency Review.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 20') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 20';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 20', 'INTRO WRIT STUDIES', 'Provides an introduction to the intellectual orientation,   practices, and epistemologies of Writing Studies.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 120') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 120';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 120', 'FICTION WORKSHOP', 'Students write original works of fiction to be read and   discussed in a wo rkshop setting. Students learn the essentials of the craft of fiction writi ng as well as strategies to generate and revise work.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 130') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 130';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 130', 'CREAT NONFIC WRKSP', 'Students write original works of creative nonfiction to be   read and discu ssed in a workshop setting. Students learn the essentials of the craft of c reative nonfiction as well as strategies to generate and revise work.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 152CS') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 152CS';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 152CS', 'GENRE SCREENWRITERS', 'Examines how contemporary screenwriters have approached the adaption of nov els into film. This course involves study of story structure and full chara cter development into screenplays.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 170A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 170A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 170A', 'INTRO LIT PUB', 'Students are introduced to the art and business of literary publishing in p reparation for work on Spectrum Literary Journal and careers in writing or publishing.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 190') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 190';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 190', 'JUNIOR TUTORIAL', 'Students work independently with their faculty advisor to   develop information and expertise necessary for their   senior   portfolio. May include training in methods, apprenticeship   experience, or independent reading and coursework.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 140A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 140A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 140A', 'ADV ACTING WKSHOP I', 'Advanced exploration, performances, and criticism of scenes from a broad ra nge of dramatic scripts with focus on the actor''s perspective.', 'THTR', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'TMP 120') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'TMP 120';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'TMP 120', 'BUSINESS STRATEGY', 'An introduction to business strategy, principles and practices required for business success in the competitive market place. Students are exposed to key management theories, models and tools including competitive strategy, f inance, planning, new product development, marketing, leadership and others .', 'TMP', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'TMP 122') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'TMP 122';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'TMP 122', 'ENTREPRENEURSHIP', 'Learn how to start any type of venture; for profit, non-profit, service, so le-proprietorship, with a focus on high-tech ventures. Analysis of new busi ness opportunities, development of customer-centric value propositions, fin ancing, marketing, selling, and protection of intellectual property.', 'TMP', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'TMP 124') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'TMP 124';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'TMP 124', 'MARKETING', 'Introduces fundamental principles, processes, and tools of marketing which are used to create, communicate and deliver the value of products and servi ces to customers, clients, partners, and society. This is done with an arra y of essential topics, such as the identification of customer needs and wan ts, assessment of the competitive environment, selection of the most approp riate target opportunities, development of an integrated marketing strategy , and disciplined execution.', 'TMP', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'TMP 127') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'TMP 127';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'TMP 127', 'MANAGING TECH ORGS', 'Participating in, managing and leading successful careers, teams and organi zations. Current theories and practices concerning motivation, organization al culture, communications, effective decision making, team effectiveness a nd others are presented and discussed.', 'TMP', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'TMP 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'TMP 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'TMP 199', 'INDEPENDENT STUDIES', 'Directed individual study.', 'TMP', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'THTR 190') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'THTR 190';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'THTR 190', 'PRODUCTION ADMIN', 'Workshop for advanced students functioning as assistants to directors, designers, and technical directors. portfolio, promptbook, or paper required.', 'THTR', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 198') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2024' FROM "Course" WHERE gold_id = 'W&L CS 198';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 198', 'INTERNSHIP', 'Academic credit for professional experience with an   approved organization or individual.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2024', course_id);
    END IF;
END $$;
