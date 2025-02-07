import requests
from bs4 import BeautifulSoup
import csv

BASE_URL = "https://ucsbplat.com"
CSV_FILE = "prerequisites.csv"

def get_major_links():
    url = f"{BASE_URL}/curriculum"
    response = requests.get(url)
    soup = BeautifulSoup(response.text, "html.parser")

    quarters = ["FALL+2024", "SPRING+2024", "WINTER+2024", "SUMMER+2024"]
    major_links = []
    for major in soup.find_all("a", class_="stretched-link"):
        href = major.get("href")
        if href and "/curriculum/major/" in href:
            for quarter in quarters:
                full_url = BASE_URL + href + "?quarter=" + quarter
                major_links.append(full_url)
    
    return major_links

def get_course_links(major_url):
    response = requests.get(major_url)

    soup = BeautifulSoup(response.text, "html.parser")
    course_links = []

    for link in soup.find_all("a", class_="stretched-link"):
        href = link.get("href")
        if href and "/curriculum/class/" in href:
            full_url = BASE_URL + href
            course_links.append(full_url)
    
    return course_links

def get_course_links_from_file():
    with open("course_links.txt", "r", encoding="utf-8") as file:
        return [line.strip() for line in file]
    
def get_prereq_data(course_url):
    response = requests.get(course_url)
    soup = BeautifulSoup(response.text, "html.parser")

    breadcrumb_items = soup.find_all("li", class_="breadcrumb-item")
    course_title = breadcrumb_items[-1].text.strip() if len(breadcrumb_items) > 1 else "Unknown course"

    prereq_elem = soup.find("h6", class_="mb-0 text-info")

    if prereq_elem:
        prereq = prereq_elem.text.strip().replace("Prerequisites: ", "")
    else:
        prereq = "No data"
    
    unlocks_section = soup.find("h6", class_="me-2 text-secondary")
    if unlocks_section and "Unlocks" in unlocks_section.text:
        unlocks = [span.text.strip() for span in unlocks_section.find_all("span", class_="badge")]
    else:
        unlocks = []
    
    return {
        "gold_id": course_title,
        "prerequisites": prereq,
        "unlocks": ", ".join(unlocks) if unlocks else "None"
    }

if __name__ == "__main__":
    # majors = get_major_links()
    # all_courses = []

    # for major in majors:
    #     course_urls = get_course_links(major)
    #     all_courses.extend(course_urls)
    #     print(major + ": COMPLETED COURSES SCRAPE")

    # with open("course_links.txt", "w", encoding="utf-8") as file:
    #     for course in all_courses:
    #         file.write(course + "\n")

    # for course in all_courses[0:5]:
    #     print(course)

    course_urls = get_course_links_from_file()
    seen_courses = set()
    
    all_course_data = []
    for course_url in course_urls:
        course_data = get_prereq_data(course_url)
        if course_data:
            course_title = course_data["gold_id"]
            if course_title in seen_courses:
                continue
            print(f"Scraped course data: {course_title}")
            all_course_data.append(course_data)
            seen_courses.add(course_title)

    with open("prereq-data.csv", "w", encoding="utf-8", newline="") as csv_file:
        writer = csv.writer(csv_file)
        writer.writerow(["gold_id", "prerequisites", "unlocks"])
        for course in all_course_data:
            writer.writerow([course["gold_id"], course["prerequisites"], course["unlocks"]])
            print(f"Course saved to file: {course['gold_id']}")
