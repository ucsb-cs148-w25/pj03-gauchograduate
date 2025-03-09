import json
import psycopg2
from psycopg2 import sql
import os

from dotenv import load_dotenv
load_dotenv(dotenv_path="./../gauchograduate/.env")


# Database connection
conn = psycopg2.connect(
    dbname=os.getenv('POSTGRES_URL_NON_POOLING_NAME'),
    user=os.getenv('POSTGRES_URL_NON_POOLING_NAME'),
    password=os.getenv('POSTGRES_URL_NON_POOLING_PASSWORD'),
    host=os.getenv('POSTGRES_URL_NON_POOLING_HOST'),
    port=os.getenv('POSTGRES_URL_NON_POOLING_PORT')
)
cursor = conn.cursor()

# Load JSON
with open("data-formatting/prereq-data-formatted.json", "r") as file:
    courses = json.load(file)

# Step 1: Map GOLD_IDs to internal IDs
gold_to_internal = {}
cursor.execute("SELECT id, gold_id FROM \"Course\";")
for internal_id, gold_id in cursor.fetchall():
    gold_to_internal[gold_id] = internal_id

# Step 2: Update IDs in JSON
updated_courses = {}

for gold_id, data in courses.items():
    if gold_id not in gold_to_internal:
        continue  # Skip if not found in DB

    internal_id = gold_to_internal[gold_id]
    prerequisites = data.get("prerequisites", {})

    # Recursively replace "id" fields in prerequisites
    def update_prereq(prereq):
        if isinstance(prereq, dict):
            if prereq.get("type") == "course" and "id" in prereq:
                prereq["id"] = gold_to_internal.get(prereq["id"], prereq["id"])
            elif "requirements" in prereq:
                prereq["requirements"] = [update_prereq(req) for req in prereq["requirements"]]
        return prereq

    data["prerequisites"] = update_prereq(prerequisites)
    updated_courses[internal_id] = data  # Use internal_id as key

# Step 3: Dry run - show what will change
print("Dry Run - Changes to be made:")
for internal_id, data in updated_courses.items():
    print(f"Course ID: {internal_id}, New Prerequisites: {json.dumps(data['prerequisites'], indent=2)}")

# Step 4: Ask for confirmation before committing
confirm = input("Proceed with database update? (yes/no): ").strip().lower()
if confirm == "yes":
    for internal_id, data in updated_courses.items():
        cursor.execute(
            sql.SQL("UPDATE \"Course\" SET prerequisites = %s WHERE id = %s;"),
            [json.dumps(data["prerequisites"]), internal_id]
        )
    conn.commit()
    print("Database updated successfully.")
else:
    print("No changes were made.")


# Commit changes
conn.commit()
cursor.close()
conn.close()