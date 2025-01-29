import json
import csv
import os
from typing import List, Dict

def process_json_files(directory: str) -> List[Dict]:
    all_courses = []
    course_id = 1  # Start counter for sequential IDs
    
    # Walk through all subdirectories
    for root, _, files in os.walk(directory):
        # Sort files to ensure consistent ordering
        files.sort()
        for file in files:
            if file.endswith('.json'):
                file_path = os.path.join(root, file)
                
                with open(file_path, 'r') as f:
                    try:
                        data = json.load(f)
                        # Extract courses from the classes array
                        for course in data.get('classes', []):
                            # Map the fields to match our schema
                            processed_course = {
                                'id': str(course_id),  # Convert to string but ensure sequential numbering
                                'quarter': course.get('quarter', ''),
                                'course_id': course.get('courseId', '').strip(),
                                'title': course.get('title', ''),
                                'description': course.get('description', ''),
                                'subject_area': course.get('subjectArea', '').strip(),
                                'units': course.get('unitsFixed', 0),
                                'general_ed': [ge.get('geCode', '').strip() for ge in course.get('generalEducation', [])],
                                'prerequisites': [],  # Not in the source data
                                'unlocks': []  # Not in the source data
                            }
                            all_courses.append(processed_course)
                            course_id += 1  # Increment ID counter
                    except json.JSONDecodeError:
                        print(f"Error reading {file_path}")
    
    return all_courses

def write_csv(courses: List[Dict], output_file: str):
    # Define headers based on prisma schema
    headers = [
        'id',
        'quarter',
        'course_id',
        'title',
        'description',
        'subject_area',
        'units',
        'general_ed',
        'prerequisites',
        'unlocks'
    ]
    
    with open(output_file, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=headers)
        writer.writeheader()
        
        # Sort courses by ID numerically before writing
        sorted_courses = sorted(courses, key=lambda x: int(x['id']))
        
        for course in sorted_courses:
            # Convert lists to JSON strings before writing
            course_row = course.copy()
            course_row['general_ed'] = json.dumps(course['general_ed'])
            course_row['prerequisites'] = json.dumps(course['prerequisites'])
            course_row['unlocks'] = json.dumps(course['unlocks'])
            writer.writerow(course_row)

def main():
    # Get the directory of this script
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # Process all JSON files
    courses = process_json_files(script_dir)
    
    # Write to CSV
    output_file = os.path.join(script_dir, 'courses.csv')
    write_csv(courses, output_file)
    
    print(f"Processed {len(courses)} courses")
    print(f"CSV file created at: {output_file}")

if __name__ == "__main__":
    main()
