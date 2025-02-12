import json
import os
import psycopg2
from psycopg2 import sql
from dotenv import load_dotenv
import glob

# Load environment variables from the .env file in the gauchograduate directory
load_dotenv(dotenv_path="../gauchograduate/.env")

def get_db_connection():
    name = os.getenv('POSTGRES_URL_NON_POOLING_NAME')
    password = os.getenv('POSTGRES_URL_NON_POOLING_PASSWORD')
    host = os.getenv('POSTGRES_URL_NON_POOLING_HOST')
    port = os.getenv('POSTGRES_URL_NON_POOLING_PORT')

    return psycopg2.connect(
        dbname=name,
        user=name,
        password=password,
        host=host,
        port=port
    )

def get_course_id_mapping(cursor):
    """Get a mapping of gold_ids to primary key ids"""
    cursor.execute('SELECT gold_id, id FROM "Course"')
    # Create two mappings - one with underscores and one without
    mapping = {}
    for row in cursor.fetchall():
        gold_id, pk_id = row
        # Add both versions to the mapping
        mapping[gold_id] = str(pk_id)  # Original format
        mapping[gold_id.replace(" ", "_")] = str(pk_id)  # With underscore
    return mapping

def convert_course_ids(obj, id_mapping):
    """Recursively convert gold_ids to primary key ids in the JSON structure"""
    if isinstance(obj, dict):
        new_dict = {}
        for key, value in obj.items():
            new_dict[key] = convert_course_ids(value, id_mapping)
        return new_dict
    elif isinstance(obj, list):
        return [convert_course_ids(item, id_mapping) for item in obj]
    elif isinstance(obj, str) and obj in id_mapping:
        return id_mapping[obj]
    return obj

def main():
    # Connect to database
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # Get mapping of gold_ids to primary key ids
        id_mapping = get_course_id_mapping(cursor)

        # Process all json files in the current directory
        for json_file in glob.glob("*.json"):
            # Skip files that already end with _idFormat.json
            if json_file.endswith("_idFormat.json"):
                continue

            with open(json_file, 'r') as f:
                data = json.load(f)

            # Convert the IDs
            converted_data = convert_course_ids(data, id_mapping)

            # Write to new file with _idFormat suffix
            output_file = json_file.replace(".json", "_idFormat.json")
            with open(output_file, 'w') as f:
                json.dump(converted_data, f, indent=2)
            
            print(f"Converted {json_file} to {output_file}")

    finally:
        cursor.close()
        conn.close()

if __name__ == "__main__":
    main()
