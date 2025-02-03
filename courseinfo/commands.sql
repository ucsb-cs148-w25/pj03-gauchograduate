
DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'TMP 124') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'TMP 124';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'TMP 124', 'MARKETING', 'Introduces fundamental principles, processes, and tools of marketing which are used to create, communicate and deliver the value of products and servi ces to customers, clients, partners, and society. This is done with an arra y of essential topics, such as the identification of customer needs and wan ts, assessment of the competitive environment, selection of the most approp riate target opportunities, development of an integrated marketing strategy , and disciplined execution.', 'TMP', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'TMP 127') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'TMP 127';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'TMP 127', 'MANAGING TECH ORGS', 'Participating in, managing and leading successful careers, teams and organi zations. Current theories and practices concerning motivation, organization al culture, communications, effective decision making, team effectiveness a nd others are presented and discussed.', 'TMP', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 1') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'W&L CS 1';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 1', 'WRIT/LIT COLLOQUIUM', 'UCSB faculty working in Creative Writing, Writing Studies,   and Literary Studies present their research or creative work to expose   students to examples of topics, theories, and methods in those   disciplines.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 2') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'W&L CS 2';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 2', 'FIRST YR COLL SEM', 'Students engage in discussions of the presentations given   in the Writing and Literature Colloquium. Focuses on introducing   the disciplines and exploring the relationships between the   material and the students? interests.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 3') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'W&L CS 3';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 3', 'SOPH COLL SEM', 'Students engage in discussions of the presentations given   in the Writing and Literature Colloquium. Encourages deeper   engagement with the material of the colloquium through reading of   complementary texts and exploring application of methods and theories to the   work students will commit to in the Mid-Residency Review.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 4') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'W&L CS 4';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 4', 'MID RES REVIEW', 'Students present independent projects as a part of their required Mid-Resid ency Review.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 11') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'W&L CS 11';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 11', 'INTRO POETRY', 'Introduction to the craft of poetry writing. Students develop original work s of poetry to be read and discussed in a workshop setting.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 20') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'W&L CS 20';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 20', 'INTRO WRIT STUDIES', 'Provides an introduction to the intellectual orientation,   practices, and epistemologies of Writing Studies.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 120') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'W&L CS 120';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 120', 'FICTION WORKSHOP', 'Students write original works of fiction to be read and   discussed in a wo rkshop setting. Students learn the essentials of the craft of fiction writi ng as well as strategies to generate and revise work.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 130') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'W&L CS 130';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 130', 'CREAT NONFIC WRKSP', 'Students write original works of creative nonfiction to be   read and discu ssed in a workshop setting. Students learn the essentials of the craft of c reative nonfiction as well as strategies to generate and revise work.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 152CS') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'W&L CS 152CS';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 152CS', 'GENRE SCREENWRITERS', 'Examines how contemporary screenwriters have approached the adaption of nov els into film. This course involves study of story structure and full chara cter development into screenplays.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 170A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'W&L CS 170A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 170A', 'INTRO LIT PUB', 'Students are introduced to the art and business of literary publishing in p reparation for work on Spectrum Literary Journal and careers in writing or publishing.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 190') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'W&L CS 190';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 190', 'JUNIOR TUTORIAL', 'Students work independently with their faculty advisor to   develop information and expertise necessary for their   senior   portfolio. May include training in methods, apprenticeship   experience, or independent reading and coursework.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'W&L CS 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'W&L CS 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'W&L CS 199', 'IND STUDY', 'Serious independent study in writing and literature with   consenting faculty member.', 'W&L  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 1') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 1';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 1', 'APP TO UNIV WRIT', 'Principles of critical reading, thinking, and writing in the university. Wr iting focuses on analysis of academic discourse and development of rhetoric al strategies. Completion with a grade of C or better meets Entry Level Wri ting Requirement.', 'WRIT', '4', '[{"geCode": "SUB", "geCollege": "UCSB"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 1E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 1E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 1E', 'UNIV WRIT FOR ENGR', 'Principles of critical reading, thinking, and writing in the university. St udents analyze academic discourse, develop rhetorical strategies for exposi tion and   argument, practice examination writing, and write and revise pap ers.', 'WRIT', '4', '[{"geCode": "SUB", "geCollege": "UCSB"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 2') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 2';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 2', 'ACADEMIC WRITING', 'A writing course focusing on developing analytical skills,   synthesizing m ultiple sources, sustaining coherent   arguments, and revising for clarity of style. Reading and   writing assignments are drawn from a range of acade mic   disciplines.', 'WRIT', '5', '[{"geCode": "A1 ", "geCollege": "ENGR"}, {"geCode": "A1 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 2E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 2E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 2E', 'ACAD WRIT FOR ENGR', 'A writing course focusing on developing analytical skills, synthesizing mul tiple sources, sustaining coherent arguments, and revising for clarity of s tyle. Reading and writing assignments are drawn from a range of engineering disciplines.', 'WRIT', '4', '[{"geCode": "A1 ", "geCollege": "L&S "}, {"geCode": "A1 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 28') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 28';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 28', 'GBLR PRMS SCHL SEM', 'The Gabler Promise Scholars Writing Seminar is for selected students in the Promise Scholars Program who will take the course each quarter of their so phomore year. The course is designed to help scholars develop strategies fo r writing effectively in personal/creative, academic, and civic contexts. M entoring and support through this course is intended to support students? d evelopment as writers and enhance opportunities for success at UC Santa Bar bara and beyond.', 'WRIT', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 99', 'IND STUDIES WRITING', 'Independent studies in writing.', 'WRIT', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 105C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105C', 'WRIT CREAT NONFICT', 'Course in creative nonfiction, a prose form whose practitioners consciously merge elements of traditional fiction and nonfiction. Students get extensi ve practice in reading and composing within this genre.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105CD') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 105CD';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105CD', 'WRIT WITH CODE', 'Design and analysis of texts that integrate both writing and coding compone nts, such as video games, data visualizations, web documents, and interacti ve narratives. No prior coding experience necessary.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "ENGR"}, {"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105CR') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 105CR';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105CR', 'WRIT CULTURAL RHET', 'Writing 105CR offers students writing practice that will serve both to adva nce their undergraduate work in cultural rhetorics and to prepare them for graduate level study or professional activity relating to cultural rhetoric s. Students explore central issues and problems within cultural rhetorics s cholarship while practicing strategies for evaluating and writing short and long papers.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105G') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 105G';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105G', 'GRAMMAR STYLISTICS', 'Focuses on grammar and stylistics for professional writers and editors. The emphasis is practical and analytical, attending to issues of sentence stru cture and diction, and on the diversity of styles, formats, and audiences.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105M') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 105M';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105M', 'MULTIMEDIA WRITING', 'Focuses on new modes of writing and publishing enabled by computer technolo gy. Projects involve analyzing, creating, reading about, and reflecting on multimedia writing. Students create works suitable for web or other digital formats.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105PS') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 105PS';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105PS', 'WRIT PUB SPEAKING', 'Analysis and practice of writing, researching, and delivering oral presenta tions including speech scripts, visual aids, and various related documents. Typical formats include extemporaneous speech and impromptu address for sp ecific audiences and purposes.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105R') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 105R';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105R', 'RHETORIC AND WRIT', 'Traces the history, theory, and practice of rhetoric (effective persuasion) from classical times to the modern era. Students analyze key works and app ly rhetorical strategies in written argumentation.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105SW') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 105SW';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105SW', 'SCI WRIT FOR PUBLIC', 'Focus on analyzing, practicing, and applying strategies for   communicating scientific concepts, research projects, and   findings with non-specialist audiences. Students will employ   both traditional and new media forms of communicating   scientific knowledge.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 105WC') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 105WC';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 105WC', 'WRIT IN COMMUNITY', 'Analysis and practice of various forms of community-based   writing (such a s reports and proposals) by and for local   groups that promote the social good. Attention is paid to   direct interaction with the community, researc h,   metacognitive awareness, genre awareness, and writing   conventions.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 107A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107A', 'WRIT ACCOUNTING', 'Writing practices in academic and professional accounting. Research sources include publications, databases, case studies, interviews. Assignments inc lude reports, correspondence, memorandum, presentations. Attention to criti cal thinking, research techniques, international context, use of informatio n   technology, and visual communications.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 107B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107B', 'BUS ADMIN WRIT', 'Analysis and practice in business genres that focus on writing strategy, co ncise style, and visual aspects of communication. Attention to typical docu ments such as letters, memos, e-mail, proposals, and collaborative reports.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107DJ') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 107DJ';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107DJ', 'DIGITAL JOURNALISM', 'Students acquire skills in digital journalism, including writing for web an d social media using text, photo, graphics and video. The class forms an ed itorial group that covers campus events as well as profiles, interviews, bl ogs, and social media. Course work may be offered to UCSB''s College of Lett ers and Science for publication.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107G') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 107G';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107G', 'WRIT GLOBAL CAREERS', 'Analysis and practice of writing in global contexts related to business, government, and non-governmental organizations. Attention to typical format s   such as letters, email, proposals, and various collaborative reports. E mphasis on   linguistic and cultural factors affecting international resear ch and document   design.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107J') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 107J';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107J', 'JOURNALISM WRIT', 'Analysis and practice of news writing for print and broadcast   with focus on   inverted pyramid style, interview techniques, background   research, e diting,   writing to deadline, and ethical issues.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107L') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 107L';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107L', 'LEGAL WRITING', 'Practice in applying rules to facts, analyzing issues, and writing clearly, succinctly, and cogently in various forms of legal discourse such as cas e briefs,   law essays, letters, short office memoranda, and appellate brie fs. Fundamentals   of legal research are touched upon.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107M') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 107M';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107M', 'WRIT MAGAZINE', 'Focuses on writing interviews, reviews, and general articles for print medi a, and submitting them for publication. Students learn about audience and t he demands of each genre, as well as editing skills and the tyranny of dead lines.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 107WC') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 107WC';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 107WC', 'WRIT WEB CONTENT', 'Analysis and practice with strategies underlying creation   of Web 2.0 cont ent. Students will create common content   modalities that may include webs ites, blogs, email   newsletters, and social media as used in professional contexts.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109ED') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 109ED';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109ED', 'WRIT TEACHING PROF', 'Research, discussion, and analysis of current issues in educational theory, practice, and policy. Appropriate for prospective credential students.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109F') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 109F';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109F', 'WRIT ABOUT FILM', 'Analysis and practice of various forms of writing for film, including argumentative writing, film reviews, and essays of special interest to majors in film studies, english, and social studies.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109GS') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 109GS';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109GS', 'WRIT & GENDER ST', 'Students research and analyze writing and rhetoric with a particular focus on the methods and theories of gender studies. Attention to strategies for argumentation, analysis, organization, and documentation used in humanities and social sciences. Writing projects incorporate interdisciplinary and mu ltimedia sources.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109HP') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 109HP';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109HP', 'WRIT HEALTH PRFSSN', 'Strategy, analysis, format for various types of academic and professional writing in the health care field. Contemporary topics/issues will be the basis of study, discussion, research, and writing.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}, {"geCode": "A2 ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109HU') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 109HU';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109HU', 'WRIT FOR HUMANITIES', 'Analysis of various forms of writing for the humanities, both academic and professional. Attention to modes and methods of argumentation, research methods, design of papers, stylistic clarity, and editing strategies.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109SS') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 109SS';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109SS', 'WRIT SOC SCIENCE', 'Analysis and practice of various forms of writing for the social sciences, including qualitative/ethnographic, quantitative, interpretive, and theoretical. Writing projects such as literature reviews, proposals, case studies, scientific reports, interviews. Attention to disciplinary resources, formal conventions, graphics, and style.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 109V') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 109V';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 109V', 'WRIT FOR VIS ARTS', 'Analysis and practice of various forms of writing for the visual arts, including reviews of film and art shows, grant proposals, and professional resumes. Of special interest to majors in the arts.', 'WRIT', '4', '[{"geCode": "A2 ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 124') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 124';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 124', 'WEB MEDIA INTERN', 'Students work in a small team to create, maintain and distribute digital co ntent for the website and social media platforms of the Division of Humanit ies and Fine Arts, including written features, photography, videos and soci al media posts.', 'WRIT', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 131A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 131A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 131A', 'RAAB SEM', 'First course in the seminar-style year-long series for Raab Writing Fellows (WRIT 131A-B-C). Students work on individual projects while consulting wit h mentors and preparing for the year-end showcase. Classes include workshop s on research-based writing, guest lectures, and peer activities. Enrollmen t restricted to students accepted in Raab Writing Fellows program.', 'WRIT', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 160') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 160';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 160', 'WRITING CENTER CONS', 'Prepares students to tutor writing at the college level.   Students respond to tutoring scenarios, respond to each   others writing, learn to work wit h OWLS (on-line writing   labs), and prepare a resource notebook for tutori ng.', 'WRIT', '4', '[{"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 199', 'IND STUDIES WRIT', 'Writing, reading, and conference with specialized research or   focus topic.', 'WRIT', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT 199RA', 'IND RSRCH ASST WRIT', 'Faculty-supervised research assistance.', 'WRIT', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'WRIT W 6R') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '4', '2023' FROM "Course" WHERE gold_id = 'WRIT W 6R';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'WRIT W 6R', 'ROME: THE GAME', 'THIS ONLINE COURSE - PRESENTED AS AN ADVENTURE GAME - INTRODUCES STUDENTS T O THE ART AND ARCHAEOLOGY OF ROME, WITH ASSIGNMENTS THAT FOCUS ON WRITING A ND THE RESEARCH PROCESS. THE COURSE ASKS STUDENTS TO DETERMINE WHETHER OR N OT A COLLECTION OF ANCIENT OBJECTS FROM AN AMERICAN MUSEUM SHOULD REMAIN IN THE US OR BE SENT BACK TO ITALY. THROUGHOUT THE COURSE, STUDENTS EXCAVATE ARTIFACTS AT A DIGITAL DIG SITE, VISIT MUSEUMS, EXPLORE ROMAN MONUMENTS, AN D NAVIGATE THE SHADOWY WORLD OF THE TOMBAROLI (TOMB ROBBERS) AND MAFIA-RUN BLACK MARKET FOR ANTIQUITIES.', 'WRIT W', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "EUR", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "F  ", "geCollege": "ENGR"}, {"geCode": "EUR", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('4', '2023', course_id);
    END IF;
END $$;
