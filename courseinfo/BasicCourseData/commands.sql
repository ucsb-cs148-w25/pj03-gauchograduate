
DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 99', 'INDEPENDENT STUDIES', 'Introduction to research in Anthropology. Independent research under the guidance of a faculty member in the department. Course offers exceptional students the opportunity to undertake independent research or work in a research group.', 'ANTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 133') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 133';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 133', 'CULT DEVEL MESOAMER', 'The rise and fall of various ancient civilizations such as those of the Maya, Aztecs, Toltecs, Teotihuacanos, and Olmec as well as their cultural antecedents. This course uses self-paced audiovisual modules as well as traditional lecture format.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 183') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 183';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 183', 'INTERN ARCH RES MGT', 'Interns serve as assistants or trainees in the archaeological programs of a governmental agency, a museum, or a private firm in the local area. In collaboration with the instructor and an extramural archaeologist, the student conceives a set of activities for the internship.', 'ANTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 198') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 198';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 198', 'INDEP READINGS ANTH', 'Intended for students who know their own reading needs. Normally requires regular meeting with the instructor.', 'ANTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 199RA', 'RESEARCH TRAINING', 'Student gains research experience through assisting faculty member in research project.', 'ANTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART CS 107') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART CS 107';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART CS 107', 'HIST THEORY & CRIT', 'Non-studio emphasis on historical, theoretical, and contemporary ideas and issues. A range of concepts will be discussed, from various approaches,according to the particular interests of faculty and students.', 'ART  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART CS 112') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART CS 112';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART CS 112', 'SPECIAL TOPICS', 'This special studies course allows faculty to design and execute courses that reflect their particular research and teaching.', 'ART  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART CS 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART CS 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART CS 199', 'INDEPENDENT STUDIES', 'Serious independent study in art with consenting faculty member.', 'ART  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 6B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 6B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 6B', 'SURVEY II: REN-BAR', 'Renaissance and baroque art in Northern and Southern Europe.', 'ARTHI', '4', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "EUR", "geCollege": "ENGR"}, {"geCode": "EUR", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "E1 ", "geCollege": "ENGR"}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "F  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 6G') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 6G';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 6G', 'SUR HIST OF PHOTOG', 'A critical survey of nineteenth and twentieth century photography as an art form.', 'ARTHI', '4', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "F  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 5') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 5';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 5', 'INTRO ASIAN AM LIT', 'Selected major themes in literary texts from Asian American communities, including Japanese, Chinese, Korean, Filipino and Southeast Asian Americans: dislocation/relocation; finding/inventing a usable past; poetics/politics in language; identities/ethnicities.', 'AS AM', '4', '[{"geCode": "G  ", "geCollege": "L&S "}, {"geCode": "G  ", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "CRST"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ASTRO 1') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ASTRO 1';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ASTRO 1', 'BASIC ASTRONOMY', 'A survey of the development of astronomy with an emphasis on understanding the observable properties of the solar system, the sun and other stars, our own and other galaxies, and the entire universe. Topics of current interes t will be discussed as time permits.', 'ASTRO', '4', '[{"geCode": "QNT", "geCollege": "L&S "}, {"geCode": "C  ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BIOL CS 101') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BIOL CS 101';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BIOL CS 101', 'MODEL & EXPERIMENTS', 'Interplay between models and experimentation in the development of an understanding of the principles of biology.', 'BIOL CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BIOL CS 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BIOL CS 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BIOL CS 199', 'INDEPENDENT STUDIES', 'Serious independent study in biology with consenting faculty member.', 'BIOL CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 152') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 152';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 152', 'MUSIC AFR DIASPORA', 'A survey of select African derived musical traditions from the Caribbean, North and South America, and Africa.', 'BL ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BMSE 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BMSE 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BMSE 199', 'INDEPENDENT STUDIES', 'Hours and credit arranged with any member of the staff. Laboratory.', 'BMSE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 30H') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 30H';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 30H', 'COM LIT 30H HON SEC', 'Seminar course for honors students enrolled in Comparative Literature 30 designed to enrich the large lecture experience and to supplement the weekly seminar meetings. May include additional readings, more intensive study of syllabus selections, and supplemental writings.', 'C LIT', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 99', 'INTRO. TO RESEARCH', 'Directed study, normally experimental, to be arranged with individual faculty members. Course offers exceptional students an opportunity to participate in a research group.', 'CH E', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 1B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 1B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 1B', 'INTRO CHICANO/A STD', 'Introduction to the historical and contemporary development of the Chicano/ a community. Course is interdisciplinary in nature. Focuses by quarter on A . history, B. gender, and C. culture.', 'CH ST', '4', '[{"geCode": "AMH", "geCollege": "UCSB"}, {"geCode": "ETH", "geCollege": "CRST"}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "D  ", "geCollege": "ENGR"}, {"geCode": "D  ", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 158') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 158';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 158', 'SPKN WRD ART PERFRM', 'Spoken wor(ld) art performance activism (SWAPA) introduces students to a method for reading, writing, thinking, and performing before an audience of peers. This method is based on the shaman-witness ritual proposed by Chicana theorist and writer, Gloria Anzaldua.', 'CH ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 158L') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 158L';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 158L', 'SPKN WRD ART PERFRM', 'Accompanies Spoken Word Art Performance Activism (SWAPA) course. Focuses on creative production, atriculation, and vocal expression.', 'CH ST', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 199', 'INDEPENDENT STUDIES', 'Independent studies in Chicana/o students under the guidance of a faculty member in the department. Students wishing to enroll should prepare a short plan of study.', 'CH ST', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 199RA', 'IND RESEARCH ASST', 'Coursework consists of faculty supervised research assistance.', 'CH ST', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 2B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 2B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 2B', 'GEN CHEM - HONORS', 'Thermodynamics (first and second law), electrochemistry, chemical kinetics, atomic and molecular structure, and chemical bonding.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 99', 'INTRO TO RESEARCH', 'Directed study, normally experimental, to be arranged with individual faculty members. Course offers exceptional students an opportunity to participate in a research group. Basic techniques and the operation of instruments used in research. A few students in chemistry are quite advanced having had extensive laboratory training in high school or elsewhere. This course allows them the opportunity to participate in a research group before they acquire 84 units and are then eligible for and capable of handling 199, Independent Studies.', 'CHEM', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 113AL') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 113AL';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 113AL', 'PHYSICAL CHEM LAB', 'Lecture: instrumental techniques, data analysis, error analysis, instruction in Mathematica-R. Laboratory: Mathematica-R, a symbolic programming language, is taught in the computer laboratory.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 124') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 124';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 124', 'ORG SPECT ANALYS', 'Structure determination of complex organic molecules. Topics covered include NMR, IR, UV, and mass spectrometry.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 171') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 171';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 171', 'BIOINORGANIC CHEM', 'Selected topics in bioinorganic chemistry, and metallo-biochemistry. Discussions of metalloproteins and corresponding model compound investigations. Emphasis will be on reaction mechanisms and spectroscopy or properties of metal sites.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 184') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 184';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 184', 'CHEM LITERATURE', 'Lectures and exercises on the literature and other information resources of use in chemistry.', 'CHEM', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 192') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 192';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 192', 'HONORS RESEARCH', 'Independent research project carried out under the supervision of faculty member. Goal is to write an original, publishable, research paper. The project can be on a topic of the student''s choice, or it can be an extension of an ongoing research project under the direction of a faculty member in the department.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 196') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 196';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 196', 'SPECIAL TOPICS', 'Special topics and courses as a means of meeting special   curriculum needs.', 'CHEM', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM CS 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM CS 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM CS 199', 'INDEPENDENT STUDIES', 'Serious independent study in chemistry with consenting faculty member.', 'CHEM CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 2') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 2';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 2', 'ELEM MODRN CHINESE', 'Continuation of Chinese 1.', 'CHIN', '5', '[{"geCode": "H  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 5') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 5';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 5', 'INTERM MODRN CHINES', 'Continuation of Chinese 4.', 'CHIN', '5', '[{"geCode": "B  ", "geCollege": "L&S "}, {"geCode": "H  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 198') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 198';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 198', 'READINGS IN CHINESE', 'Readings in Chinese.', 'CHIN', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CLASS 40') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CLASS 40';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CLASS 40', 'GREEK MYTHOLOGY', 'Introduction to the principal myths of ancient Greece and the ways in whichthese myths have been understood. Format and readings vary.', 'CLASS', '4', '[{"geCode": "G  ", "geCollege": "L&S "}, {"geCode": "G  ", "geCollege": "ENGR"}, {"geCode": "EUR", "geCollege": "L&S "}, {"geCode": "EUR", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CLASS 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CLASS 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CLASS 99', 'INTRO TO RESEARCH', 'Directed study, oriented toward research, to be arranged with individual faculty members. Course offers exceptional students an opportunity to participate in a research project or group.', 'CLASS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CLASS 171') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CLASS 171';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CLASS 171', 'GREEK ARCH & LIT', 'A survey of the archaeological record and literature of early Greece from the Late Bronze Age to the end of the Archaic Age, with special attention paid to the interconnection of artifact and text for our understanding of this period.', 'CLASS', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "EUR", "geCollege": "L&S "}, {"geCode": "EUR", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CLASS 198') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CLASS 198';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CLASS 198', 'SPECIAL READINGS', 'Individual or small group reading and study in subjects not included in theregular curriculum.', 'CLASS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CLASS 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CLASS 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CLASS 199', 'INDEPENDENT STUDIES', 'Independent study in areas in which both Greek and Latin are necessary.', 'CLASS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CLASS 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CLASS 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CLASS 199RA', 'INDEPEND. RESEARCH', 'To cooperate on an active basis with a professor on a research project involving the Classics.', 'CLASS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 190A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 190A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 190A', 'SP TOP: FOUNDATIONS', 'These variable unit courses provide for the study of topics of current interest in computer science.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 190B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 190B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 190B', 'SOFTWARE SYSTEMS', 'These variable unit courses provide for the study of topics of current interest incomputer science.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 193') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 193';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 193', 'INTERN IN INDUSTRY', 'Special projects for selected students. Offered in conjunction with selected industrial and research firms and under direct faculty supervision. Written proposal and final report required.', 'CMPSC', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 196') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 196';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 196', 'UNDERGRAD RESEARCH', 'Research opportunities for undergraduate students. Students will be expected to giveregular oral presentations, actively participate in a weekly seminar, and prepare at least one written report on their research.', 'CMPSC', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 181A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 181A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 181A', 'SENIOR HONORS THES', 'Independent work with faculty sponsor culminating in senior thesis.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 114') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 114';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 114', 'MED EFFECTS SOC', 'Examines the role that mass media institutions play in   society. The history and functions of various media are   explored from contrasting social and political viewpoints,   with empirical theory and research used where possible to   support and/or challenge these viewpoints.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 94') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 94';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 94', 'GROUP STUDIES-DANCE', 'Group studies in selected areas of emphasis.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 149') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 149';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 149', 'DANCE WORKSHOP', 'Projects in performance, production, choreography, and directing.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 186') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 186';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 186', 'DANCE PRODUCTION', 'Exploration of the process of collaboration between dance choreographers and theatre designers in the development of designs for dance productions. Final project will be a public performance of the choreographers'' and designers'' work.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 193H') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 193H';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 193H', 'SR HONORS PROJECT', 'Senior honors project. Advanced thesis project in either academic research or creative activity, supervised by a faculty advisor. Students successfully completing the project, as evaluated by a three-person committee, will graduate with distinction in the major.', 'DANCE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 193HB') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 193HB';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 193HB', 'SR HONORS PROJECT', 'Senior honors project. Advanced thesis project in either academic research or creative activity, supervised by a faculty advisor. Students successfully completing the project, as evaluated by a three-person committee, will graduate with distinction in the major.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 194') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 194';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 194', 'GROUP STUD IN DANCE', 'Group projects in selected areas of emphasis.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 199', 'INDEPENDENT STUDIES', 'Independent study in dance. Projects in choreography or dance research.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EACS 4A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EACS 4A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EACS 4A', 'EAST ASIAN PRE-MOD', 'An introduction to the social structures, institutions, systems of thought and belief, and the arts and entertainments of China and Japan during the pre-modern period.', 'EACS', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "NWC", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EACS 5') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EACS 5';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EACS 5', 'INTRO TO BUDDHISM', 'The historical and cross-cultural exploration of Buddhism through the examination of basic texts, institutions, and practices of diverse Buddhist traditions.', 'EACS', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "NWC", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 144') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 144';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 144', 'ELECTRO FLD & WAVES', 'Waves on transmission lines, Maxwell''s equations, skin effect, propagation and reflection of electromagnetic waves, microwave integrated circuit principles, metal and dielectric waveguides, resonant cavities, antennas. Microwave and optical device examples and experience  with modern microwave and CAD software.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 178') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 178';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 178', 'INTRO DIG IMAGE', 'Basic concepts in image and video processing. Topics include image formation and sampling, image transforms, image enhancement, and image and video compression including JPEG and MPEG coding standards.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 192') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 192';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 192', 'PROJ ELECT COMP ENG', 'Projects in electrical and computer engineering for advanced undergraduate students.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 193') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 193';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 193', 'INTERN IN INDUSTRY', 'Special projects for selected students. Offered in conjunction with engineering practice in selected industrial and research firms, under direct faculty supervision.', 'ECE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 194E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 194E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 194E', 'GROUP STUDIES ECE', 'Group studies intended for small number of advanced students who share an interest in a topic not included in the regular departmental curriculum.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 196') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 196';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 196', 'UNDERGRAD RESEARCH', 'Research opportunities for undergraduate students. students will be expected to give regular oral presentations, actively participate in a weekly seminar, and prepare at least one written report on their research.', 'ECE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 199', 'IND STUD-ECE', 'Directed individual study, normally experimental.', 'ECE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 173') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 173';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 173', 'INTR LEADERSHIP DEV', 'This course is an overview of theoretical constructs and practical applications of leadership. Through lectures, readings, discussions, and projects, the course will assist students in developing individual approaches to effective leadership.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 176B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 176B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 176B', 'PRACT INDIV DIFFER', 'Students study and discuss important educational policy issues while tutoring with elementary school students with learning problems in mathematics, reading, and language development.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EEMB 2Z') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EEMB 2Z';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EEMB 2Z', 'SELECT TOPICS 2', 'Designed for transfer students who have completed part of EEMB 2 through transfer work. Topics will be selected by the department, as appropriate, to fulfill the introductory biology requirement at UCSB.', 'EEMB', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 111') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 111';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 111', 'INTR CHILD/ADOL DEV', 'An introductory course on the development of children from infancy to adolescence. Examines developmental changes and basic developmental theories (e.g., Piaget, Vygotsky) in four general areas: cognitive, social, language, and physical development. Fulfills TEP developmental course prerequisite or Education minor.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 132J') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 132J';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 132J', 'MODERN ARAB ART', 'Explores modern and contemporary art, artists and art movements of the Arab world from nineteenth century to the present.', 'ARTHI', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 130B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 130B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 130B', 'SIGNAL ANALYSIS', 'Analysis of discrete time linear systems in the time and frequency domains. Z transforms, Discrete Fourier transforms. Sampling and aliasing.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 138') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 138';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 138', 'AFR REL IN THE AMER', 'A study of Neo-African religions in the Americas, with special emphasis on Haitian Vodou. Beliefs, myths, philosophical perspectives, moral order, rituals and practices as well as social and political dynamics are examined in various contemporary religious communities. Women''s roles and sexuality issues are also explored.', 'BL ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 196') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 196';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 196', 'UNDERGRAD RESEARCH', 'Research opportunities for undergraduate students. Students are expected to   give regular oral presentations, actively participate in a weekly seminar, and   prepare at least one written report on their research.', 'CH E', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 1AL') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 1AL';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 1AL', 'GEN CHEMISTRY LAB', 'Qualitative and quantitative measurements to develop laboratory technique and demonstrate the basic concepts of stoichiometry, chemical bonding, gas laws, chemical equilibrium, and acid-base chemistry.', 'CHEM', '2', '[{"geCode": "C  ", "geCollege": "L&S "}, {"geCode": "QNT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 197HB') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 197HB';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 197HB', 'HONORS RESEARCH', 'Independent research comprising the bulk of the data acquisition and organization for the honors project.', 'CH ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CLASS 195A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CLASS 195A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CLASS 195A', 'HONORS THESIS', 'Research and writing of a senior thesis paper under the close supervision of a Classics faculty member.', 'CLASS', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 121') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 121';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 121', 'COLLOID/BIOSURFACES', 'Basic forces and interactions between atoms, molecules, small particles and   extended surfaces. Special features and interactions associated with (soft)   biological molecules, biomaterials and surfaces: lipids, proteins, fibrous   molecules (DNA), biological membranes, hydrophobic and hydrophilic   interactions, bio-specific and non-equilibrium interactions.', 'CH E', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 4') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 4';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 4', 'CRITICAL INTRO RACE', 'Examines historical and contemporary manifestations of racism and anti-racism, as well as theoretical approaches to understand the social, cultural, political and economic aspects of race.', 'BL ST', '4', '[{"geCode": "D  ", "geCollege": "ENGR"}, {"geCode": "D  ", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "CRST"}, {"geCode": "ETH", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BIOL CS 20') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BIOL CS 20';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BIOL CS 20', 'CCS INTRO BIO II', 'Lecture, field and laboratory activities explore the evolutionary origin and diversification of life in a phylogenetic context, from bacteria and archaea to plants, fungi and animals.', 'BIOL CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 123') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 123';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 123', 'CULTURE, DEV, EDUC', 'An examination of culturally constructed beliefs, attitudes, and values. Course examines how culture shapes human development, behavior, and interpersonal relations in culturally pluralistic environments, with an emphasis on educational settings.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 199', 'INDEPENDENT STUDIES', 'Independent studies in communication.', 'COMM', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 117') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 117';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 117', 'BORDERLANDS', 'The theoretical concept of "borderlands" examined through a discussion of the societies, economics and cultures that form on geopolitical borders. The Mexico-U.S. border will be discussed in detail.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 116A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 116A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 116A', 'MYTH, RITUAL, SYMB', 'Uses ethnographic case studies, films and performance videos to explore myth, ritual, and symbolism cross-culturally. Compares and contrasts the symbolic dimensions of gender and ethnic identity, world view, social and political organization and change in different societies.', 'ANTH', '4', '[{"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CNCSP 112') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CNCSP 112';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CNCSP 112', 'POSITIVE PSYCH', 'Positive Psychology examines how people live life well.  It   looks at those factors associated with living a happy,   meaningful life. Course examines key concepts that include   hope, gratitude, grit and optimism to promote well-being   and authentic happiness.', 'CNCSP', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 147') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 147';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 147', 'WATER AND SOCIETY', 'Covers the longstanding debate over the relation between irrigation and state   formation, as well as current developments in the study of water and society.   Emphasis is placed on people living in arid and semi-arid environments.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 1BL') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 1BL';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 1BL', 'GEN CHEMISTRY LAB', 'Qualitative and quantitative measurements to develop laboratory technique and demonstrate basic concepts of thermochemistry, electrochemistry, chemical kinetics and atomic spectroscopy.', 'CHEM', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 1CL') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 1CL';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 1CL', 'GEN CHEMISTRY LAB', 'Qualitative and quantitative measurements to develop laboratory technique and demonstrate the basic concepts of solutions, intermolecular forces, colligative properties, and synthetic organic inorganic chemistry.', 'CHEM', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 145B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 145B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 145B', 'COMM ELECTRONICS II', 'RF models for CMOS and BJT. Discrete vs. IC implementation. On-chip passive   components. LNAs. PAs. T/R switches. Mixers. VCOs. Poly-phase filters Radio   link budget. Analog and digital modulation schemes. Introduction to receiver   architectures. I&Q modulation. Image-reject architectures.', 'ECE', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 2') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 2';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 2', 'INTRO CULT ANTHRO', 'The nature of culture: survey of the range of cultural phenomena, including material culture, social organization, religion, and other topics.', 'ANTH', '4', '[{"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "D  ", "geCollege": "ENGR"}, {"geCode": "D  ", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 180B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 180B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 180B', 'CHEM ENGINEER LAB', 'Experiments in mass transfer, reactor kinetics, process control, and chemical   and biochemical processing. Analysis of results, and preparation of reports.', 'CH E', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 20') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 20';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 20', 'GEOL CATASTROPHES', 'Course deals with geologic catastrophes, e.g., earthquakes, vocanic eruptions, tsunamis, and landslides. Students will learn the basic physicalcauses of these naturally occurring events and discuss the consequences.', 'EARTH', '4', '[{"geCode": "C  ", "geCollege": "L&S "}, {"geCode": "QNT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 30') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 30';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 30', 'HISTORY OF LIFE', 'Examination of the geological and biological processes affecting the evolution of life on Earth from 3.8 billion years ago to the present. Strong emphasis on the nature of the "scientific method" as a way of understanding natural history.', 'EARTH', '4', '[{"geCode": "C  ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 141') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 141';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 141', 'PLANT PALEOBIOLOGY', 'Examination of the history of land plants; the systematics, morphology, and phylogeny of major groups. Major evolution and biogeographic patterns.', 'EARTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 141L') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 141L';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 141L', 'PLANT PALEO LAB', 'Anatomy, morphology, and systematics of fossil plants from the specimens.', 'EARTH', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 198') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 198';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 198', 'READINGS IN GEOL SC', 'Critical reviews and discussions of selected geological subjects.', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 99', 'IND STUDIES', 'Independent study under the guidance of a faculty member in the department. Course offers students the opportunity to undertake independent study or work in a group.', 'CH ST', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CNCSP 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CNCSP 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CNCSP 199', 'INDEPEN STUDENTS', 'Study of special problems in various fields of Applied   Psychology.', 'CNCSP', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CNCSP 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CNCSP 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CNCSP 199RA', 'INDEP RES ASST', 'Faculty supervised research assistance.', 'CNCSP', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 151T') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 151T';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 151T', 'EVOLUTIONARY PSYCH', 'Surveys evolutionary psychology, examining traditional psychological topics through Darwinian lenses. Traditional psychology answers mechanistic questions about how perception, emotion, cognition, development and social interactions work. Evolutionary psychology addresses the complementary functional question of why they work the way they do.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 157') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 157';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 157', 'AS AM  EDUCATION', 'A historical and sociological examination of the effects of race and power on Asian American educational experiences. The role of critical pedagogy in the creation of knowledge. The development and impact of ethnic studies and the model minority image.', 'AS AM', '4', '[{"geCode": "D  ", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "D  ", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "CRST"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 158') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 158';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 158', 'AS AM AESTHETICS', 'Questions, arguments and ideas regarding Asian American aesthetics.  How can we apply traditional western concepts such as beauty, the sublime, and the imagination when considering Asian American cultural production? Explores the employment of realism, modernism and postmodernism across different genres.', 'AS AM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 99', 'INDEPENDENT STUDIES', 'Independent study in dance. Projects in pedagogy, choreography or dance research.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 199', 'INDEPENDENT STUDIES', 'Independent study of topics not covered in the regular curriculum under theguidance of approved faculty member.', 'AS AM', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 100CC') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 100CC';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 100CC', 'FILIPINO AMERICANS', 'The historical and contemporary experiences of specific Asian ethnic groups: Filipino Americans.', 'AS AM', '4', '[{"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "CRST"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EACS 197') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EACS 197';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EACS 197', 'SR HONORS  PROJECT', 'An independent study project (1-2 quarters) directed by a   faculty member with a carefully chosen topic and bibliography which will result in a documented project or a senior thesis.', 'EACS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 3AH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 3AH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 3AH', 'FIN ACCTG - HONORS', 'Students receive one unit for the honors seminar.  Intended for highly motivated and well prepared students.', 'ECON', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 197') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 197';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 197', 'RESEARCH SEMINAR', 'Directed field research or writing seminar on a topic in Black Studies.', 'BL ST', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 199', 'INDEPENDENT STUDIES', 'Independent studies in Black Studies.', 'BL ST', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 199RA', 'INDEP RESEARCH ASST', 'Coursework shall consist of faculty supervised research   assistance.', 'BL ST', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 162') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 162';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 162', 'PROGRAM LANGUAGES', 'Concepts of programming languages: scopes, parameter   passing, storage management; control flow, exception   handling; encapsulation and modularization mechanisms;   reusability through genericity and inheritance; type   systems; programming paradigms (imperative, object-oriented,   functional, and others). Emerging programming languages and   their development infrastructures.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 7') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 7';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 7', 'INTRO CARIB STUDIES', 'A survey of the culture and society of the Caribbean. After surveying Amerindian communities and examining the impact of the Atlantic slave trade, focus will be on slavery, emancipation, African and Creole cultures,and the issues accompanying an independent nationhood status.', 'BL ST', '4', '[{"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "NWC", "geCollege": "ENGR"}, {"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 136') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 136';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 136', 'BLACK FEM THOUGHT', 'Examines past and contemporary scholarship in Black feminist thought. By examining the intervention of Black feminist thought within mainstream feminist theory and the field of Black Studies, this course presents a critical examination of the theoretical and practical contributions of Black feminist scholars.', 'BL ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 15A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 15A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 15A', 'FUND OF LOGIC DES', 'Boolean algebra, logic of propositions, minterm and maxterm   expansions, Karnaugh maps, Quine-McCluskey method, melti-level circuits, combinational   circuit design and simulation, multiplexers, decoders, programmable logic   devices.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 3BH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 3BH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 3BH', 'FIN ACCTG - HONORS', 'Students receive one unit for the honors seminar.  Intended for highly motivated and well prepared students.', 'ECON', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 118H') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 118H';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 118H', 'ACCTG ANAL HONORS', 'Students receive one unit for the honors seminar.  Intended   for highly motivated and well prepared students.', 'ECON', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 132AH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 132AH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 132AH', 'AUDITING - HONORS', 'Students receive one unit for the honors seminar.  Intended   for highly motivated and well prepared students.', 'ECON', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 30B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 30B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 30B', 'MAJ WORKS-EUROP LIT', 'A survey of European literature. Renaissance and Neoclassical   literature from Petrarch to Diderot.', 'C LIT', '4', '[{"geCode": "EUR", "geCollege": "ENGR"}, {"geCode": "EUR", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "E1 ", "geCollege": "ENGR"}, {"geCode": "G  ", "geCollege": "ENGR"}, {"geCode": "G  ", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 96') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 96';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 96', 'HONORS SEMINAR', 'Small seminar class that gives sophomores interested in   pursuing economic research the opportunity to read and discuss   selected economics texts and research papers. The objective is   to expose students to a wide range of research topics in order   to give them a flavor of the research opportunities available.', 'ECON', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 116A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 116A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 116A', 'INDUST ORG PRIN', 'Analysis of competition, monopolistic competition, oligopoly, and monopoly theories and practices.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 130') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 130';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 130', 'PUBLIC FINANCE', 'Fiscal theory and policy. Incidence and effects of taxation, government expenditure programs, and benefit cost analysis.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 139') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 139';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 139', 'ADVANCED ACCOUNTING', 'Accounting for business combinations and preparation of consolidated financial statements, principles of fund accounting (governmental and non-profit entities), foreign currency translation and transactions, partnership formation, operation, and liquidation.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 174') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 174';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 174', 'NEGOTIATIONS', 'Applied theories as guides to improving negotiations.  Develop   and sharpen negotiating skills by participating in realistic   negotiating simulations.  A number of cases will be presented;   individuals make choices about actions and tactics within the   negotiation.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 181') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 181';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 181', 'INTRNTNL FINANCE', 'International money and capital markets and their impact on the domestic and world economies; international financial institutions and policies.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 154B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 154B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 154B', 'ADV COMP ARCH', 'ISA variations; Pipeline data and control  hazards; Fast ALU design; Instruction-level parallelism, multithreading, VLIW;   Vector and array processing, multi/many-core chips; Cache and virtual memory;   Disk arrays; Shared- and distributed-memory systems, supercomputers; Reconfigurable and application-specific circuits.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 136AH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 136AH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 136AH', 'INT ACCTG - HONORS', 'Students receive one unit for the honors seminar.  Intended   for highly motivated and well prepared students.', 'ECON', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 189H') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 189H';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 189H', 'LAW & ETHICS HONORS', 'Students receive one unit for the honors seminar. Intended for   highly motivated and well prepared students.', 'ECON', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 178') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 178';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 178', 'INTRO CRYPTOGRAPHY', 'An introduction to the basic concepts and techniques of cryptography and cryptanalysis. Topics include: The Shannon Theory, classical systems, the enigma   machine, the data encryption standard, public key systems, digital signatures,   file security.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 103B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 103B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 103B', 'ANTHRO OF JAPAN', 'This course examines Japan as depicted in contemporary ethnography. We cons ider how Japan has been imagined as a distinct culture by exploring gender, religion, family structures, the education system, the environment, manage ment of difference, globalization and domestication, immigration, and moder nization.', 'ANTH', '4', '[{"geCode": "D  ", "geCollege": "L&S "}, {"geCode": "D  ", "geCollege": "ENGR"}, {"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 117') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 117';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 117', 'PERSUASION', 'Analysis and synthesis of current persuasion theory to   understand how messages influence attitudes and behaviors.   Topics covered include: theories for altering attitudes and   behaviors, the persuasion process, and the use of persuasion   in applied contexts.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 123') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 123';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 123', 'CULT INFLUENCE COMM', 'Cross-cultural influences on communication processes. May deal with face-to-face or electronically mediated communication.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 139') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 139';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 139', 'COMM AND EMOTION', 'Overview of emotion and its role in communication. Addresses   theoretical perspectives on emotion; issues of emotional   display and recognition; and different emotions'' effects in   interpersonal, media, and social systems contexts.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 150') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 150';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 150', 'GRP COM MULT CONTXT', 'Integrates social and behavioral sciences with the latest   communication approaches to group behavior. Students develop   an understanding of how communication networks within and   outside a particular group constitutes the essential nature of   group processes.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 166') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 166';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 166', 'MARKETING COMM', 'Foundational principles of marketing theory and related   communication strategy.  Focus on consumer behavior, marketing research, and strategies for promoting   products, services, and ideas.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 182M') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 182M';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 182M', 'INTRO LITHIC ANALYS', 'This course gives students an introduction to the anthropology and archaeology of making and using stone tools. Practical experience in making tools and using them experimentally is emphasized.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 199', 'INDEP STUDIES ANTH', 'Students must execute a limited research project on their own initiative.', 'ANTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 190') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 190';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 190', 'CULT ANTH INTERN', 'Students serve as interns in various settings such as museums, governmental agencies, and health organizations to gain   exposure to different cultures. In collaboration with the   instructor and an extramural anthropologist, the student   conceives a set of activities for the internship.', 'ANTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 194P') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 194P';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 194P', 'PRACTICUM FIELD/LAB', 'An applied course emphasizing acquisition of practical skills   in archaeological field work and laboratory analysis. Projects   will vary depending on the type of archaeological research in   progress and may include artifact processing, cataloguing,   field excavation and preparation of research results.', 'ANTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 2') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 2';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 2', 'PHYSICAL GEOLOGY', 'Introduction to the science of the Earth; properties and   processes of its surface and interior, including plate   tectonics, volcanism, earthquakes, glaciation, mountain   building, formation of rocks, minerals, and the structural   basis of landforms. Lab and lecture.', 'EARTH', '4', '[{"geCode": "C  ", "geCollege": "L&S "}, {"geCode": "QNT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 118') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 118';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 118', 'TRANSFER STUDENT', 'Introduces new transfer students to the mission of the research university, the role of higher education in society and their role, as students, within the community of scholars.  Topics cover academic, social and personal issues relevant to college students, specifically transfer students.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 122') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 122';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 122', 'PRE-PROFESSIONAL', 'Students are placed in a local K-12 classroom to participate in and observe firsthand the fundamental aspects of teaching and learning. Through independent coursework, students reflect upon their classroom experiences within the framework of the California Standards for the Teaching Profession.', 'ED', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 99', 'INDEPENDENT STUDIES', 'Independent studies and mentorship in Black Studies under the direction of a   faculty member in the department.', 'BL ST', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 99RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 99RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 99RA', 'INDEP RESEARCH ASST', 'Coursework shall consist of faculty supervised research assistance.', 'BL ST', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 4') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 4';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 4', 'INTRO OCEANOGRAPHY', 'An introduction to oceanography covering the major physical, chemical, and geological features of the oceans, their role in earth history, and potential use as a natural resource. Lab and lecture.', 'EARTH', '4', '[{"geCode": "C  ", "geCollege": "L&S "}, {"geCode": "QNT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 7') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 7';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 7', 'DINOSAURS', 'The origin and diversification of dinosaurs, including birds. Survey of evolutionary relationships within the group, and between the major groups of vertebrates. Broad introduction including anatomy, geography, climate, and vertebrate contemporaries.', 'EARTH', '4', '[{"geCode": "QNT", "geCollege": "L&S "}, {"geCode": "C  ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 136') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 136';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 136', 'GEOPHYS SEISMOLOGY', 'Wave propagation in an elastic medium; reflection and refraction, attenuation physics of the earthquake source, magnitude, seismic moment and focal mechanisms.', 'EARTH', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 191W') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 191W';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 191W', 'HEALTH/WELL-BEING', 'Explores how personal, family, school, community and environmental factors are related to academic, physical, emotional and social well-being. Topics include physiological and sociological effects of mental health, nutrition; sexual health; relationships; alcohol, tobacco, drug abuse. Covers children through emerging adults.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 186B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 186B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 186B', 'SEM GREEK & ROM ARC', 'Advanced studies in Ancient Greek and Roman archaeology and architecture. Emphasis on classical heritage of Asia Minor   (Turkey). Topics will vary. This course requires weekly   readings and discussion, and the writing of a research seminar   paper.', 'ARTHI', '4', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 186D') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 186D';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 186D', 'SEM MED ARCH/SCULPT', 'Advanced studies in Medieval architecture and sculpture.   Topics will vary. This course requires weekly readings and   discussion, and the writing of a research seminar paper.', 'ARTHI', '4', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 106') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 106';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 106', 'SMALL GROUP COMM', 'Theory and research in communication in groups, teams,  and   work units in a variety  of organizational contexts. Includes   sections in which students observe and analyze communication   processes in small group projects and exercises.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 124') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 124';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 124', 'FAMILY COMM', 'Communication strategies and patterns of interaction in family relationships. Topics include closeness and affection,   disclosure, sibling interaction, adolescence, parenting,   marital roles and conflict.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 137') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 137';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 137', 'GLOBAL COMM', 'Examines the nature, role, and influence of the global   communication on international relations and the relationship   between the media and policy making and advocacy.', 'COMM', '4', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 199RA', 'RESEARCH ASSISTANT', 'Undergraduate research assistant.    Each unit requires 30 hours per quarter of work from the   student.', 'ARTHI', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 199', 'INDEPENDENT STUDIES', 'Advanced individual problems.    Each unit requires 30 hours per quarter of work from the   student.', 'ARTHI', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 189') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 189';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 189', 'SEMINAR IN PALEOBIO', 'Undergraduate seminar in advanced paleobiology involving   reading and group discussion of current literature. Option to   (with faculty consent) write research papers of varying length or equivalent.', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 187') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 187';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 187', 'TEACHING PRACTICUM', 'Students will assist instructors in teaching course in which   the student previously received a grade of A- or better.   Activities will be determined in consultation with the   instructor and may include assisting in laboratories,   tutorials, discussion sections and field trips.', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 195H') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 195H';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 195H', 'SENIOR HONORS PROJ', 'Offers an opportunity for students who meet the prerequisites   to do independent research and to write an honors thesis or   produce an honors film/video or performance.', 'AS AM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 190') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 190';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 190', 'ADV PALEOBIOLOGY', 'Designed to meet the interests and needs of individual   students. Selected readings and laboratory work in systematic   paleontology; field studies of recent or fossil biotas;   animal-substrate relations, biostatistics, etc.', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 169') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 169';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 169', 'SOCIAL NETWORKS', 'Addresses the emergent structures, relational   dynamics, and importance of communication and social   networks.  It covers networks across levels (interpersonal, group, organizational, global), types (e.g. face-to-face, mediated, semantic) and content (e.g. friendship, advice,   task, innovation).', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 192') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 192';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 192', 'INTERNSHIP GEOL SCI', 'Individualized practical approaches to problems in   geological sciences by   working under faculty supervision as interns with local,   state or federal agencies   or private organizations.  To receive credit student must   turn in an experiential   journal, end of quarter evaluation, and complete the   internship hours.  Units are   determined by the number to be completed at the end of the   quarter.', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 182A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 182A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 182A', 'MARINE BIO/GEOCHEM', 'Marine bio/geochemistry with the opportunity of going to sea   or into the field on land. Lectures cover techniques of sea-  floor mapping using bottom photography, marine   bio/geochemical sampling, and method of data reduction and   sample analysis. Labs include analysis of data/samples collected.    Lecture, 3 hours; labs, up to 7 hours; field, up to 6 weeks.', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 199', 'INDEPENDENT STUDIES', 'Course consists of academic research supervised by a faculty   member. This course is not intended for internship honors, or   Senior Thesis credit.', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 199RA', 'IND. RESEARCH ASST.', 'Coursework shall consist of faculty supervised research   assistance.', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 160') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 160';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 160', 'SEMINAR IN GEOLOGY', 'Attendance at departmental "journal club" (Earth 260, seminar   in geology) and brief written evaluations of the three papers   which, in the student''s judgement, were the best of the   quarter.', 'EARTH', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 195H') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 195H';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 195H', 'HONORS FIELD STUDY', 'Field work in selected areas under the direction of a faculty   member. Final report required.', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 1A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 1A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 1A', 'COMP ENGR SEMINAR', 'Introductory seminar to expose students to a broad range of topics in computer   engineering.', 'ECE', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 198') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 198';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 198', 'INDEPENDENT STUDIES', 'Directed individual studies.', 'CH E', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 197MS') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 197MS';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 197MS', 'SPECIAL COURSES', 'Intensive studies or projects focused on special problems related to Anthropology which are not covered by other courses.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 114A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 114A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 114A', 'ECONOMIC DEVELOP', 'Microeconomic issues of developing nations. Applications of   analytical tools to the microeconomic problems of developing   nations. Topics include poverty and income distributions,   population, rural-urban migration, education, nutrition, labor   supply, and poverty wages.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EACS 99RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EACS 99RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EACS 99RA', 'INDEP RESEARCH ASST', 'Research details are decided by the supervising Professor in   the Department of East Asian Languages and Cultural Studies.', 'EACS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 109B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 109B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 109B', 'ORGANIC CHEMISTRY', 'Structure, reactivity and synthesis of organic molecules   including nomenc lature, reaction mechanisms, and   stereochemistry. Topics include organome tallics, polymers,   carbohydrates, amino acides, proteins, nucleic acids, coenzymes and their mechanisms.', 'CHEM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 42E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 42E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 42E', 'CONTINUING BALLET', 'Further study of basic elements of ballet.', 'DANCE', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 44E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 44E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 44E', 'CONT MODERN DANCE', 'Further study of basic elements of modern dance.', 'DANCE', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 136W') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 136W';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 136W', 'ARCH VIS TECH', 'Develops skills in reading, interpreting, and visualizing 3D objects and spaces by offering exercises in sketching, perspective, orthographic projections, isometric drawings, and manual rendering practices. Relevant for those interested in history of architecture, sculpture, and such spatial practices as installations and public art.', 'ARTHI', '4', '[{"geCode": "F  ", "geCollege": "ENGR"}, {"geCode": "F  ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 112Z') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 112Z';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 112Z', 'THEORY CONTEM ARCH', 'A survey of the history of archaeological theory, and an overview of major theoretical approaches and applications in contemporary  archaeology.  The course demonstrates how theory serves as a guide to research and to the interpretation of archaeological data.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 64') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 64';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 64', 'COMP ORGANIZATION', 'Assembly language programming and advanced computer   organization; Digital logic design topics including gates,   combinational circuits, flip-flops, and the   design and analysis of sequential circuits.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 170') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 170';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 170', 'OPERATING SYSTEMS', 'Basic concepts of operating systems. The notion of a process; interprocess communication and synchronization; input-output, file systems, memory management.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 121') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 121';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 121', 'INTO K-12 TEACH', 'Provides students the opportunity to explore the teaching   profession. Students gain firsthand experience in a local K-12 classroom, examine the California Standards for the Teaching Profession, and practice lesson planning and other fundamental aspects of the teaching profession.', 'ED', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 130') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 130';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 130', 'VISUAL ART/CULTURE', 'Exploration of visual arts and culture, including the evolving social and practical parameters of technologically produced images and the shifting arenas of ideology, analysis, and criticism.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 199RA', 'RESEARCH ASSISTANCE', 'Coursework shall consist of faculty supervised research   assistance.', 'ART', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 185XX') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 185XX';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 185XX', 'SPECIAL TOP ARTST', 'Special topics in art.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 177AB') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 177AB';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 177AB', 'HUM REPR ECOL ENDOC', 'Regulation of reproductive function by diet, energy balance,   lactation, and social context. The role of hormones in the   regulation of human reproduction, behavior, and physiology.   Hormonal changes with parenting and pregnancy in men and   women.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 178') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 178';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 178', 'INTERN ARCHAEO REC', 'Interns serve as assistants in the department''s Central Coast Information Center or Repository for Archaeological   Collections or both.', 'ANTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 199', 'IND STUD COMP SCI', 'Independent studies in computer science for advanced students.', 'CMPSC', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 153B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 153B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 153B', 'SNSR/PERPH INT DSGN', 'Hardware description languages; field-programmable logic and   ASIC design techniques. Mixed-signal techniques: A/D and D/A   converter interfaces; video and audio signal acquisition,   processing and generation, communication and network   interfaces.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 197ES') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 197ES';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 197ES', 'SPECIAL COURSES', 'Intensive studies or projects focused on special problems   related to Anthropology which are not covered by other   courses.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 92') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 92';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 92', 'PROJ ELECT COMP ENG', 'Projects in electrical and computer engineering for advanced undergraduate students.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 96') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 96';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 96', 'UNDERGRAD RESEARCH', 'Research opportunities for undergraduate students. students   will be expected to give regular oral presentations, actively   participate in a weekly seminar, and prepare at least one   written report on their research.', 'ECE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 191D') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 191D';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 191D', 'SPECIAL TOPICS', 'Lectures in special areas of interest in economics. Consult   the department office regarding proposed course topics.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 9') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 9';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 9', 'GIANT EARTHQUAKES', 'Study of the character and causes of large earthquakes, the   hazards they pose, and how society can prepare for and   mitigate their impacts. Historical case studies will   illuminate why their slip characteristics and destructive   effects vary so widely.', 'EARTH', '4', '[{"geCode": "C  ", "geCollege": "L&S "}, {"geCode": "QNT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 36') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 36';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 36', 'GLOBAL HUMANITIES', 'What do literature and critical theory contribute to the   reflection on human rights and the analysis of their   violation? Inquiry into different ways in which the humanities can re-frame the debate on human rights and act as   a social force.', 'C LIT', '4', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 6BL') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 6BL';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 6BL', 'ORGANIC CHEM LAB', 'Distillation, crystallization, extraction, determination of   physical properties, organic synthesis, instrumental methods   in organic chemistry.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 161') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 161';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 161', 'LIT CENTRAL EUROPE', 'Investigation of the prolific literatures of central Europe,   one of the culturally and linguistically most diverse regions   of the European continent that has produced writers such as   Italo Svevo, Franz Kafka, Robert Musil, Bruno Schultz, and   others. Readings in English.', 'C LIT', '4', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "G  ", "geCollege": "L&S "}, {"geCode": "G  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 100HH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 100HH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 100HH', 'SOUTHEAST ASIAN', 'The historical and contemporary experiences of specific Asian   ethnic groups: Southeast Asian Americans (100HH).', 'AS AM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 120A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 120A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 120A', 'INTEGRATED CIRCUITS', 'Theory, fabrication, and characterization of solid state   devices including P-N junctions, capacitors, bipolar and MOS   devices. Devices are fabricated using modern VLSI processing   techniques including lithography, oxidation,   diffusion, and evaporation. Physics and performance of   processing steps are discussed and analyzed.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 122B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 122B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 122B', 'VLSI ARCH/DESIGN', 'Practical issues in VLSI circuit design, pad/pin limitations,   clocking and interfacing standards, electrical packaging for   high-speed and high-performance design. On-chip noise and   crosstalk, clock and power distribution, architectural and   circuit design constraints, interconnection limits and   transmission line effects.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 199', 'INDEPENDENT STUDIES', 'Independent studies in Chinese. Individual investigations in   literary fields.', 'CHIN', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EACS 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EACS 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EACS 199', 'INDEPENDENT STUDY', 'Independent Study under the supervision of a faculty member.', 'EACS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 98') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 98';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 98', 'READINGS GEOL SCI', 'Critical reviews and discussions of selected geological subjects.', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 99', 'INDEPENDENT STUDIES', 'Independent research conducted under guidance of Earth Science faculty. Topic and scope varies, to be specified by student and supervisory faculty member prior to registration.', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 145W') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 145W';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 145W', 'DANCE AS PROTEST', 'Upper division seminar that traces a history of Postmodern, site-specific dance in California and New York and focuses   specifically on 3 seminal American artists: Anna Halprin,   Simone Forti and Yvonne Rainer.', 'DANCE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 142A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 142A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 142A', 'ARCH EURO 17TH C', 'How did major changes in politics, science, and religion   (absolutism, Scientific Revolution, Counter Reformation)   manifest themselves in contemporary architecture and town   planning? Architects include Bernini, Borromini, Wren,   Mansart. Focus on Rome, Turin, Paris, and London.', 'ARTHI', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CNCSP 197') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CNCSP 197';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CNCSP 197', 'TOPICS APP PSY', 'Topics vary by instructor.', 'CNCSP', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 184A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 184A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 184A', 'DESIGN CHEM PROCESS', 'Applications of chemical engineering principles to reactor   and plant design. Conceptual design of chemical processes.   Flowsheeting methods. Engineering cost principles and   economic aspects.', 'CH E', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 196') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 196';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 196', 'HONORS SEMINAR', 'Seminar designed to focus on criticism of current art work.   A total of 12 units in this course required to complete   honors program. Completion of seminar units followed by   public exhibition of work accomplished.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 199', 'INDEPENDENT STUDIES', 'Independent studies. Advanced independent or collaborative   work in consultation with individual faculty; individual   tutorial.', 'ART', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 5B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 5B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 5B', 'INTRO MUSEUM STUDY', 'Designed to introduce students to various aspects of Museum   Studies- historical, theoretical, and practical- by examining   a range of issues and topics with which the field is engaged.', 'ARTHI', '4', '[{"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "F  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 1A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 1A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 1A', 'VISUAL LITERACY', 'An introductory survey of visual culture, encompassing art   and film theory and practice, digital technologies,   television, advertising and print media, with a special focus   on current interdisciplinary methodologies.', 'ART', '5', '[{"geCode": "F  ", "geCollege": "ENGR"}, {"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 194') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 194';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 194', 'FLD TRNG ARCH', 'Introduction to design of research projects and techniques of   data collection in archaeology. The number of units taken in   one course will depend on the amount of training and   experience received.', 'ANTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 199RA', 'INDEP RESEARCH ASST', 'Course work shall consist of faculty supervised research.', 'ECON', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 6J') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 6J';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 6J', 'SUR CONTEMP ARCH', 'Global survey of architectural production in the twenty-first   century. Emphasis on form and technology, as well as economic,   sociopolitical context. Explores built form at a variety of   scales (buildings, cities, virtual spaces), as well as the   concept of a ?contemporary."', 'ARTHI', '4', '[{"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "F  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 107C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 107C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 107C', 'KUNST: FIRST MUSEUM', 'In the sixteenth century, wealthy merchants and powerful   princes in Europe began assembling vast collections that   aspired to contain all possible knowledge of all possible   things. From these remarkably diverse collections? called   Kunst- and Wunderkammern (German), studioli (Italian), and   curiosity cabinets (English)?arose our modern museums of art, science, history and technology, as well as modern   research collections in universities.  This course explores   these fascinating collections, the purposes that they served and the circumstances in which they were created.', 'ARTHI', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 141G') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 141G';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 141G', 'MUSEUM ARCHITECTURE', 'Discusses the history of museums and galleries as distinct   modern building types by analyzing their architectural   developments from approximately 1800 to the present.  Beside architectural design issues (sequence of galleries, display of exhibits, lighting, visitor routes, etc.), the course analyzes museums as sites of memory, their intersections with the modern city, and their roles in cultural and societal debates. Geographically, the course focuses on both the museum?s origin in Europe and its contemporary universal presence.', 'ARTHI', '4', '[{"geCode": "EUR", "geCollege": "L&S "}, {"geCode": "EUR", "geCollege": "ENGR"}, {"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "F  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EEMB 84') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EEMB 84';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EEMB 84', 'INTERNSHIP BIOLOGY', 'Opportunity to obtain practical biological-related research   experience by working under faculty direction as an intern   with local, state, federal, or private agencies. A written   report will be submitted for evaluation.', 'EEMB', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 107') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 107';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 107', 'VOYAGES TO UNKNOWN', 'The impact of the voyages of discovery on late 15th and 16th   century Europe. Readings on real and imaginary voyages:   Columbus, Cartier, Lery, More, Rabelais, Montaigne.', 'C LIT', '4', '[{"geCode": "G  ", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "G  ", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 22') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 22';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 22', 'COMP PROGR FOR ARTS', 'Using a project-based approach, the basic components of web   development and computer programming are explored in different markup and programming languages such as HTML/CSS, JavaScript, and Processing. The class is intended to create a general understanding of computer programming, its use and cultural implications, as well as provide a foundation for utilizing programming in a wide range   of projects, from traditional to new media.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 132') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 132';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 132', 'DIGITAL VIDEO', 'The making and use of video in contemporary art. Hands-on production   and post production are combined with viewing, critique, and discussion topics, including cultural prominence and future trends. Single and multiple channel, installation, and integration with other media are   all encouraged.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 122PC') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 122PC';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 122PC', 'PHYSICAL COMPUTING', 'Course will focus on development of New Media projects through the exploration of open-source computer software and hardware development tools.   Students will study the fundamentals of multimedia programming and learn how   to connect their software to tangible hardware devices to create interactive   digital artworks. Students are expected to have a strong technological   grounding in digital media and experience with digital graphics, sound video,   or web programming. Final projects will be based on knowledge and   capabilities of each student.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 192ES') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 192ES';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 192ES', 'EXHIBITION STUDIES', 'This internship provides pedagogical and practical support for students exhibiting work within the Arts Building and other venues across campus such as Cheadle Hall and the University Library. Among other skills,   the course will include intensive training in exhibition scheduling and curating, installation and display, the production of didactic supplements such as information sheets, wall texts and titles, methods of promotion as well as de-installation and art handling.', 'ART', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 192IA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 192IA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 192IA', 'INTERNSHIP ART', 'Opportunities in applied learning related to visual art   through local museums, art galleries, and other art related   organizations or institutions. Students work under the   direction of the faculty sponsor who maintains contact with   the supervisor for whom the student is interning.', 'ART', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPTGCS 1B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPTGCS 1B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPTGCS 1B', 'COMPUTER PROG & ORG', 'Object oriented programming, operating systems, scripting   and assembly languages, graphical user interfaces.', 'CMPTGCS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPTGCS 1L') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPTGCS 1L';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPTGCS 1L', 'PROGRAMMING LAB', 'Laboratory offering hands on Unix and other operating   system experience. Small to large scale software   development projects.', 'CMPTGCS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPTGCS 2') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPTGCS 2';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPTGCS 2', 'FOUNDATIONS CMP SCI', 'Mathematical foundations of computer science, including   sets, relations, functions, logic and combinatorics.', 'CMPTGCS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPTGCS 20') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPTGCS 20';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPTGCS 20', 'SPEC TOPICS CMPSC', 'Lectures on a coherent body of computer science topics   which are not usually presented in standard computer   science courses.', 'CMPTGCS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 155') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 155';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 155', 'VISUAL CULTURE', 'Enables students to think critically about how visual politics have shaped the landscape of race, how visual arts are related to other expressions of culture, such as music, theatre, and dance, and how Black artists have embodied and contested regimes of racial knowledge anchored in the visualization of Blackness.', 'BL ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 193') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 193';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 193', 'INTERN IN INDUSTRY', 'Special projects for selected students. Offered in conjunction with engineering practice in selected industrial and research firms, under direct faculty supervision. A 2-4 page paper and an evaluation from the supervisor will be required for credit.', 'CH E', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 10AL') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 10AL';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 10AL', 'FOUNDTN CIRC LAB', 'The goal of 10AL is to provide the student with a hands-on   application of the concepts discussed in ECE 10A. The lab   will introduce the use of microcontrollers as a data   acquisition system, network analysis, resistors, nonlinear   analysis and digital abstraction.', 'ECE', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 10B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 10B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 10B', 'FOUNDTN CIRC & SYS', 'The objective of the course is to introduce the MOSFET both   as a simple digital switch and as controlled current source   for analog design. The course will cover basic digital   design, small-signal analysis, charge storage elements and   operational amplifiers.', 'ECE', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 10BL') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 10BL';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 10BL', 'FOUNDTN CIRC LAB', 'The goal of 10BL is to provide the student with a hands-  on   application of the concepts discussed in ECE 10B. The lab   will utilize the microcontroller to introduce students to   the understanding of datasheets for both digital and   analog   circuits, single-stage amplifier design and basic   instrumentation.', 'ECE', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 109A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 109A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 109A', 'ORGANIC CHEMISTRY', 'Structure, reactivity and synthesis of organic molecules   including nomenc lature, reaction mechanisms, and   stereochemistry. Topics include organome tallics, polymers,   carbohydrates, amino acids, proteins, nucleic acids, coenzymes and their mechanisms.', 'CHEM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 109BH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 109BH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 109BH', 'O-CHEM (H)', 'Structure, nomenclature, stereochemistry, and reactivity of   organic molecules. Suitable for undergraduates requiring   strong understanding of organic chemistry and possessing    strong background in science, such as honors students,   majors in chemistry, biochemistry-chem, chemical engineering, etc.  This course cannot be repeated.', 'CHEM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 132A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 132A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 132A', 'AUDITING', 'Developing an understanding of concepts and practices for   audits of financial statements. Studying professional   standards, ethics, and legal liability. The audit process   is covered in-depth: planning, internal control, audit   risk, materiality, evidence, program design, sampling, completing the audit, and reporting.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CLASS 180A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CLASS 180A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CLASS 180A', 'ADV CLASSICAL CIV', 'Specialized study in classical civilization addressing   central themes or genres in detail. Topics vary and may   include subjects such as The Family in Ancient Rome, Greek   Oracles and Politics, and Imperial Theology: Augu stus,   Politics and Religion.', 'CLASS', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 101') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 101';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 101', 'INTRO LIT CRIT THEO', 'How does critical theory help us to read and write   literature? Potential foci include structuralism,   semiotics, social theory, psychoanalysis, deconstruction,   cultural criticism, gender studies and feminism, queer   studies, postcolonial criticism, ecocriticism. Content will   vary with instructor.', 'C LIT', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 167') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 167';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 167', 'PEOPLE OF ICE AGE', 'Human adaptations and population dispersals during the Ice   Age (Pleistocene epoch). Course focuses on Stone Age   cultures and the evidence for early human occupation of the   Americas and the Old World between three million and 10,000   years ago.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 113') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 113';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 113', 'INDIGENOUS PEOPLE', 'The changing relationship between indigenous people and the   state. Compare the differences and similarities between   indigenous peoples'' mobilizations in the cases of Canada,   USA, Ecuador, Chile, Guatemala, Bolivia and Mexico.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 173B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 173B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 173B', 'ADV INORGANIC CHEM', 'Structures of ordered crystalline solids, X-Ray   crystallography. Introduction to solid state chemistry,   inorganic materials and chemical catalysis. Bioinorganic   chemistry.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 2BC') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 2BC';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 2BC', 'GEN CHEM LAB-HONORS', 'Laboratory techniques. Thermochemistry, electrochemistry,   chemical kinetics, and atomic spectroscopy. Students work   in small groups to develop a unique perspective on the   experiment.', 'CHEM', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 112B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 112B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 112B', 'BIOPHYSIC CHEMISTRY', 'Forces influencing macromolecular conformation, microscopy and diffraction methods, quantum mechanics, statistical mechanics.', 'CHEM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 113B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 113B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 113B', 'PHYSICAL CHEMISTRY', 'Quantum theory and spectroscopy: introduction to quantum mechanics; symmetry, molecular structure, and spectroscopy.', 'CHEM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 116AL') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 116AL';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 116AL', 'QUANT ANALYTIC LAB', 'Principles of analytical chemistry including spectroscopy,   classical techniques and separation processes. Quantitative   analysis of unknowns. Introduction to instrumental   analysis.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 125L') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 125L';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 125L', 'BIOCHEMISTRY LAB', 'Application of molecular biology techniques to perform   mutagenesis and cloning; restriction endonucleases, PCR,   plasmid purification and DNA analysis. Protein purification   and analysis methods: expression of proteins in bacterial   systems.', 'CHEM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CLASS 36H') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CLASS 36H';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CLASS 36H', 'HEROES WORLD-HONORS', 'A discussion section led by the instructor, provided for   students in the honors program. Students receive one unit   for the honors seminar (36H) in addition to four units for   Classics 36.', 'CLASS', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 162B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 162B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 162B', 'FUND SOLID STATE', 'Crystal lattices and the structure of solids, with   emphasis on semiconductors.   Lattice vibrations. Electronic states and energy bands. Electrical and thermal   conduction. Dielectric and optical properties. Semiconductor devices: diffusion,   P-N junctions and diode behavior.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 195B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 195B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 195B', 'COMMUNITY STUDIES', 'Internship in contemporary urban problems and decision-making processes as they affect the Chicana/o community. Student individually assigned, instructed and supervised in fieldwork involving practical experience in decision-making unit of local governmental social service, or of community liaison agencies.', 'CH ST', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CLASS 20B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CLASS 20B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CLASS 20B', 'ROMANS', 'An introduction to the civilization of the ancient Romans. Topics such as Rome?s legends of male and female virtue, Augustus?s ingenious transformation of the republic into a monarchy, gladiators and chariot racing, slavery, Rome and the Christians, and the competing philosophical systems of Stoicism and Epicureanism will be explored through literary texts and archaeological remains. Encounter a range of sources from Livy, Virgil, and Seneca to monuments of the emperors, and examine the complex legacies of Roman culture across time.', 'CLASS', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "EUR", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "EUR", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CLASS 36') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CLASS 36';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CLASS 36', 'WORLD OF HEROES', 'A study of the Iliad, the Odyssey, the Aeneid and other   ancient epics, and of the place of these works in Greek and   Roman society. The course explores how the epic hero   embodies a culture?s ideals concerning the individual, the   community, and the universe.', 'CLASS', '4', '[{"geCode": "G  ", "geCollege": "L&S "}, {"geCode": "G  ", "geCollege": "ENGR"}, {"geCode": "EUR", "geCollege": "L&S "}, {"geCode": "EUR", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 107') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 107';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 107', 'INTRO TO BIOPROCESS', 'Familiarizes engineering students with biological processing and production at multiple scales. Chemical engineering principles will be infused with key biological concepts, including an introduction to biochemistry, cell biology, and molecular biology.', 'CH E', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 107A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 107A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 107A', 'HISTORY OF ECON', 'Economic thought from antiquity through John Stuart Mill. Economic thought in   the   Bible, Greece, Rome, India, and China through the classical economists--  Thomas   Hobbes, John Locke, Adam Smith, Jeremy Bentham, Thomas Malthus, David   Ricardo,   and John Stuart Mill. Emphasis on both economic activity and economic   thought,   including discussion of feudal and mercantilist societies. The economic roles of   women and slavery are presented.', 'ECON', '4', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 143A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 143A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 143A', 'STREET DANCE', 'Focuses on the various forms of street dance: Hip Hop,   House Dance, Popping, Locking, Whacking, Punking, Voguing, and   Freestyle. Students learn the physical lexicon of the various styles, and are   immersed in the cultural aspects of the forms, contextualizing the   dances both historically and socially. With a strong focus on   accurately embodying the essence of each style, the class breaks down the   initiation of motion and pathways of energy that result in these unique   and specialized modes.', 'DANCE', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 199', 'INDEPENDENT STUDIES', 'Study of special problems in various fields of education.', 'ED', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 103G') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 103G';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 103G', 'ANCSPECTACLE', 'Explores the worlds of ancient Greece and Rome through the participants in and observers   of a variety of spectacles in the ancient world. Examines public spectacles such as bull-  leaping, Olympic games, theatrical performances, gladiatorial combats, naval battles,   religious rituals, and military triumphs, as well as other more private spectacles such as dinner parties with the gods.', 'ARTHI', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 192') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 192';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 192', 'PROJECTS COMP SCI', 'Projects in computer science for advanced undergraduate   students.', 'CMPSC', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 99', 'INDEPENDENT STUDIES', 'Study of special problems in various fields of education   and/or faculty supervised research assistance.', 'ED', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 199RA', 'INDEP RESEARCH ASST', 'Coursework shall consist of faculty supervised research   assistance.', 'ED', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 170') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 170';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 170', 'COMMUNICATION LAW', 'A historical survey of the development of the concept of   free speech, and a study of First Amendment controversies   in the United States during the twentieth and twenty-first   centuries.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 116') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 116';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 116', 'INTERNET & SOCIETY', 'Considers historical, technical, relational, economic, legal, political, and   social dimensions in order to explain how people make use of tools with the considerable capabilities demonstrated by the Internet and Web. Emphasis on   relevant theoretical perspectives, important research findings, and practical   applications, with the goals of enabling students to understand the Internet in   its current form and to make sense of its continued evolution.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 177') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 177';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 177', 'LEGAL CMTY/COURT', 'The legal system is a core social institution in every human society. In this course we will examine and critique the communication events that structure legal interaction. In order to discern the effects of particular communication styles and expectations, our analysis will focus on three key contexts: the courtroom, the legal profession and the public sphere.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 5') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 5';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 5', 'INTRO TO ECE', 'Aims at exposing freshmen students to the different sub-fields within Electrical   and Computer   Engineering. Composed of lectures by different faculty members and a weekly   laboratory based   on projects that are executed using the Arduino environment.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 148') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 148';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 148', 'RISK COMMUNICATION', 'Covers a number of issues such as risk assessment, risk perception, message design, media options, and barriers to effective risk communication.   Across all topics, considers how access to risk information, perceptions of risk, and reactions to risk messages vary depending on the audience.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 121') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 121';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 121', 'COMM AND CONFLICT', 'Theory and research on communication and conflict   dynamics in various contexts.   Students select and use lay approaches to manage conflict   in their daily lives. Then   they apply theoretical concepts to analyze both the   conflicts and their lay   approaches.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 138') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 138';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 138', 'ADVERTISING LIT', 'Begins with an examination of the advertising industry   from academic perspectives--  economics, psychology, sociology, and history. Then the course shifts to a practical   perspective as we examine how advertising agencies are   organized, how they get clients, how they conduct research to create advertising campaigns, how they make   media buys, and how they design advertising messages. Students complete   exercises in researching a   situational analysis, making a media buy, and designing a TV ad.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CNCSP 101') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CNCSP 101';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CNCSP 101', 'INTRO HELP SKILLS', 'Introduces students to theory and practice of psychotherapy and other helping   relationships. Students learn about counseling, assessment, ethics, and   helping skills. Students gain experience by serving as practice counseling   clients or by volunteering in a relevant service setting.', 'CNCSP', '4', '[{"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 101B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 101B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 101B', 'INTRO CLASS CHINESE', 'The grammar and vocabulary of classical Chinese. Readings   concentrate on philosophical and   historical works from the Pre-Han period, with some selections from later prose and poetry.   Students with some familiarity with Chinese characters   (through another Asian language) but not modern Chinese will be accommodated.', 'CHIN', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CNCSP 97') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CNCSP 97';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CNCSP 97', 'SPCL TPC APP PSYCH', 'Topics vary by instructor.', 'CNCSP', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CNCSP 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CNCSP 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CNCSP 99', 'INDPDNT STUDY', 'Study of special problems in various fields of Applied   Psychology.', 'CNCSP', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CNCSP 99RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CNCSP 99RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CNCSP 99RA', 'IDPNDNT RSRCH ASST', 'Faculty supervised research assistance.', 'CNCSP', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 2NH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 2NH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 2NH', '1ST YR CHIN HERITAG', 'Continuation of Chinese 1NH.', 'CHIN', '4', '[{"geCode": "H  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 5NH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 5NH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 5NH', '2ND YR CHIN HERITAG', 'Continuation of Chinese 4NH.', 'CHIN', '4', '[{"geCode": "B  ", "geCollege": "L&S "}, {"geCode": "H  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 132C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 132C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 132C', 'STAT METHODS IN CHE', 'Probability concepts and distributions, random variables,   error analysis, point   estimation and confidence intervals, hypothesis testing, development   of   empirical chemical engineering models using regression techniques,   design of   experiments, process monitoring based on statistical   quality control   techniques.', 'CH E', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 190I') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 190I';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 190I', 'INTELL & INTERACT', 'These variable unit courses provide for the study of topics of current interest in computer science.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 186PP') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 186PP';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 186PP', 'POETRY & COMMUNITY', 'Poetry & Community Practice honors a connection between poetry and citizenship, assuming that poetry is a wisdom medium or vehicle toward more enlightened thinking and public practice. Poetry is an ideal medium for extending our study and practice beyond UCSB, and students will conduct workshops in schools, community centers, and assisted living facilities as part of their work for the course. Students will extend their own learning through teaching?a natural stretch?while also being of benefit elsewhere.', 'C LIT', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 199', 'INDEPENDENT STUDIES', 'Coursework shall consist of academic research supervised by   a faculty member. This course is not intended for   internship credit.', 'CHEM', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 181') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 181';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 181', 'INTRO COMP VISION', 'Overview of computer vision problems and techniques for   analyzing   the content of images   and video. Topics include image formation, edge detection, image   segmentation, pattern   recognition, texture analysis, optical flow, stereo   vision, shape   representation and   recovery techniques, issues in object recognition, and   case studies   of practical vision   systems.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 181') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 181';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 181', 'INTRO COMP VISION', 'Overview of computer vision problems and techniques for   analyzing   the content   of images and video. Topics include image formation, edge detection, image   segmentation, pattern recognition, texture analysis, optical flow,   stereo vision,   shape representation and recovery techniques, issues in   object   recognition, and   case studies of practical vision systems.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 137A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 137A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 137A', 'CIRCUIT & ELECTR I', 'Analysis and design of single stage and multistage   transistor circuits including biasing, gain, impedances and   maximum signal levels.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 40') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 40';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 40', 'FOUNDATION COMP SCI', 'Introduction to the theoretical underpinnings of computer   science. Topics include propositional predicate logic,   set theory,   functions   and rel ations, counting, mathematical induction and   recursion   (generating   fu nctions).', 'CMPSC', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 108') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 108';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 108', 'CORP SOC RESPONS', 'Examines 1) the ways in which global expectations regarding   organizationa l behavior toward employees, communities, and   the environment are changin g and 2) the communicative   challenges and opportunities businesses and di verse   stakeholder groups face as they strive to make contemporary   organ izations socially responsible.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 152A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 152A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 152A', 'DIGITAL DESIN PRIN.', 'Design of synchronous digital systems: timing diagrams, propagation   delay , latches and flip-  flops, shift registers and counters, Mealy/Moore finit e state   machines, Verilog, 2-phase   clocking, timing analysis, CMOS impl ementation, S-RAM, RAM-based   designs, ASM charts, state   minimization.', 'ECE', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 142B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 142B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 142B', 'BIOCHEMISTRY', 'Chemical aspects of intermediary metabolism. The chemistry   and elementary dynamic properties of enzymes; study of   enzyme active sites; characteriz ation of metabolic pathways   and methods of examining cellular regulation.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 143') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 143';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 143', 'THE RNA WORLD', 'Introduction to RNA structure and thermodynamics.   Biological roles of RNA in contemporary organisms.   Implications for the origins of life.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 186') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 186';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 186', 'ORGANOMETALLIC CHEM', 'Synthesis, structure, and reactivity of organometallic   complexes, with an emphasis on bonding and electronic   structure. Homogeneous catalysis and small molecule   activation, especially in the context of the energy   conv ersion and storage, will also be discussed.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 198') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 198';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 198', 'IND STUD CHEM ED', 'Coursework shall consist of research in chemical education   supervised by a faculty member. This course is not intended   for internship credit.', 'CHEM', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EEMB 2') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EEMB 2';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EEMB 2', 'INTRO BIOLOGY II-EE', 'Introduction to population and community ecology, and   evolution.', 'EEMB', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ASTRO 1H') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ASTRO 1H';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ASTRO 1H', 'HONORS- BASIC ASTRO', 'A supplement to Astronomy 1 emphasizing fundamental   concepts and addition al topics in astronomy. Intended for   highly motivated and well prepared s tudents.', 'ASTRO', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 123') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 123';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 123', 'FEEDING ECOLOGY', 'Foraging and feeding patterns in primates with some discussion of human pat terns.   Topics include digestive physiology; measurement of energy flows a nd food availability; foraging theory;   and the evolutionary context of hu man diets.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 197') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 197';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 197', 'COMM INTERNSHIP', 'An opportunity for pre-communication and communication   majors to obtain c redit for career-related experience and   application of academic training in a communication-  related   internship. Required are 50 hours minimum of internship   work, a final five-page report, and a supervisor''s letter   o f verification.', 'COMM', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 137GA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 137GA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 137GA', 'GER/AUS ARCH 18-19C', 'Between 1770 and 1871, the German speaking lands of Europe experienced both political unification and an astounding cultural rebirth (Kant, Hegel, Goe the, Beethoven, Brahms, Wagner, Marx, Nietzsche...). This blossoming extend ed to architecture and town planning as well, as the region transformed its elf into one of Europe''s most vibrant laboratories for theory and design. T his course will examine this remarkable period of change by examining archi tecture, town planning, and some architectural theory (in translation) in t heir larger cultural and political contexts.', 'ARTHI', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 193') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 193';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 193', 'INTERNSHIP CHEM', 'Opportunity to obtain practical non paid chemistry-related   research and w ork experience by working under faculty   and/or staff direction as   an in tern.', 'CHEM', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 2') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 2';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 2', 'BLK GLOBALIZATION', 'Explains the process of Globalization from the XV Century - when the very c oncept of   race appeared in discourse - to the present through the lenses of the Black   experience. The texts, films and lecture presentations count er the historiographical   erasure of people of African descent in the maki ng of the Modern World, foregrounds the   critical role that Black subject played in both the Old and New Worlds and   postulates that Globalization c ould not have ever taken place without their contributions.', 'BL ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 9') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 9';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 9', 'RACE & RESISTANCE', 'Studies US race-based freedom struggles, emphasizing the 1960s-70s, within the context of global decolonization and the study of the ?long? movement f rom the 1930s to the present. Examines how social movements are studied his torically.', 'AS AM', '4', '[{"geCode": "D  ", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "D  ", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "CRST"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 195') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 195';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 195', 'SBDT MENTOR PROGRAM', 'Prepares students for professional work in the field of dance. Apprentices will join with professional dancers in UC Santa Barbara?s resident professi onal dance company, Santa Barbara Dance Theater, to rehearse choreographic works, with the possibility of performing in studio showings, repertory pre views and the company?s concerts on and off campus. These experiences are e xpected to raise each apprentice?s awareness of collaborative methods and p rofessional standards of performance artistry.    The artistic director of Santa Barbara Dance Theater will be designated as the instructor of record, with mentoring and coordinating assistance from one or more company member s.', 'DANCE', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 99') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 99';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 99', 'INDEPENDENT STUDIES', 'Independent studies in computer science for advanced students.', 'CMPSC', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 10A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 10A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 10A', 'FOUNDTN CIRC & SYS', 'The objective of the course is to establish the foundations of analog and d igital circuits. The course will introduce the student to the power of abst raction, resistive networks, network analysis, nonlinear analysis and the d igital abstraction.', 'ECE', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 146') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 146';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 146', 'HETEROG CATALYSIS', 'Concepts and definitions. Applications of heterogeneous catalysis. Performa nce metrics. Analysis of surface reaction mechanisms and complex reaction n etworks. Structure-function relationships for supported metal and zeolite c atalysts. Synthesis and characterization of heterogeneous catalysts.', 'CH E', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 194N') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 194N';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 194N', 'SPECIAL TOPICS ECE', 'Group studies intended for small number of advanced students who share an i nterest in a topic not included in the regular departmental curriculum.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 120NP') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 120NP';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 120NP', 'NARRATIVE PHOTO', 'Students will conceptualize, research, and propose narrative photography pr ojects that focus on telling a visual story. Development and production of projects will include investigation of methods in which photography can des cribe: time, causality, dramatic composition, spatiality, fictional and non -fictional story telling, etc.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EACS 80') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EACS 80';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EACS 80', 'CHIN CIVIL', 'A survey of the history of Chinese civilization from 2,000 BCE to the prese nt, focusing on the origins and later development of political, social, eco nomic, philosophical, religious, and cultural traditions.', 'EACS', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "NWC", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 120B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 120B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 120B', 'TRANSPORT PROCESSES', 'Introductory course in the mathematical analysis of conductive, convective and   radiative heat transfer with practical applications to design of heat exchange   equipment and use.', 'CH E', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 189B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 189B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 189B', 'SR CMPTR PRJCT', 'Student groups design a significant computer-based project. Focus will be o n building and implementing an embedded hardware system. Each group works i ndependently. The project is evaluated through project reports, achieving m ilestones and through successful demonstration of hardware functionality.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 1A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 1A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 1A', 'GEN CHEM', 'The atomic structure of matter; atoms, ions, and chemical compounds;   bala ncing equations and reaction stoichiometry; composition of aqueous solution s and solution stoichiometry; gases; quantum chemistry and the electronic s tructure of atoms; introduction to chemical bonding; molecular shape and el ectronic structure of molecules', 'CHEM', '3', '[{"geCode": "QNT", "geCollege": "L&S "}, {"geCode": "C  ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 1B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 1B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 1B', 'GENERAL CHEMISTRY', 'Thermochemistry; spontaneous processes and the second law of thermodynamics ; chemical kinetics; equilibrium; acids and bases; equilibrium processes in aqueous solutions; electrochemistry', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CNCSP 102') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CNCSP 102';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CNCSP 102', 'RESEARCH APP PSYCH', 'Introduces students to research in applied psychology, including approaches to survey, experimental, and qualitative investigation. Students will be e xposed to current research in applied psychology through journal articles, presentations, and participation in research studies.', 'CNCSP', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 49B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 49B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 49B', 'SURVEY AFRICAN HIST', '1800 - 1945. History 49-A-B-C is a general survey course designed to introd uce students to major themes in African history. The course focuses on Afri can civilizations and identities, European colonial conquests, governance a nd colonial economies, African resistance and engagement with global capita lism. Weekly discussion sections are an important feature of this course, e nabling students to develop and expand upon material presented during lectu re.', 'BL ST', '4', '[{"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 176') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 176';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 176', 'CHIN GLOBAL CINEMA', 'A critical overview of some of the major cinematic trends in Chinese-langua ge film over the past several decades. Works from the PRC, Taiwan and Hong Kong, as well as Chinese cinema will be considered in a global context.', 'CHIN', '4', '[{"geCode": "F  ", "geCollege": "ENGR"}, {"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 1') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 1';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 1', 'PRINCIPL ECON MICRO', 'An introduction to microeconomic analysis. Economic theory   related to dem and, production, competitive and non-  competitive product markets, input m arkets, and welfare.   Applications of microeconomic theory including its u se in   evaluating and forming public policy.', 'ECON', '4', '[{"geCode": "D  ", "geCollege": "ENGR"}, {"geCode": "D  ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 2') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 2';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 2', 'PRIN ECON-MACRO', 'An introduction to macroeconomic analysis. Analysis of income, employment, and price level. Applications of macroeconomic theory including its use in evaluating and forming public policy.', 'ECON', '4', '[{"geCode": "D  ", "geCollege": "ENGR"}, {"geCode": "D  ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 3A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 3A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 3A', 'FINANCIAL ACCTG', 'A two-quarter series providing an introduction to the purposes, conceptual framework, measurement principles and reporting issues of accounting. Parti cular emphasis will be placed on the links between accounting, economics, a nd finance.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 3B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 3B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 3B', 'FINANCIAL ACCTG', 'A two-quarter series providing an introduction to the purposes, conceptual framework, measurement principles and reporting issues of accounting. Parti cular emphasis will be placed on the links between accounting, economics, a nd finance.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 118') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 118';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 118', 'FIN ACCTG ANALYSIS', 'An economic analysis of financial statements in a macroeconomic environment . Topics include evaluation of short term and long term liquidity, profitab ility, capital structure and the forecast of earnings and financial positio n using financial and economic models.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 136C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 136C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 136C', 'INTERMED ACCOUNTING', 'An in-depth analysis of recognition, measurement, classification, and valua tion issues in financial reporting within the framework of generally accept ed accounting principles. Case studies and microcomputer analysis software will be integrated into the course.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 150B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 150B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 150B', 'LABOR ECONOMICS', 'Analyzes the structure of wages. Determinants of earnings studied include c ompensating differentials, human capital in the form of education and train ing, and immigrant assimilation.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 176') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 176';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 176', 'EXPERIMENTAL ECON', 'Introduction to the idea that economics, like all of the   natural sciences , can be a laboratory science.  Focus on   performing and engaging in exper iments.  Students design   experiments and discuss the designs of others.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 199', 'INDEPENDENT STUDIES', 'Coursework shall consist of academic research supervised by a faculty membe r. This course is not intended for internships.', 'ECON', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 135') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 135';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 135', 'CRITICAL RACE THEOR', 'Examines Critical Race Theory (CRT) as an emerging analytical framework in the field of education. Course investigates how a CRT framework might addre ss and challenge the impacts of race, class, gender, language, immigrant st atus, accent, and sexual orientation on Chicana/o, Latina/o educational att ainment and achievement.', 'CH ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 189B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 189B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 189B', 'SR CMPTR PRJCT', 'This course is the second in the 2-course Computer Science Capstone sequenc e.  Student teams continue their CMPSC 189A effort by evolving their specif ications, design, and prototypes of advanced computer science solutions and systems. The students learn about interfaces, software integration, and te sting, and prepare advanced demonstrations for public presentation at the e nd of the sequence.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 137AH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 137AH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 137AH', 'MAN ACCTG - HONORS', 'Students receive one unit for the honors seminar. Intended   for highly mot ivated and well prepared students.', 'ECON', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 5') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 5';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 5', 'INTRO  BIO ANTH', 'An introductory course in human evolutionary biology.  Natural selection an d its genetic basis are used to highlight a variety of human traits.  The f ossil record is addressed, but the course takes more of an "adaptationist" than a paleontological perspective.', 'ANTH', '5', '[{"geCode": "C  ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 154') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 154';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 154', 'SYSTEMS BIOLOGY', 'Applications of engineering tools and methods to solve problems in systems biology. Emphasis is placed on integrative approaches that address multi_sc ale and multi-rate phenomena in biological regulation. Modeling, optimizati on, and sensitivity analysis tools are introduced.', 'CH E', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 1') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 1';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 1', 'INTRO COMMUNICATION', 'An introduction to the basic concepts and principles in the field of commun ication. Contexts include intrapersonal, interpersonal, intercultural, publ ic, small group, organizational, and mass communication.', 'COMM', '5', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "D  ", "geCollege": "ENGR"}, {"geCode": "D  ", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 88') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 88';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 88', 'COMM RESEARCH METH', 'An introduction to social scientific research methods in the study of commu nication. Important issues in conducting research are examined in the conte xts of survey research, experimental design, content analysis, and qualitat ive research.', 'COMM', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 89') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 89';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 89', 'THEORIES OF COMM', 'An introduction to major theories and theoretical influences in the field o f communication. Theories are examined in the areas of verbal and nonverbal messages, cognition and persuasion, and the contexts of interpersonal, int ercultural, small group, organizational, and mass communication.', 'COMM', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 102') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 102';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 102', 'MASS COMM THEORY', 'Designed to provide a succinct and accessible, yet   comprehensive and soph isticated, understanding of the   appropriate uses of media theories in an effort to shed light on the   important role of theory in our everyday inte ractions with   media and the social environment.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 109') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 109';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 109', 'INDIGENOUS PEOPLE', 'The changing relationship between indigenous people and the state. Compare the differences and similarities between indigenous peoples'' mobilizations in the cases of Canada, USA, Ecuador, Chile, Guatemala, Bolivia and Mexico.', 'CH ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 141') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 141';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 141', 'CENTRAL AMERICANS', 'Provides an interdisciplinary historical overview of Central American migra tions to the U.S., and a cultural and political analysis of resulting indiv idual and group identities. Transnationalism, diasporas, politics, and comm unity building among Central Americans, or "Central American-Americans" are explored.', 'CH ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 186JJ') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 186JJ';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 186JJ', 'LIT JUVENILE JUSTIC', 'Students in the course will be reading a range of materials from multiple g enres, among them fiction and non-fiction, critical race theory, poetry & p lays (among other offerings), while forming mentoring relationships with yo uth at Los Prietos Boys Camp & writing about both their academic inquiries & experiences with community practice.', 'C LIT', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 120') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 120';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 120', 'PRAC TCHG HIGHER ED', 'A course designed for undergraduate students who were selected to serve as co-leaders in one of our large courses (ED 20, ED 118, ED 173.)     Student s will learn about adult development theories, pedagogical techniques, and learning assessment. Students will create lesson plans, facilitate discussi ons, grade assignments, and foster positive learning environments.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 151') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 151';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 151', 'GENDER AND CINEMA', 'Critical explorations of aesthetic, narrative, thematic, ideological, cultu ral and interdisciplinary configurations which frame representations of fem ininities, masculinities, and sexualities in African cinema.  The complex d ynamics between art and society, issues of identity, difference, agency, re sistance, and change, will be explored.', 'BL ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 10A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 10A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 10A', 'MICROECON THEORY', 'Economic theory relating to demand, production, and   competitive product m arkets with emphasis on applications of theory.', 'ECON', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 168B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 168B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 168B', 'HISTORY OF CHICANOS', 'The history of the Chicanos from 1900 to the present. Explores issues such as immigration, second-generation experience, civil rights struggles, the C hicano Movement, the post-Chicano Movement, the role of women in Chicano hi story, and the new Latino millennials of the 21st century.', 'CH ST', '4', '[{"geCode": "AMH", "geCollege": "UCSB"}, {"geCode": "D  ", "geCollege": "ENGR"}, {"geCode": "D  ", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "CRST"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 196B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 196B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 196B', 'SEN HONORS SEM', 'Students undertake independent research project(s) under direction of facul ty member. The research results are presented as an honors paper at the end of the second term (196B).', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 134C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 134C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 134C', 'BEHAVIORAL FIN', 'Describes several puzzles in financial markets, including phenomena that ar e hard to explain using standard economic models. Develops several alternat ives to standard economic models in which agents make errors or have prefer ences that differ from those typically assumed by economists. These "behavi oral models" are motivated by evidence from psychology, lab experiments in economics, and field experiments, some of which are reviewed. Explores how such behavioral models can explain puzzles both at the level of individual investing and at an aggregate level (market volume and pricing).', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 136B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 136B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 136B', 'INTERMED ACCOUNTING', 'An in-depth analysis of recognition, measurement, classification, and valua tion issues in financial reporting within the framework of generally accept ed accounting principles. Case studies and microcomputer analysis software will be integrated into the course.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 9') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 9';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 9', 'INTRO TO ECONOMICS', 'A broad survey of economic principles, including both   microeconomics and macroeconomics.', 'ECON', '4', '[{"geCode": "D  ", "geCollege": "L&S "}, {"geCode": "D  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 196B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 196B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 196B', 'ADV UGRAD RESEARCH', 'Advanced research for undergraduate students, by petition after completing a minimum of 4 units of CMPSC 196 for a letter grade. The student will prop ose a specific research project and make a public presentation of final res ults. Evaluation and grade will be based on feedback from faculty advisor a nd one other faculty member.', 'CMPSC', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 10') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 10';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 10', 'ANTARCTICA', 'The interrelations of the physical and biological   environments   on the c ontinent Antarctica; Antarctica as an earth system.   Included are studies of tectonic history, global warming,   ozone depletion, mineral resources, and the history of   scientific exploration of the continent.', 'EARTH', '4', '[{"geCode": "C  ", "geCollege": "L&S "}, {"geCode": "QNT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 194I') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 194I';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 194I', 'INTERNSHIP', 'Under supervision of Comparative Literature faculty, Comparative Literature majors may obtain credit for work without pay in publishing, editing, jour nalism, or other employment related to Comparative Literature, World Litera ture, and/or Translation Studies. Requirements include work hours, regular meetings with professor-mentor, and a final paper presenting and analyzing the student''s learning from the internship pertaining to specialization in world literary studies.', 'C LIT', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EEMB 7') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EEMB 7';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EEMB 7', 'EVOL PHYS BRAIN SCI', 'Introduction to the principles of evolution and animal physiology. Topics i n   evolution include the evidence for evolution, the process of microevolu tion,   macroevolution, and basic phylogeny. Topics in animal physiology in clude tissues   and organ systems, neural control, sensory perception, endo crine control,   structural support and movement, circulation, immunity, re spiration, digestion,   reproduction, and development. This course is desig ned for psychological and brain   sciences majors.', 'EEMB', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 138') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 138';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 138', 'ANTH OF ENV HEALTH', 'A sociocultural medical anthropological approach to explore how environment al hazards, many of them human-influenced, shape health and illness around the world. Topics include environmental risk and perception, industrial tox ics, disasters, environmental justice, and chronic disease.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 146A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 146A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 146A', 'DIG COMM FUND', 'Signal and channel models, with emphasis on wireless systems; digital modul ation; demodulation basics; statistical modeling of noise, including review of probability theory and random variables.', 'ECE', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 24') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 24';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 24', 'PROBLEM SOLVING II', 'Intermediate building blocks for solving problems using computers. Topics i nclude intermediate object-oriented programming, data structures, object-or iented design, algorithms for manipulating these data structures and their run-time analyses. Data structures introduced include stacks, queues, lists , trees, and sets.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 127') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 127';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 127', 'FIELD PETROLOGY', 'Field-based study of igneous, metamorphic and tectonic processes. Investiga tes different topics in igneous and metamorphic petrology each year, center ed around field trips to key localities. Includes lectures, review of scien tific literature, on-campus labs and field-based observations and measureme nts.', 'EARTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 141') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 141';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 141', 'AS AM CREATIVE WRTG', 'A creative writing workshop focusing on Asian American themes. Different ge nres are emphasized depending on the instructor''s preference and expertise.', 'AS AM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 199RA', 'INDEP RESEARCH ASST', 'Coursework consists of faculty supervised research assistance.', 'AS AM', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 179P') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 179P';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 179P', 'ROBOTICS: PLANNING', 'Motion planning and kinematics topics with an emphasis on geometric   reaso ning, programming, and matrix computations.  Motion planning:   configurati on spaces, sensor-based planning, decomposition and sampling   methods, and advanced planning algorithms.  Kinematics: reference frames,   rotations a nd displacements, kinematic motion models.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 193') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 193';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 193', 'ECON INTERNSHIP', 'Course enables students to obtain credit for economics-related internship e xperience. An eight to ten page written report is required and evaluated fo r credit.', 'ECON', '1', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 183') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 183';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 183', 'TEACHING ASSISTANCE', 'Students will assist the teaching assistant in teaching a lab course in whi ch the student previously received a grade of A- or better. Activities will be determined in consultation with the instructor and include instruction of 1 or 2 lab sections per week. Undergraduates enrolled in Chem 183 are le arning assistants (LAs) in the general chemistry laboratory. LAs teach and mentor first-year university students. LAs assist students with experiments , lab technique, data analysis, calculations, learning chemistry concepts, and problem solving.  As the LAs learn STEM education pedagogy, they can pr actice what they learn as LAs in the chemistry lab.', 'CHEM', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 124') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 124';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 124', 'PRAC CMNTY BSD LRNG', 'Students do practicum hours in the local community and schools, read releva nt articles and examine results from related research projects.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 145') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 145';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 145', 'INTRO RSRCH MTHDS', 'Provides an overview of methods used to conduct educational research. Skill s learned help students conduct their own research projects. No previous co ursework or research experience is required.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 150') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 150';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 150', 'TEACHING TEACHERS', 'Provides a basic foundation for understanding both (a) the nature of teachi ng as a specialized human activity (as distinct from other human activities ) and (b) the organization and conduct of teaching in contemporary U.S. sch ools.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 115B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 115B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 115B', 'FUNDS QUANTUM CHEM', 'Molecular orbital theory and valence bond theory; Huckel theory (secular eq n.)   applications to conjugated systems, electronic spectra, and term symb ols;   introduction to infrared, Raman, and microwave spectroscopy.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 195B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 195B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 195B', 'ANTH HNR IND STDY I', 'Individual research under the supervision of an   Anthropology faculty memb er which will result in an honors  thesis. This course concentrates on read ing and gathering   of materials for thesis.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 195C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 195C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 195C', 'ANTH HNR IND STD II', 'Individual research under the supervision of an   Anthropology faculty memb er which results in an honors thesis. Writing the thesis will be completed in this   course. Final course in progress series.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 109C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 109C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 109C', 'ORGANIC CHEMISTRY', 'Structure, reactivity and synthesis of organic molecules   including nomenc lature, reaction mechanisms, and   stereochemistry. Topics include organome tallics, polymers,   carbohydrates, amino acides, proteins, nucleic acids, coenzymes and their mechanisms.', 'CHEM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 197') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 197';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 197', 'FIELD STUDIES', 'Students will conduct independent field work in Asian   American communitie s. Specific projects include working   with community agencies and organiza tions to evaluate   programs, implement new or modified services, and devel op   community resources.', 'AS AM', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 6BH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 6BH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 6BH', 'ORG CHEM LAB (RSCH)', 'Independent research involving distillation,   crystallization, extraction, determination of physical   properties, organic synthesis, and use of inst rumental   methods in organic chemistry.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 16') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 16';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 16', 'PROBLEM SOLVING I', 'Fundamental building blocks for solving problems using computers. Topics in clude basic computer organization and programming constructs:  memory CPU, binary arithmetic, variables, expressions, statements, conditionals, iterat ion, functions, parameters, recursion, primitive and composite data types, and basic operating system and debugging tools.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 118') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 118';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 118', 'COMP REBELLION', 'Examines key events in Brown/Black resistance and rebellion in the U. S. an d the Borderlands. Using primary and secondary sources, the course emphasiz es parallel rebellions, transnational revolutionary thought, and cross-raci al alliances.', 'BL ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 6CH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 6CH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 6CH', 'ORG CHEM LAB (RSCH)', 'Independent research involving distillation,   crystallization, extraction, determination of physical   properties, organic synthesis, and use of inst rumental   methods in organic chemistry for the purposes of multistep   syn thesis.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 7C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 7C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 7C', 'SPATIAL STUDIES', 'The study of spatial art in many forms, including material,   interactive a nd dynamic digital. Studio assignments are   combined with related critical theory, historical practice,   current strategies and new evolutions.', 'ART', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 7D') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 7D';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 7D', 'ART, SCIENCE, TECH', 'The study of foundations of digital and technological arts in all forms, in cluding history, theory and practice of optical, kinetic, interactive, inte rdisciplinary and systems-oriented art. Lectures and assignments introduce concepts, methods, movements and practitioners that have shaped the fields.', 'ART', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 10') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 10';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 10', 'INTRO  PAINTING', 'Traditional and contemporary painting assignments designed to   provide a s trong foundation in fundamental 2D image making.   Media include acrylic an d oil painting methods.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 12') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 12';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 12', 'BEG SPATIAL PRACT', 'Introduction to the challenges, strategies, and techniques of   3D artmakin g within the expanding fields of traditional and   contemporary sculpture.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 14') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 14';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 14', 'LOWER-DIVISN PRINT', 'Introduction to making prints. Emphasis on technical fundamentals and conce ptual aspects of graphic arts. "Print" incorporates hand produced mechanica lly or photographically reproduced, and electronically replicated media.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 18') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 18';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 18', 'L/D DRAWING', 'Introduction to two-dimensional representation with various   drawing media , including structural and symbolic implications   of the human form. Empha sis on organization of vision and   thought.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 157B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 157B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 157B', 'ART INTEL DES TEST', 'Introduces an artificial intelligence system view to apply machine learning in design and test automation processes. The various components for buildi ng an Intelligent Engineering Assistant (IEA) to perform an engineering tas k in an industrial setting are explained.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 186SC') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 186SC';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 186SC', 'LIT SOCIAL CHANGE', 'This course uses literature as a basis for reigniting our passion for and f aith in  social change. It assumes that our service and action programs, to gether with a  whole host of academic inquiry and research practices, are f ailing? that our  educational and social change missions, for example, can no longer adequately  address the massive social and ecological problems an d political initiatives we  now face. Rigorous readings by thinkers as dive rse as Angela Davis, Paulo Freire,  bell hooks, Gabriel Garcia Marquez, Joa nna Macy, Abraham Rodriguez, Derrick  Jensen, Martín Prechtel, together wit h equally rigorous field-work in local  schools will offer up new models fo r addressing social, ecological and educational  challenges.', 'C LIT', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM CS 11B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM CS 11B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM CS 11B', 'CCS GEN CHEM', 'The sequence of topics will be similar to that in Chemistry 1B. Calculus wi ll be used as needed, at the level of the concurrent MATH 3B course.', 'CHEM CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 35') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 35';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 35', 'MAKING OF MOD WORLD', 'Description and analysis of decisive events contributing to   the world we are inhabiting. Various   themes presented: City planning, war and industri al   warfare, technology and media-technology,   ideologies of modernity, a nd modern master theories.', 'C LIT', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 104') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 104';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 104', 'SCI&ENG ENERGY CONV', 'Framework for understanding the energy supply issues facing society with a focus on the science,  engineering, and economic principles of the major al ternatives. Emphasis is on the physical and  chemical fundamentals of energ y conversion technologies.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 148') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 148';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 148', 'COMP SCI PROJECT', 'Team-based project development. Topics include software engineering and pro fessional development practices, interface design, advanced library support ; techniques for team oriented design and development, testing and test dri ven development, and software reliability and robustness. Students present and demonstrate final projects.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 141') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 141';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 141', 'SCI&ENG ENERGY CONV', 'Framework for understanding the energy supply issues facing society with a focus on the science, engineering, and economic principles of the major alternatives.  Emphasis is on the physical and chemical fundamentals of energy conversion technologies.', 'CH E', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH E 110A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH E 110A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH E 110A', 'CHEM ENGR THERMODYN', 'Use of the laws of thermodynamics to analyze processes encountered in engin eering practice, including cycles and flows. Equations-of-state for describ ing properties of fluids and mixtures. Applications, including engines, tur bines, refrigeration and power plant cycles, phase equilibria, and chemical -reaction equilibria.', 'CH E', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 100C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 100C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 100C', 'MICROECON THEORY', 'Covers topics including externalities, law and economics, information techn ologies, public goods and asymmetric information. These topics are essentia l to understanding real markets, but are currently not included in the Econ omics 100A-B sequence.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 6AL') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 6AL';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 6AL', 'ORGANIC CHEM LAB', 'Distillation, crystallization, extraction, determination of physical proper ties, spectroscopy, and instrumental methods in organic chemistry.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 154I') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 154I';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 154I', 'ECONOMIC FICTIONS', 'How have Western thinkers represented economic concepts since the eighteent h century? Themes may include free market liberalism, labor theories of val ue, household and family economics, currency/monetary policy, associationis m/socialism, globalism/expansionism/colonialism, protectionism, and others. In English.', 'C LIT', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "G  ", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "G  ", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 193') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 193';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 193', 'TRANSLATION STUDIES', 'Individualized instruction to complete the capstone   translation project f or the Minor in Translation Studies.   To be completed with the faculty adv isor from the language   department of the student''s focus.', 'C LIT', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 190DE') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 190DE';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 190DE', 'SPECIAL TOPICS', 'Provides for the study of topics of current interest in   computer science: A. Foundations; B. Software Systems; C.   Programming Languages and Softwa re Engineering; D.   Information Management; E. Architecture; F. Networking ; G.   Security; H. Scientific Computing; I. Intelligent and   Interactive Systems; N. General.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 129') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 129';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 129', 'CAT1-SCIENCE', 'Introduction to learning and teaching science in grades   K-8.  The course requires attending a weekly on-campus seminar and participating in 15 hours of field placement in a local school.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 130') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 130';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 130', 'CAT2-MATH', 'Introduction to learning and teaching mathematics in grades   7-12.  The co urse requires attending a weekly on-campus   seminar and participating in 1 5 hours of field placement in a   local school.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 194DG') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 194DG';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 194DG', 'DIG', 'Students participate in the Dean''s Investment Group (DIG). DIG members do e xtensive research to design and manage the Dean''s Investment Fund. They hav e primary responsibility for all investment decisions and have the opportun ity to meet regularly with industry experts on the Board of Advisors.', 'ECON', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 196H') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 196H';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 196H', 'HONORS RESEARCH', 'Student engages in research leading to a paper of considerable depth and co mplexity on a topic dealing with the literature of the student''s focus.', 'C LIT', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 160DM') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 160DM';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 160DM', 'DIGITAL CONSUMER BX', 'Gain an understanding of the foundations of consumer behavior and explore h ow these foundational concepts apply to the ?digital world? inhabited by mo dern consumers?one defined by the interaction of ?new? technologies with ?o ld? psychological processes and environments.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 194GC') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 194GC';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 194GC', 'GEOSCIENCE CAREERS', 'Intensive research or study by a small group of advanced students who share an interest in a topic not included in the regular departmental curriculum .', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 175') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 175';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 175', 'AS AM THEORY & METH', 'Exploration of the main theoretical orientations that   have shaped Asian A merican studies; race and ethnicity, diasporas, international labor migrati on, etc. Introduction to several methodologies, including historiography, q uantitative social science, literary criticism and ethnography.', 'AS AM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 154') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 154';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 154', 'COMPUTER ARCHITECT', 'Introduction to the architecture of computer systems. Topics   include: cen tral processing units, memory systems, channels   and controllers, peripher al devices, interrupt systems,   software versus hardware tradeoffs.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 197') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 197';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 197', 'SPEC TOPICS EDUC', 'Topics vary by instructor.', 'ED', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ED 134') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ED 134';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ED 134', 'ADV PROB SOLVE MATH', 'Focuses on the strategies, representations, and language   learners use to conceptualize and develop fundamental ideas of mathematics. Includes advanc ed mathematical problem solving and its implications for teaching and learn ing at the secondary level. Especially suitable for prospective middle scho ol and high school teachers.', 'ED', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 148') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 148';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 148', 'CREATIVE CHAOS', 'Chaos: is it primordial mayhem and confusion? Or does chaos permit the poss ibility of form and creativity? Course explores the order and disorder of c haos within literary, scientific, and philosophical narratives. From Hesiod and Ovid through Diderot, Wordsworth, and Pynchon.', 'C LIT', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 147B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 147B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 147B', 'DIGITAL CONTROL', 'Analysis of sampled data feedback systems; state space description of linea r systems: observability, controllability, pole assignment, state feedback, observers. Design of digital control systems.', 'ECE', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 155') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 155';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 155', 'CRITICAL AI', 'Artificial intelligence now affects nearly all aspects of human life and kn owledge production, from labor to language, and from fundamental physics to the arts. The pivotal role of the humanities lies in the critical analysis of the specific cultural techniques emerging from this technical revolutio n: new methods of language processing, image production, scientific reasoni ng, and social control require new critical and historical approaches. This course provides an introduction to the history and theory of artificial in telligence from the perspective of the humanities. Participants will acquir e the skills to analyze and understand the design and construction of machi ne learning systems, and their philosophical and political implications.', 'C LIT', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ANTH 193') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ANTH 193';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ANTH 193', 'GRADSCHOOL&JOBPREP', 'This course is designed to guide students: (1) through the graduate school application process, and (2) in how to prepare for the job market. We will consider all steps and components of applying to graduate school. The secon d half of class will focus on best practices for finding jobs after graduat ion.', 'ANTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 121') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 121';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 121', 'PRIN OF EVOLUTION', 'A foundation course concerning the mechanisms of evolution at   micro- and macroevolutionary levels, and interpretation of the   resulting patterns of adaptation and organic diversity.', 'EARTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 5') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 5';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 5', 'STAT ECON', 'An introduction to probalistic modeling and statistical inference applied t o the analysis of economic data for students with basic knowledge of calcul us. Topics covered include: probability, discrete and continuous random var iables, probability distributions, mean, variance, correlation, sampling, p arameter estimation, unbiasedness and efficiency, confidence intervals, hyp othesis testing. Computing labs with Excel.', 'ECON', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 103') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 103';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 103', 'STRUCTURAL GEOLOGY', 'Deformation of rocks--faulting, folding and flow. Theory and   observations at scales ranging from mountain belts to   microscopic. Lab and lecture.', 'EARTH', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 134') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 134';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 134', 'GEOL DATA ANALYSIS', 'Various numerical methods for analysis of data are developed. Methods are s tatistical inference, error propagation, least squares, time series as appl ied to geological and geophysical examples. Lab and lecture.', 'EARTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 186B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 186B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 186B', 'GENDER IN BASQUE', 'Using Basque culture as a case study, this course explores how gender inter sects with other crucial issues such as ethnicity, nationhood, and globaliz ation.', 'C LIT', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 173') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 173';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 173', 'GROUNDWATER', 'Analysis of groundwater flow in complex geologic environments, aquifer prop erties, wells and groundwater contamination, surface water-groundwater inte ractions. Laboratory: basic groundwater experiments, Darcy''s law, flow nets , solute dispersion, field measurements of bedrock groundwater, analysis of pumping-test data.', 'EARTH', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 130A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 130A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 130A', 'SIGNAL ANALYSIS', 'Analysis of continuous time linear systems in the time and frequency   doma ins. Superposition and convolution. Bilateral and unilateral Laplace transf orms. Fourier series and Fourier transforms. Filtering, modulation, and fee dback.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 56B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 56B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 56B', 'MODERN DANCE I', 'Analysis and exploration of the technical aspects of movement   as an expre ssive medium. For dance majors.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 47B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 47B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 47B', 'BALLET I', 'Analysis and exploration of technical and expressive elements   of the ball et. For dance majors.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 125') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 125';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 125', 'ASIAN-AMER THEATER', 'Overview of Asian American theater and its political and artistic achieveme nts, from foundational Asian American theater companies and playwrights to contemporary performance artists. Issues addressed include race and ethnici ty, gender and sexuality, and intergenerational conflict.', 'AS AM', '4', '[{"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "CRST"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 130B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 130B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 130B', 'DATA STRUCT ALG II', 'Design and analysis of computer algorithms. Correctness proofs and solution of recurrence relations. Design techniques; divide and conquer, greedy str ategies, dynamic programming. Applications of techniques to problems from s everal disciplines. NP - completeness.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 140') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 140';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 140', 'PARA SCI COMP', 'Fundamentals of high performance computing and parallel algorithm design fo r numerical computation. Topics include parallel architectures and clusters , parallel programming with message-passing libraries and threads, program parallelization methodologies, parallel performance evaluation and optimi zation, parallel numerical algorithms and applications with different perfo rmance tradeoffs.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 167A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 167A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 167A', 'SOLO EXPLORATION', 'Project development techniques, exploring modes of creative expression thro ugh various art disciplines and live performance techniques. Students engag e in weekly workshops and discussions to build a tool kit for innovative da nce creation.', 'DANCE', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 156E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 156E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 156E', 'MODERN DANCE IV', 'Further analysis and exploration of the technical aspects of   dance as an expressive medium.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 156B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 156B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 156B', 'MODERN DANCE III', 'Advanced analysis and exploration of the technical aspects of   dance as an expressive medium. For dance majors.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 147B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 147B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 147B', 'BALLET III', 'Advanced analysis and exploration of the technical and   expressive element s of ballet. For dance majors.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 147E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 147E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 147E', 'BALLET IV', 'Further analysis and exploration of the technical aspects of   dance as an expressive medium.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 56E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 56E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 56E', 'MODERN DANCE II', 'Analysis and exploration of the technical aspects of movement   as an expre ssive medium at the intermediate level. For dance   majors.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 47E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 47E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 47E', 'BALLET II', 'Further analysis and exploration of technical and expressive   elements of ballet. For dance majors.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 165B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 165B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 165B', 'MACHINE LEARNING', 'Covers the most important techniques of machine learning (ML) and includes discussions of: well-posed learning problems; artificial neural networks; c oncept learning and general to specific ordering; decision tree learning; g enetic algorithms; Bayesian learning; analytical learning; and others.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 174B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 174B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 174B', 'DES & IMP DTBS SYS', 'Queries and processing, optimizer, cost models, execution plans, rewriting rules, access methods, spatial indexing; transactions, ACID properties, con currency control, serializability, two-phase locking, timestamping, logging ,checkpointing, transaction abort and commit, crash recovery; distributed d atabases.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 185') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 185';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 185', 'HUM-COMP INTERACT', 'The study of human-computer interaction enables system architects to design useful, efficient, and enjoyable computer interfaces. This course teache s the theory, design guidelines, programming practices, and evaluation proc edures behind effective human interaction with computers.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 130A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 130A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 130A', 'DATA STRUCT ALGOR', 'Data structures and applications with proofs of correctness and analysis. H ash tables, priority queues (heaps); balanced search trees. Graph traversal techniques and their applications.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 105PP') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 105PP';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 105PP', 'PPART INT SPATIAL', 'Developing your own voice in sculpture and installation while considering y our audience is central to this course. Each student is encouraged to work with existing skills and build new ones in exploratory, materially fascinat ing works. At least one of your works will be situated in the public realm. We examine recent public art practices, cultivating manual, conceptual and collaborative skills in both the studio and public realm.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 140B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 140B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 140B', 'INTRO ECONOMETRICS', 'Topics in econometrics including regression specification, time series econ ometrics, panel data, and instrumental variables.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 190BH') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 190BH';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 190BH', 'HONORS THESIS', 'Focus on method/methodology (in connection to data collection), data collec tion, and initial analysis of data.', 'BL ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 1') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 1';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 1', 'INTRO AF-AM STUDIES', 'Explores historical and current social conditions of Black people in the Un ited States. Topics include the following: origins of Black Studies; chatte l slavery and resistance; Reconstruction; Jim Crow segregation; Harlem Rena issance; Black Nationalism; structural racism and anti-Blackness; Civil Rig hts and Black Power Movements; racial wealth gap; critical race theory and Neo-liberalism; carcerality and the prison industrial complex; white privil ege and rage; and the intersection of race, gender, class, and sexuality in shaping Black identity and life chances. As a 5 unit course, BLST 1 is rea ding and writing intensive, with a focus on developing research skills thro ugh a Black Studies lens.', 'BL ST', '5', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "D  ", "geCollege": "ENGR"}, {"geCode": "D  ", "geCollege": "L&S "}, {"geCode": "AMH", "geCollege": "UCSB"}, {"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "CRST"}, {"geCode": "ETH", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 190B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 190B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 190B', 'SENIOR THESIS', 'Focus on method/methodology (in connection to data collection), data collec tion, and initial analysis of data.', 'BL ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 117') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 117';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 117', 'SLAVERY & MODERNITY', 'An interdisciplinary examination of Black slavery as both a historical even t and an enduring condition. The course highlights the foundational role of colonialism and the transatlantic slave trade in the making of European mo dernity, the white subject of rights and the black dispossessed nonbeing, l iberal democracy, and contemporary regimes of black captivities. Special fo cus is given to the political and economic history of the United States, th e Caribbean and Brazil as slavocracies and to the incomplete project of ema ncipation that renders Black citizenship at best elusive. Critical transnat ional perspective highlights the spatio-temporal continuum between plantati on regimes and contemporary global racial apartheid.', 'BL ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 126B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 126B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 126B', 'READING TAIWAN LIT', 'A selection of texts in Chinese by representative authors; works after WW I I to the present. Designed for advanced students to gain an overall view of achievements of major writers in different genres.', 'CHIN', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 100') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 100';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 100', 'INT PAINTING', 'Various projects designed to assist the understanding and development of contemporary painting practices. Supplemented with slide lectures and class critique. Additional self-directed projects, sketch books, experimentati on, and   independent research are encouraged.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 101') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 101';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 101', 'ADV PAINTING', 'Special critique-based class addressing current issues in   contemporary pa inting. ''Painting'' will be used in broadest   sense including traditional m ethods, and digital painting   (digitally manipulated images as source), in stallation and   inter-media practices utilizing paint as dominant medium.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 117') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 117';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 117', 'INT DRAWING', 'Continuing investigation into the challenges of two-  dimensional represent ation. Course focus to depend on   instructor, but may include structural a nd symbolic   implications of the human form, historical and contemporary strategies of visual analysis, and exploration into   experimental media.', 'ART', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 111') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 111';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 111', 'INT COMPUTAT SCI', 'Introduction to the numerical algorithms that form the foundations of data science, machine learning, and computational science and engineering. Matri x computation, linear equation systems, eigenvalue and singular value decom positions, numerical optimization. The informed use of mathematical softwar e environments and libraries, such as python/numpy/scipy.', 'CMPSC', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 118') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 118';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 118', 'AS AM POP CULTURE', 'A historical survey of how Asians and Asian Americans have been represented in   American popular culture and an analysis of alternative models of pop ular   culture. Texts include literature, theatre, television, and film.', 'AS AM', '4', '[{"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "F  ", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "CRST"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 133M') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 133M';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 133M', 'MEMORY: INT EXPLORE', 'Introduces students to the trans-disciplinary fields of memory and migratio n through interdisciplinary collaboration. Course responsibilities include class participation, a midterm essay and a final interdisciplinary project. This course draws upon the connections between neuroscience, arts and stud ies of human migration.', 'ART', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART 189B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART 189B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART 189B', 'CAP DESIGN', 'Students in Art 189A-B-C will be working in teams together with mechanical engineering students on a mechanical engineering capstone design project. T he teams work under the direction of a faculty advisor in mechanical engine ering, and to a lesser extent an advisor from the art department (and possi bly an industrial sponsor) to tackle an engineering design project. Enginee ring communication, such as reports and oral presentations, are covered. Em phasis on practical, hands-on experience, and the integration of analytical and design skills. Students should aim to commit to taking A, B and C in o rder to work with their team from conception to finalization of a project.T his lab is second of three in the series', 'ART', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 194B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 194B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 194B', 'ETHNC ST TEACH ED', 'Designed for students who are Black Studies, Chicana/o Studies, Asian Ameri can and/or Feminist Studies majors in the ÉXITO (Educational eXcellence and Inclusion Training Opportunities) program. Central to the year-long semina r will be preparations for students'' pursuit for a career as K-12 Ethnic St udies educators. Students will have direct assistance for preparing and app lying to Masters/Teacher Education Programs as well as professionalization workshops.', 'BL ST', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 160HC') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 160HC';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 160HC', 'HAPPINESS COMM', 'In this seminar, we examine how communication behaviors relate to construct ing happiness and well-being. Topics include gratitude, forgiveness, social support, appreciation, social networks, committing to goals, taking care o f your body and soul, and communicative contagion of mood- intersecting wit h issues of dyadic, group, and interpersonal communication. Auxiliary readi ngs come from a variety of disciplines, including psychology and sociology. This course intends to challenge students to think deeply and critically a bout happiness and purpose in their own lives.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 34') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 34';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 34', 'LIT OF THE AMERICAS', 'An introduction to the diverse literary traditions of the Americas through an examination of selected works. Regional focus on North America, the Cari bbean, and Latin America varies.', 'C LIT', '4', '[{"geCode": "G  ", "geCollege": "L&S "}, {"geCode": "G  ", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 104G') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 104G';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 104G', 'FIELD DATA ANALYSIS', 'Introduction to commonly used computer programs and techniques for analyzin g and visualizing surface and subsurface spatial and structural data in the Earth Sciences. Local site visits involve hands-on demonstrations in geolo gic data collection. Introduction to scientific writing. Lecture and Lab.', 'EARTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 159') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 159';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 159', 'EJCH', 'Examines intersection of environmental racism and health justice. With part icular focus on California, course explores the political economic infrastr ucture of urban and rural communities as they confront environmental racism and challenge its impact on community health.', 'AS AM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'AS AM 127') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'AS AM 127';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'AS AM 127', 'FILM, TV, MEDIA', 'Formal, historical, and cultural issues in the study of Asian American film , television, and digital media practices in independent, Hollywood, and tr ansnational contexts. The role of cinema and visual technology in the under standing of Asian Americans in modern and contemporary culture.', 'AS AM', '4', '[{"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "CRST"}, {"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "F  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART CS 101') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART CS 101';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART CS 101', 'DRAWING & PAINTING', 'Emphasis on the practice and development of making paintings and drawings.', 'ART  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART CS 102') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART CS 102';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART CS 102', 'THEMES', 'Drawing and painting in sequences, and according to themes.', 'ART  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ART CS 120') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ART CS 120';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ART CS 120', 'SCULPTURE', 'Practice in the design and development of making a sculpture using various materials as determined by particular faculty interest.', 'ART  CS', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 99RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 99RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 99RA', 'INDEP RESEARCH ASST', 'Coursework consists of faculty supervised research   assistance.', 'COMM', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 199RA', 'INDEP RESEARCH ASST', 'Coursework consists of faculty supervised research assistance.', 'COMM', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 82') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 82';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 82', 'MOD CHINESE LIT', 'This course, taught in English, surveys an archive of seminal short fiction , novellas, novels, and poems that tell the story of China and the Chinese from the end of the Qing dynasty to the present. What has been the place of literature in China in the modern era? What vision of modern China do we f ind in its literature? How, moreover, does literature subvert the national narrative? Through literature as a window on the history of modern China, s tudents will gain a better understanding of Chinese history and culture wit h regard to its social reform, revolution, war, cultural revolution, cultur al revival, and economic growth.', 'CHIN', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "G  ", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "G  ", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 82') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 82';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 82', 'MOD CHINESE LIT', 'This course, taught in English, surveys an archive of seminal short fiction , novellas, novels, and poems that tell the story of China and the Chinese from the end of the Qing dynasty to the present. What has been the place of literature in China in the modern era? What vision of modern China do we f ind in its literature? How, moreover, does literature subvert the national narrative? Through literature as a window on the history of modern China, s tudents gain a better understanding of Chinese history and culture with reg ard to its social reform, revolution, war, cultural revolution, cultural re vival, and economic growth.', 'C LIT', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "G  ", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}, {"geCode": "G  ", "geCollege": "ENGR"}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 115') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 115';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 115', 'ANALYTICAL METHODS', 'Optical properties of inorganic crystals; techniques of   mineral identific ation using the polarizing microscope;   strategies for studying rocks in t hin section. Fundamental   theory and application of electron and ion-beam instruments in quantitative characterization of geomaterials. Laboratory sessions include lectures as appropriate.', 'EARTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 125B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 125B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 125B', 'CONTEMP CHICANO ART', 'Examination and appraisal of the Chicana/o art movement within the context of contemporary American art and the contemporary art of Mexico. A survey o f major Chicano and Chicana artists and developments in Chicano painting, s culpture, graphic, and conceptual art from the late 1960''s to the present.', 'CH ST', '4', '[{"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "F  ", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "CRST"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 196HA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 196HA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 196HA', 'SR HONORS THESIS', 'Three quarter individual research project under the direction   of a facult y member. Oral defense of written thesis as   required by the sponsoring fa culty advisor.', 'EARTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 196HB') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 196HB';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 196HB', 'SR HONORS THESIS', 'Three quarter individual research project under the direction   of a facult y member. Oral defense of written thesis as   required by the sponsoring fa culty advisor.', 'EARTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 196HC') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 196HC';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 196HC', 'SR HONORS THESIS', 'Three quarter individual research project under the direction of a faculty member. Oral defense of written thesis as required by the sponsoring facult y advisor.', 'EARTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EACS 128') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EACS 128';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EACS 128', 'RELIG ENVIR ANTHRO', 'What can ancient religious traditions do for environmental protection?  Thi s class examines doctrinal examples, both potential and actual, of religiou s environmentalism in China, India, Japan, and the U.S.:  with Buddhism, Da oism, Hinduism, Shinto, and Protestantism.', 'EACS', '4', '[{"geCode": "E  ", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "E  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 188') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 188';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 188', 'NEWS POLITICS DEMOC', 'Explores the role of the news media in sustaining American democracy. Stude nt projects identify the most difficult problems facing American journalism and propose creative solutions for helping the news media fulfill its demo cratic function. Topics include news industry consolidation, "fake news," p olitical polarization, and the role of social media. Students will come awa y from this course with a more engaged, critical, and empowered view of wha t "the news can do for democracy."', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM W 188') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM W 188';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM W 188', 'NEWS POLITICS DEMOC', 'Explores the role of the news media in sustaining American democracy. Stude nt projects identify the most difficult problems facing American journalism and propose creative solutions for helping the news media fulfill its demo cratic function. Topics include news industry consolidation, "fake news," p olitical polarization, and the role of social media. Students will come awa y from this course with a more engaged, critical, and empowered view of wha t "the news can do for democracy."', 'COMM W', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 181') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 181';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 181', 'THE CHICANO NOVEL', 'Reading, analysis, and critique of the contemporary Chicano novel as it per tains to the Chicano experience.', 'CH ST', '4', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "G  ", "geCollege": "L&S "}, {"geCode": "G  ", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "CRST"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 3') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 3';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 3', 'INTRO TO EE', 'This course represents a comprehensive foundation for core ECE topics in si gnal processing, image  analysis, machine learning, optimization and contro l. The lectures present concepts from linear  algebra, such as matrix compu tations, systems of linear equations, eigenspace decomposition,  inner-prod uct, orthogonality, least-squares and linear regression. Students actively engage with the technical materials with an introduction to Python programm ing and associated hands-on sessions. The materials are be motivated by rea l-world scenarios ranging from medical imaging to autonomous  vehicles, fro m (miscarriage of) justice to brain-machine interfaces, from music analysis to GPS design.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 122C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 122C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 122C', 'HOLOCAUST IN ITALY', 'Through readings of memoir, fiction, and film, this course investigates the fate of Jews under the Italian Fascists of Benito Mussolini (1922-1945). T opics include Fascism, Communism, anti-Semitism, Italian cooperation with t he Nazis, the Catholic Church, the Resistance Movement, deportations and ex termination camps, and individual / collective memory after World War II. S tudents will be exposed to great literary and cinematographic works and thr ough them develop a thorough understanding of this pivotal period in modern Italian history.', 'C LIT', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 118') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 118';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 118', 'SOC/HIST EVOL TECHS', 'This course is about how technologies and people have evolved together over time. Although we are surrounded by technologies in our daily lives we rar ely consider the tremendous impacts they are having on us, the complex hist orical circumstances that result in the adoption and use of particular tool s, and the complicated relations between technologies and society. The inte ntion is to understand the social and historical co-evolution of technologi es by examining theories of human behavior and society as well as research evidence in these domains. Ultimately, the goal is to generate a complete a nd contextualized understanding of technologies and social relations that i s both historically rich and currently relevant.', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 194P') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 194P';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 194P', 'SPECIAL TOPICS ECE', 'Group studies intended for small number of advanced students who share an i nterest in a topic not included in the regular departmental curriculum.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 194') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 194';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 194', 'GROUP STUDIES ADV', 'Selected topics in accordance with instructor''s area of   specialization.', 'COMM', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BIOE 120B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BIOE 120B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BIOE 120B', 'CELLULAR BIOENGR', 'Introduces students to structural components of cells with application of e ngineering principles for analysis. Topics include: biomembrane structure a nd function, membrane proteins, membrane transport, intracellular compartme nts, intracellular trafficking, chemotaxis, cell cycle, apoptosis, and stem cells.', 'BIOE', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 87') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 87';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 87', 'STAT ANALY COMM', 'An introduction to basic statistical concepts and applications in communica tion research. Through lecture and computer labs, students are exposed to t he principles and procedures involved in quantitative data analysis.', 'COMM', '5', '[{"geCode": "C  ", "geCollege": "L&S "}, {"geCode": "QNT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 82MX') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 82MX';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 82MX', 'MODERN PHYSICAL', 'Open-level Modern/Contemporary Physical Practice is an introductory studio- based course exploring various movement modalities in the area of modern an d contemporary dance technique. Investigates different initiations for mome nt within the body, energetic flow, rhythmic form and structure and the bui lding blocks of anatomically healthy movement practices in various styles w ithin modern dance.', 'DANCE', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 182MX') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 182MX';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 182MX', 'MODERN PHYSICAL', 'Open-level Modern/Contemporary Physical Practice is an intermediate/advance d studio-based course exploring various movement modalities in the area of modern and contemporary dance technique, and builds on the skills learned i n the lower-division level. Continued Investigations in different initiatio ns for moment within the body, energetic flow, rhythmic form and structure and the building blocks of anatomically healthy movement practices in vario us styles within modern dance.', 'DANCE', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 82BX') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 82BX';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 82BX', 'BALLET PHYSICAL', 'Open-level Ballet Physical Practice is an introductory studio-based course focused on various ballet technique forms. This course covers all elements of standard ballet classes-including barre, center, and petit and grand all egro.', 'DANCE', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 182BX') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 182BX';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 182BX', 'BALLET PHYSICAL', 'Open-level Ballet Physical Practice is an intermediate/advanced studio-base d course focused on various ballet technique forms. This course covers all elements of standard ballet classes-including barre, center, and petit and grand allegro.', 'DANCE', '2', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 100B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 100B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 100B', 'MICROECON THEORY', 'Economic theory relating to imperfectly competitive product   markets, inpu t market, and welfare, with emphasis on   applications. Includes an introdu ction to game theory.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 101') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 101';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 101', 'MACROECON THEORY', 'Contemporary analysis of income, employment, price level, and   public poli cy using static general equilibrium framework with   emphasis on applicatio ns of theory. Long term economic growth   is also covered.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 136A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 136A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 136A', 'INTERMED ACCOUNTING', 'An in-depth analysis of recognition, measurement,   classification, and val uation issues in financial reporting   within the framework of generally ac cepted accounting   principles. Case studies and microcomputer analysis   s oftware will be integrated into the course.', 'ECON', '5', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 137A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 137A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 137A', 'MANAGERIAL ACCTG', 'A two quarter series covering the theory and application of   managerial ac counting concepts. The course investigates the   interaction between econom ic theory, financial accounting,   and management decision making for plann ing and control.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 138A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 138A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 138A', 'INCOME TAXATION', 'An introduction to taxation. The basic theories, concepts, and general rule s of federal income tax and their interrelationships with personal, busines s, and financial transactions. The course provides an understanding of tax policies and the interrelationship between tax and financial decisions.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECON 189') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECON 189';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECON 189', 'LAW AND ETHICS', 'Provides a basic understanding of ethics and the legal   framework within w hich U.S. businesses operate. Includes a   broad overview of court procedur es and in-depth coverage of   selected topics including contracts, securiti es, and property   rights.', 'ECON', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EACS 103C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EACS 103C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EACS 103C', 'ANTHRO OF KOREA', 'This course is an introduction to contemporary Korea   covering the major s ocietal transformations since the Korean War. Topics include nationalism, t he creation of national symbols and racial identity, family, marriage, cons umption, television dramas, globalization, tourism, and new Korean   Wave.', 'EACS', '4', '[{"geCode": "D  ", "geCollege": "L&S "}, {"geCode": "D  ", "geCollege": "ENGR"}, {"geCode": "NWC", "geCollege": "L&S "}, {"geCode": "NWC", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 187Z') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 187Z';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 187Z', 'MUSEUM STUDIES', 'Examines a range of historical, theoretical, and practical   issues with wh ich the field of Museum Studies is engaged.    Topics and format will vary.', 'ARTHI', '4', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 151B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 151B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 151B', 'CHOREOGRAPHY', 'Analysis of the elements of choreographic form; styles and   trends; experi ence in development of dance studies; theory   and technique of advanced gr oup choreography. Part B taps more broadly into the methods and theories be hind dance composition and movement invention and interrogates multiple poi nts of entry into the making process.  Self-solo, duet and trio form is exp lored.', 'DANCE', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 140') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 140';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 140', 'TANG LIT HIST', 'Examines the history of literature during the celebrated Tang dynasty (618- 907). Focus on changes in literary norms, practices, and theory as they int ersected with societal, political, intellectual, and religious developments . Also considers problems of historiography. Emphasis varies by quarter.', 'CHIN', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 190') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 190';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 190', 'UCSB DANCE COMPANY', 'Selected students work as dancers in the UCSB Dance Company, studying and a nalyzing choreography through rehearsal and performance. The company perfor ms locally and/or on tour. Students experience the integral workings of a t ouring dance company.', 'DANCE', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 50') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 50';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 50', 'FUND CHOREOGRAPHY', 'A study of the basic elements pertaining to the craft of   choreography. Em phasis on exploration of movement variation,   breath rhythm, the developme nt of dance phrases, and the use   of stage space. For dance majors.', 'DANCE', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 45') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 45';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 45', 'HIST & APPREC DANCE', 'Introduction to history and appreciation of dance. Explores dance from a wi de cross-cultural perspective of cultural mutuality and diversity, establis hed traditions, and the power of dance to bring about social change, activi sm and justice.', 'DANCE', '4', '[{"geCode": "F  ", "geCollege": "L&S "}, {"geCode": "F  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'DANCE 191') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'DANCE 191';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'DANCE 191', 'SENIOR PROJECT', 'Choreographic or performance project produced as the culminating presentati on for the B.F.A. degree. Course includes detailed documentation of the pro cedure followed during the creation of the final project, and results in a written and visual document following a closely crafted prompt.', 'DANCE', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 186LS') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 186LS';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 186LS', 'LIT OF THE SEA', 'The premodern Mediterranean was a site of civilizational confluence, confli ct, and transformation, which historians have characterized as both "fragme ntation" and "connectivity." This course addresses tales of love, sex, and slavery in medieval and early modern Mediterranean literatures. Love and sl avery-two forms of "captivity"-allow us to study religious and cultural int eractions, voluntary and involuntary movement across the sea, and the produ ction and articulation of difference. Adopting a Mediterranean Studies lens , this course aims to define what it means to "think Mediterranean" by read ing and analyzing texts from a diverse body of languages and literatures, i ncluding Arabic, Aljamiado, French, Italian, Latin, Persian, and Spanish.', 'C LIT', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 115N') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 115N';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 115N', 'INDGNS ST INTRN', 'Introduction to NAGPRA(s) and campus repatriation efforts toward compliance through supporting and/or contributing to the work of the UCSB Repository of Archaeological and Ethnographic Collections. Students learn about local indigenous community issues and allyship and acquire archival, collections, database and/or GIS experience based on interest. (Internships comprise at tendance at a 1-hour seminar each week and flexible hours of supervised wor k.)', 'CH ST', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHEM 163') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHEM 163';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHEM 163', 'ORG ARROW PUSH', 'Covers the arrow pushing formalism and addresses organic   reactions from t his perspective.', 'CHEM', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 102A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 102A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 102A', 'INTRO TO TRANSLAT I', 'Comprises topics necessary to develop skills that are needed for writing at a specialized level and to carry out written translation into and from Spa nish, mostly texts on business and medical topics.', 'C LIT', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 5A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 5A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 5A', 'INTRO DATA SCI 1', 'Introduction to data science methods and Python programming language for st udents with little to no experience in the subjects. Topics include foundat ional programming concepts, problem-solving strategies and code design, and data science concepts as table operations, exploratory data analysis, basi c probability.', 'CMPSC', '4', '[{"geCode": "C  ", "geCollege": "L&S "}, {"geCode": "QNT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSC 5B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSC 5B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSC 5B', 'INTRO DATA SCI 2', 'Students explore the data science lifecycle, including question formulation , data collection and cleaning, exploratory data analysis and visualization , statistical inference and prediction, and decision-making. The course foc us is on transforming and analyzing data; machine learning methods includin g regression, classification and clustering; principles behind data visuali zations; concepts of measurement error and prediction; and techniques for s calable data processing.', 'CMPSC', '4', '[{"geCode": "C  ", "geCollege": "L&S "}, {"geCode": "QNT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 190') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 190';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 190', 'UCSB CHI/LAT ST ACT', 'Examines the history of UCSB Chicanx/Latinx student activism on campus from the late 1960s until the present. Starting with the April 1969 El Plan de Santa Barbara conference, the class examines critical events such as the 19 68 and 1975 North Hall protests, the 1989 and 1994 hunger strikes, and the student-led movement to save El Centro from demolition in the mid-2010s. Sp ecial focus is placed on conducting archival research on Chicanx/Latinx stu dent activism and solidifying El Centro Arnulfo Casillas a sacred site/home for future generations of students, particularly those engaged in struggle s to decolonize the university.', 'CH ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CMPSCW 8') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CMPSCW 8';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CMPSCW 8', 'INTRO TO COMP SCI', 'Introduction to computer program development for students with little to no programming experience. Basic programming concepts, variables and expressi ons, data and control structures, algorithms, debugging, program design, an d documentation.', 'CMPSCW', '4', '[{"geCode": "C  ", "geCollege": "L&S "}, {"geCode": "QNT", "geCollege": "L&S "}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 170') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 170';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 170', 'INTRO TRANSLATION', 'The course aims to develop skills in terminology and technologies of transl ation;   it also examines the practical and theoretical issues pertaining t o translation as   an artistic, cultural, and ethical process. Focus on lit erary translation as   creative research and practice.', 'C LIT', '4', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "G  ", "geCollege": "L&S "}, {"geCode": "G  ", "geCollege": "ENGR"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CH ST 191SV') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CH ST 191SV';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CH ST 191SV', 'SPEC TOPICS CH STU', 'Designed to allow courses of varying topics in areas of expertise of visiti ng professors to broaden opportunities for students. Examples might be: imm igration, Native American, Mexican, or Latin American influences on the Chi cano, legal issues, the migrants.', 'CH ST', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 136B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 136B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 136B', 'OPTICS & IMAGING', 'Photonics, with an emphasis on imaging: optical design (Zemax), ray transfe r matrices, aberrations, scattering, resolution and optical transfer functi ons, adaptive optics, polarization, laser scanning, ultrafast pulses, detec tors, superresolution, and VR/AR.', 'ECE', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 186BU') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 186BU';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 186BU', 'BULGAKOV', 'Intensive study of Bulgakov. Readings supplemented by selected criticism. T aught in English.', 'C LIT', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 194BG') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 194BG';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 194BG', 'GROUP STUDIES', 'Intensive research or study by a small group of advanced students who share an interest in a topic not included in the regular departmental curriculum .', 'EARTH', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'EARTH 194CC') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'EARTH 194CC';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'EARTH 194CC', 'GROUP STUDIES', 'Intensive research or study by a small group of advanced students who share an interest in a topic not included in the regular departmental curriculum .', 'EARTH', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 122B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 122B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 122B', 'THIRD-YR CHINESE II', 'Advanced practice in grammar and composition.', 'CHIN', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'COMM 175GW') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'COMM 175GW';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'COMM 175GW', 'COMM AND GIG WORK', 'Examines the communicative and organizational dynamics associated with the rise of the "gig" economy as it reshapes work all around the world. Heralde d by many as a new form of employment which offers workers flexibility and autonomy, others raise questions regarding equitable work practices, worker privacy, algorithmic control, work motivation, work overload, technostress , and workers'' rights. The course explores the ways in which communication plays a central role in how states regulate and classify gig work, how work ers experience gig work, and the ways in which these emerging platforms may reproduce gender and racial disparities in opportunities and wage earnings .', 'COMM', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 186EB') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 186EB';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 186EB', 'BASQUE LIT & TRANSL', 'The course delves deeper into the diversity of topics that make up Basque S tudies, analyzing historical, but also contemporary socio-cultural topics r elated to the Basque Country and the Basque diaspora abroad. The course can be taken either as a continuation of SPAN 153E or a self-standing course o n Basque Studies, where literary and cultural materials will be presented i n their English, Spanish, and possibly also French translations depending o n student interest and language choice.', 'C LIT', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'BL ST 137E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'BL ST 137E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'BL ST 137E', 'BLACK FAMILIES', 'Sociological overview of the experiences of Black families in the United St ates from enslavement to more contemporary eras. Sociological analysis of t he changing historical significance of Black families in the United States will be presented.', 'BL ST', '4', '[{"geCode": "WRT", "geCollege": "L&S "}, {"geCode": "WRT", "geCollege": "ENGR"}, {"geCode": "AMH", "geCollege": "UCSB"}, {"geCode": "ETH", "geCollege": "L&S "}, {"geCode": "ETH", "geCollege": "ENGR"}, {"geCode": "ETH", "geCollege": "CRST"}]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 192C') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 192C';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 192C', 'VIS TECH INTERNSHIP', 'An internship in the Visual Resource Collection to develop skills in the vi sual technologies relevant to art history teaching and research. Three hour s per week per unit (total 30 hours/unit), plus weekly meetings and final e valuation session. Written report required.', 'ARTHI', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 192D') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 192D';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 192D', 'UCSB INTERNSHIP', 'Under supervision of History of Art & Architecture faculty, students may ob tain credit for internship work on UCSB''s campus, excluding the ADA Museum, the ADC, and the IRC internships. Students earn one unit for every 30 hour s of work in their internship. Regular meetings, a final evaluation session , and a written report are required.', 'ARTHI', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 192E') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 192E';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 192E', 'OFF CAMPUS INTERN', 'Under supervision of History of Art & Architecture faculty, students may ob tain credit for work in a museum, gallery, or architecture firm. Students e arn one unit for every 30 hours of work in their internship. Regular meetin gs, a final evaluation session, and a written report are required.', 'ARTHI', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 192A') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 192A';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 192A', 'UNIV ART MUS INTERN', 'Under supervision of History of Art & Architecture faculty, students may ob tain credit for work in the University Art Museum. Students earn one unit f or every 30 hours of work in their internship. Regular meetings, a final ev aluation session, and a written report are required.', 'ARTHI', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ARTHI 192B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ARTHI 192B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ARTHI 192B', 'ADC INTERNSHIP', 'Under supervision of History of Art & Architecture faculty, students may ob tain credit for work in the Architecture and Design Collection. Students ea rn one unit for every 30 hours of work in their internship. Regular meeting s, a final evaluation session, and a written report are required.', 'ARTHI', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 199') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 199';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 199', 'INDEPENDENT STUDIES', 'Independent studies with any faculty member. To permit study   of a subject desired by the student but not covered in course   offerings.', 'C LIT', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'C LIT 199RA') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'C LIT 199RA';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'C LIT 199RA', 'IND RSCH ASSIST', 'Independent research under supervision of a faculty member. May be linked t o internship.', 'C LIT', NULL, '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'CHIN 127B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'CHIN 127B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'CHIN 127B', 'ADVCHIN PRACTICE II', 'Course series for students who have advanced levels in Chinese. Extensive r eading and discussion of various styles and practices of the Chinese langua ge in addition to topics on modern and contemporary China. Teaching materia ls from literary works, newspapers, internet, and films.', 'CHIN', '4', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;

DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = 'ECE 188B') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '1', '2023' FROM "Course" WHERE gold_id = 'ECE 188B';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES ( 'ECE 188B', 'SENIOR EE PROJECT', 'Student groups design a significant project based on the knowledge and skil ls acquired in earlier coursework and integrate their technical knowledge t hrough a practical design experience. The project is evaluated through writ ten reports, oral presentations, and demonstrations of performance.', 'ECE', '3', '[]'::json, '[]', '[]')

        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('1', '2023', course_id);
    END IF;
END $$;
