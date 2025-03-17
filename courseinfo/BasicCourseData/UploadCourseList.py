# pip install python-dotenv
# pip install psycopg2-binary
import json
from dotenv import load_dotenv
import os
import psycopg2
from psycopg2 import sql
import os
import argparse
load_dotenv(dotenv_path="./../gauchograduate/.env")

def UploadFile(filePath:str, startFromScratch:bool = False):
    with open(filePath, 'r') as f:
        commandsFile = open("commands.sql", "w")
        table_name = '"Course"'
        
        data = json.load(f)
        pageNumber = data['pageNumber']
        pageSize = data['pageSize']
        total = data['total']
        classes = data['classes']

        if startFromScratch:
            commandsFile.write("TRUNCATE " + '"Course"' + "CASCADE;\n")
            commandsFile.write("TRUNCATE " + '"Offering"' + "CASCADE;\n")

        for indiv_class in classes:
            # indiv_class is dict_keys(['quarter', 'courseId', 'title', 'contactHours', 'description', 'college', 'objLevelCode', 'subjectArea', 'unitsFixed', 'unitsVariableHigh', 'unitsVariableLow', 'delayedSectioning', 'inProgressCourse', 'gradingOption', 'instructionType', 'instructionTypeSecondary', 'onLineCourse', 'deptCode', 'generalEducation', 'classSections'])
            quarter = indiv_class['quarter'].strip()
            goldId = indiv_class['courseId'].strip()
            title = indiv_class['title'].strip()
            description = indiv_class['description'].strip()
            subjectArea = indiv_class['subjectArea'].strip()
            units = str(indiv_class['unitsFixed'])
            genEd = str(indiv_class['generalEducation'])
            prereq = "[]"
            unlock = "[]"

            goldId = " ".join(goldId.split())
            title = title.replace("'", "''")
            description = description.replace("'", "''")
            genEd = json.dumps(genEd)
            genEd = genEd.replace("'", '"')
            genEd = genEd[1:-1]
            if units == "None":
                units = "NULL"
            else:
                units = "'" + units + "'"
            
            year = quarter[0:4]
            quarter = quarter[4]
            # course_values = "INSERT INTO " + table_name + "\nVALUES ( '"+goldId +"', '"+ title +"', '"+ description +"', '"+subjectArea +"', "+ units +", "+ json.dumps(genEd) +", '"+prereq +"', '"+ unlock+ "');\n"
            course_values = "( '"+goldId +"', '"+ title +"', '"+ description +"', '"+subjectArea +"', "+ units +", '"+ genEd +"'::json, '"+prereq +"', '"+ unlock+ "')\n"
            commandsFile.write(
f"""
DO $$
DECLARE
    course_id INT;
BEGIN
    IF EXISTS (SELECT 1 FROM "Course" WHERE gold_id = '{goldId}') THEN
        INSERT INTO "Offering" ("courseId", quarter, year)
        SELECT id, '{quarter}', '{year}' FROM "Course" WHERE gold_id = '{goldId}';
    ELSE
        INSERT INTO "Course" (gold_id, title, description, subject_area, units, general_ed, prerequisites, unlocks)
        VALUES {course_values}
        RETURNING id INTO course_id;

        INSERT INTO "Offering" (quarter, year, "courseId")
        VALUES ('{quarter}', '{year}', course_id);
    END IF;
END $$;
""")

        name = os.getenv('POSTGRES_URL_NON_POOLING_NAME')
        password = os.getenv('POSTGRES_URL_NON_POOLING_PASSWORD')
        host = os.getenv('POSTGRES_URL_NON_POOLING_HOST')
        port = os.getenv('POSTGRES_URL_NON_POOLING_PORT')

        connection = psycopg2.connect(dbname = name, user = name, password = password, host = host, port = port)
        cursor = connection.cursor()
        with open("commands.sql", 'r') as file:
            sql_content = file.read()
        cursor.execute(sql.SQL(sql_content))
        connection.commit()
        print(f"Uploaded courses Database from {filePath}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Script that uploads data to the database."
    )
    parser.add_argument("file_path", type=str, help="Enter a file path (ie. 20241-undergrad/page1.json)")
    parser.add_argument("--d", type=str, help="if true this will delete everything")
    args = parser.parse_args()

    file_path = args.file_path
    UploadFile(filePath=file_path)