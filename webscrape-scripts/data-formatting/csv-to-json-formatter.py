import csv
import json
from openai import OpenAI
import time
from dotenv import load_dotenv
import os
import re

load_dotenv()

openai_api_key = os.getenv("OPENAI_API_KEY")
client = OpenAI(api_key=openai_api_key)

csv_file = "../unlocks-removed.csv"
json_file = "prereq-data-formatted.json"

MODEL = "gpt-4o-mini"
TEMPERATURE = 0

def read_csv(file_path):
    prerequisites = []
    with open(file_path, newline='', encoding="utf-8") as csvfile:
        reader = csv.reader(csvfile)
        for row in reader:
            if len(row) < 2:
                continue
            course, prereq = row
            prerequisites.append((course.strip(), prereq.strip()))
    return prerequisites

def get_structured_prerequisite(course, prereq_text):
    prompt = f"""
You are an expert at parsing textual course prerequisites into a structured JSON format. 
Here are strict rules on how to interpret commas, semicolons, 'and', and 'or':

1. **Semicolons** (;) almost always separate major **AND** clauses.  
   - Example: "X, Y; Z" → means "(X, Y) AND (Z)".  

2. **'and'** at the same "level" is also an **AND** separator.  
   - E.g. "X and Y" → {{ "type": "and", "requirements": [X, Y] }}.

3. **'or'** indicates an **OR** group.  
   - E.g. "X or Y or Z" → {{ "type": "or", "requirements": [X, Y, Z] }}.

4. **Parenthesize 'X and Y or Z'** as (X) AND ((Y) OR (Z)) (i.e., do not interpret it as ((X AND Y) OR Z)).

5. **Commas** can mean EITHER "and" or "or" depending on the context:
   - If the text says "X or Y," treat the comma as a continuation of the **OR** group.
   - If the text says "X, Y, Z, and W" (without an explicit "or" before Y or Z), treat those as **AND** elements unless there's an explicit "or".
   - If ambiguous, prefer grouping with "or" if 'or' is mentioned close by. 
     *Example:* "X or Y, Z" might mean OR if it’s "X or Y or Z," but if it’s "X, Y, Z, or W," then everything except "W" might be an **AND** group.

6. **A single requirement that contains multiple "or" groups plus "and"** → break it down **one piece at a time**:
   - Identify each top-level **AND** section (split by "and" or semicolon).
   - Within each section, if you see multiple "or" items, nest them in an **OR** node.

### **Additional JSON Rules**  
- Return only **valid JSON** with no extra text or explanations.
- If there are **no prerequisites** (e.g., "None"), return:
  {{
    "course": "{course}",
    "prerequisites": {{"type": "and", "requirements": []}}
  }}
- A **specific course** is:
  {{
    "type": "course",
    "dept": "<DEPT>",
    "number": "<NUMBER>",
    "minGrade": "<GRADE OR NULL>",
    "canTakeConcurrently": <TRUE/FALSE>
  }}
- If prerequisites mention **special requirements** (like "Upper-division standing", "3.0 GPA"), use:
  {{
    "type": "specialRequirement",
    "requirement": "<REQUIREMENT>"
  }}

---

### **Your Task**  
Convert the prerequisite below into structured JSON, following the rules above as closely as possible.

#### **Input**  
Course: {course}  
Prerequisite: {prereq_text}

#### **Output**  
Return only a valid JSON object named "prerequisites" inside a top-level:
json
{{
  "course": "{course}",
  "prerequisites": <YOUR AST JSON HERE>
}}

"""
    try:
        response = client.chat.completions.create(
            model=MODEL,
            messages=[{"role": "system", "content": "You are a helpful assistant."},
                      {"role": "user", "content": prompt}],
            temperature=TEMPERATURE
        )

        structured_json = response.choices[0].message.content.strip()

        # ✅ Debugging: Print raw response
        print(f"\n🔹 OpenAI Raw Response for {course}:\n{structured_json}\n")

        # ✅ If response contains Markdown formatting, remove it
        structured_json = re.sub(r"```json\s*|\s*```", "", structured_json).strip()

        # ✅ Check if response is empty before parsing
        if not structured_json:
            raise ValueError(f"Received empty response from OpenAI for {course}.")

        # ✅ Now parse JSON
        return json.loads(structured_json)

    except json.JSONDecodeError as e:
        print(f"⚠️ JSON Parsing Error for {course}: {e}")
        return None
    except Exception as e:
        print(f"⚠️ Error processing {course}: {str(e)}")
        return None

def process_and_save(csv_file, json_output_file):
    prerequisites = read_csv(csv_file)
    parsed_data = []

    for course, prereqs in prerequisites[7:10]:
        structured_prereq = get_structured_prerequisite(course, prereqs)
        if structured_prereq:
            parsed_data.append(structured_prereq)
        time.sleep(2)  # Avoid API rate limits

    with open(json_output_file, "w", encoding="utf-8") as f:
        json.dump(parsed_data, f, indent=2)

if __name__ == "__main__":
    process_and_save(csv_file, json_file)