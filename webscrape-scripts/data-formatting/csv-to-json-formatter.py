import json
from openai import OpenAI
from dotenv import load_dotenv
import os

load_dotenv()

openai_api_key = os.getenv("OPENAI_API_KEY")
client = OpenAI(api_key=openai_api_key)

MODEL = "gpt-4o-mini"
TEMPERATURE = 0

# Load OpenAI API key from .env
load_dotenv()
openai_api_key = os.getenv("OPENAI_API_KEY")
client = OpenAI(api_key=openai_api_key)

# File paths
file_path = "../course_prerequisites_full.txt"
json_file = "prereq-data-formatted.json"

# OpenAI model settings
MODEL = "gpt-4o-mini"
TEMPERATURE = .2

# Read the input file
with open(file_path, "r", encoding="utf-8") as f:
    lines = f.readlines()

courses_data = {}
current_course = None
current_html = []
parsing_html = False

# **Step through file line by line**
for line in lines:
    line = line.strip()  # Remove leading/trailing whitespace

    # Detect a new course
    if line.startswith("id:"):
        if current_course and current_html:
            courses_data[current_course] = "\n".join(current_html)  # Save last course

        # Extract course name
        current_course = line.replace("id:", "").strip()
        current_html = []  # Reset HTML content
        parsing_html = False  # HTML starts when we see <div>

    # Start capturing HTML content once <div> is found
    elif line.startswith("<div"):
        parsing_html = True

    # If we are parsing HTML, add to list
    if parsing_html:
        current_html.append(line)

# **Save the last parsed course**
if current_course and current_html:
    courses_data[current_course] = "\n".join(current_html)

for course_id, course_html in courses_data.items():
    prompt = f"""
You are an AI that parses university course prerequisite data from HTML and outputs a structured JSON representation of the requirements. 

**Output Requirements**:
1. Return only valid JSON. Do not include extra commentary or explanations.
2. JSON Structure:
   {{
     "course": "<course_id>",
     "prerequisites": <logical structure>
   }}
3. Logical Structure Conventions:
   - Use "type": "and" or "type": "or" plus a "requirements" array to represent groupings:
     {{
       "type": "and",
       "requirements": [ ... ]
     }}
     or
     {{
       "type": "or",
       "requirements": [ ... ]
     }}
   IMPORTANT:
   - You must find the outermost operation first. The outermost operations are found in this format:
   td><td style="text-align:left;vertical-align:bottom;">OR</td><td style="text-align:left;
   - We know that the outermost operation here is an OR operation but it could be a variety of operations such as AND, OR, or As well as. Then you you must find the inner operations and group them accordingly.
   - "As well as" is usually the outermost AND operation. "As well as" should be converted into a top-level AND block.
   - Use nested and/or blocks as necessary to capture the exact logical grouping.
   - In each block, the array "requirements" holds each sub-requirement (either a course or another nested and/or group).

4. Course Requirements:
   - Each course is represented as:
     {{
       "type": "course",
       "id": "<Department> <Number>",  // e.g., "CHEM 6AL"
       "minGrade": "<Min Grade>", // if stated (e.g. "C-")
       "canTakeConcurrently": <Boolean> // if "may be taken concurrently"
     }}
   - If concurrency is not explicitly stated, "canTakeConcurrently" should be false or omitted.
  
5. Course with no prerequisites:
   - The course may may have a statement such as "...does not have any PreRequisites" or something similar. In this case, Ignore any other information (such as recommended preparation) and represent the course as having no prerequisites. For example:
   {{
      "course": "ANTH 7",
      "prerequisites": null
   }}

Example formatting:
	<tbody><tr>
		<td style="text-align:right;vertical-align:top;color:#003366;font-weight:bold;padding-left:10px;width:100px;"></td><td style="text-align:right;vertical-align:bottom;"></td><td style="text-align:left;vertical-align:bottom;"></td><td style="text-align:left;vertical-align:bottom;">CHEM      6AL   with a minimum grade of C-</td>
	</tr><tr>
		<td style="text-align:right;vertical-align:top;color:#003366;font-weight:bold;padding-left:10px;width:100px;"></td><td style="text-align:right;vertical-align:bottom;"></td><td style="text-align:left;vertical-align:bottom;"></td><td style="text-align:left;vertical-align:bottom;">AND CHEM    109A    with a minimum grade of C-</td>
	</tr><tr>
		<td style="text-align:right;vertical-align:top;color:#003366;font-weight:bold;padding-left:10px;width:100px;"></td><td style="text-align:right;vertical-align:bottom;"></td><td style="text-align:left;vertical-align:bottom;">OR</td><td style="text-align:left;vertical-align:bottom;">CHEM      6AL   with a minimum grade of C-</td>
	</tr><tr>
		<td style="text-align:right;vertical-align:top;color:#003366;font-weight:bold;padding-left:10px;width:100px;"></td><td style="text-align:right;vertical-align:bottom;"></td><td style="text-align:left;vertical-align:bottom;"></td><td style="text-align:left;vertical-align:bottom;">AND CHEM    109AH   with a minimum grade of C-</td>
	</tr><tr>
		<td style="text-align:right;vertical-align:top;color:#003366;font-weight:bold;padding-left:10px;width:100px;"></td><td style="text-align:right;vertical-align:bottom;">As well as: </td><td style="text-align:left;vertical-align:bottom;"></td><td style="text-align:left;vertical-align:bottom;">CHEM    109B   </td>
	</tr><tr>
		<td style="text-align:right;vertical-align:top;color:#003366;font-weight:bold;padding-left:10px;width:100px;"></td><td style="text-align:right;vertical-align:bottom;"></td><td style="text-align:left;vertical-align:bottom;">OR</td><td style="text-align:left;vertical-align:bottom;">CHEM    109BH  </td>
	</tr>
    
  would be represented as:
        {{"course": "CHEM 6BL",
        "prerequisites": {{
            "type": "and",
            "requirements": [
                {{"type": "or",
                "requirements": [
                    {{"type": "and",
                    "requirements": [
                        {{"type": "course",
                        "id": "CHEM 6AL",
                        "minGrade": "C-",
                        "canTakeConcurrently": false
                        }},
                        {{"type": "course",
                        "id": "CHEM 109A",
                        "minGrade": "C-",
                        "canTakeConcurrently": false
                        }}
                    ]}},
                    {{"type": "and",
                    "requirements": [
                        {{"type": "course",
                        "id": "CHEM 6AL",
                        "minGrade": "C-",
                        "canTakeConcurrently": false
                        }},
                        {{"type": "course",
                        "id": "CHEM 109AH",
                        "minGrade": "C-",
                        "canTakeConcurrently": false
                        }}
                    ]}}
                ]}},
                {{"type": "or",
                "requirements": [
                    {{"type": "course",
                    "id": "CHEM 109B",
                    "minGrade": null,
                    "canTakeConcurrently": false
                    }},
                    {{"type": "course",
                    "id": "CHEM 109BH",
                    "minGrade": null,
                    "canTakeConcurrently": false
                    }}
                ]}}
            ]
        }}
      }}

  (here double brackets are used to prevent python string formatting from interfering)

5. Special Requirements:
   - If you encounter other requirements (e.g. "Upper-division standing", "3.0 GPA"), represent them as:
     {{
       "type": "specialRequirement",
       "requirement": "<text>"
     }}

6. Preserve the AND/OR relationships exactly as indicated by words like "AND", "OR", and "As well as" in the HTML.

7. Your final JSON must be valid and reflect the hierarchical logic of the prerequisites.

**Input HTML**:
this is the target course: {course_id}
this is the prerequisites in html: {course_html}
"""
    print(f"\n🔹 THE COURSE ID: {course_id}")
    response = client.chat.completions.create(
        model=MODEL,
        messages=[{"role": "system", "content": "You are a helpful assistant."},
                  {"role": "user", "content": prompt}],
        temperature=TEMPERATURE
    )

    structured_json = response.choices[0].message.content.strip()

    print(f"\n🔹 OpenAI Raw Response for {course_id}:\n{structured_json}\n")

    try:
        courses_data[course_id] = json.loads(structured_json)  # ✅ Convert from string to dictionary
    except json.JSONDecodeError as e:
        print(f"❌ JSON Decode Error for {course_id}: {e}")
        continue  # Skip if JSON is malformed

# **Save structured JSON output**
output_file = json_file
with open(output_file, "w", encoding="utf-8") as f:
    json.dump(courses_data, f, indent=4)