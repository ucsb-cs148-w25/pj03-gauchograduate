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

def UploadFile():
    # with open(filePath, 'r') as f:
    with open("commands.sql", "w") as commandsFile:
        table_name = '"Course"'

        # classes = each row
        # indiv_class is dict_keys(['quarter', 'courseId', 'title', 'contactHours', 'description', 'college', 'objLevelCode', 'subjectArea', 'unitsFixed', 'unitsVariableHigh', 'unitsVariableLow', 'delayedSectioning', 'inProgressCourse', 'gradingOption', 'instructionType', 'instructionTypeSecondary', 'onLineCourse', 'deptCode', 'generalEducation', 'classSections'])
        prereq = """{
"and": [
    {"class" : [{"goldId": "CHEM_1A",
      "Required_Grade" : "Na",
      "Taken_Concurrently" : "False"
    }]},
    {"and" : [{"class": [{"goldId": "U",
      "Required_Grade" : "Na",
      "Taken_Concurrently" : "False"
    }, {"goldId": "CHEM_1B",
      "Required_Grade" : "Na",
      "Taken_Concurrently" : "True"
    }]}]},
    {"or" : [{"class": [{"goldId": "CMPCS_16",
      "Required_Grade" : "C-",
      "Taken_Concurrently" : "True"
    }, {"goldId": "CMPCS_9",
      "Required_Grade" : "Na",
      "Taken_Concurrently" : "False"
    }]}]},
    {"and" : [{"class": [{"goldId": "MATH_4A",
      "Required_Grade" : "B+",
      "Taken_Concurrently" : "False"
    }, {"goldId": "MATH_6A",
      "Required_Grade" : "B",
      "Taken_Concurrently" : "True"
    }]}]}
   ]
}
"""

        # course_values = "INSERT INTO " + table_name + "\nVALUES ( '"+goldId +"', '"+ title +"', '"+ description +"', '"+subjectArea +"', "+ units +", "+ json.dumps(genEd) +", '"+prereq +"', '"+ unlock+ "');\n"
        # course_values = "( '"+goldId +"', '"+ title +"', '"+ description +"', '"+subjectArea +"', "+ units +", '"+ genEd +"'::json, '"+prereq +"', '"+ unlock+ "')\n"
        commandsFile.write(
f"""
UPDATE "Course"
SET prerequisites = '{prereq}';
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
    print(f"Updated Course")

if __name__ == "__main__":
    # parser = argparse.ArgumentParser(
    #     description="Script that uploads data to the database."
    # )
    # parser.add_argument("file_path", type=str, help="Enter a file path (ie. 20241-undergrad/page1.json)")
    # parser.add_argument("--d", type=str, help="if true this will delete everything")
    # args = parser.parse_args()

    # file_path = args.file_path
    UploadFile()