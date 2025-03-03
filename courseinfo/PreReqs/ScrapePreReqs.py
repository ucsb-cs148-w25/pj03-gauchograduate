from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select
from selenium.webdriver.common.by import By
import json
import time
import os
import psycopg2
from dotenv import load_dotenv
import os
import psycopg2
from psycopg2 import sql
import os
import argparse
load_dotenv(dotenv_path="./../gauchograduate/.env")

subject_mapping_20241 = {
    'SOC W': 'Sociology (Online) - SOC  ',
    'PHYS CS': 'Physics (Creative Studies) - PHYS ',
    'WRIT': 'Writing - WRIT ',
    'HEB': 'Hebrew - HEB  ',
    'CHIN': 'Chinese - CHIN ',
    'ENGR': 'Engineering Sciences - ENGR ',
    'SPAN': 'Spanish - SPAN ',
    'MUS': 'Music - MUS  ',
    'DANCE': 'Dance - DANCE',
    'PHYS': 'Physics - PHYS ',
    'ENGL': 'English - ENGL ',
    'ARTHI': 'Art History - ARTHI',
    'KOR': 'Korean - KOR  ',
    'GER': 'German - GER  ',
    'EEMB': 'Ecology, Evolution & Marine Biology - EEMB ',
    'MATRL': 'Material - MATRL',
    'CMPTGCS': 'Computing (Creative Studies) - CMPTG',
    'FAMST': 'Film and Media Studies - FAMST',
    'MAT': 'Media Arts and Technology - MAT  ',
    'C LIT': 'Comparative Literature - C LIT',
    'CH E': 'Chemical Engineering - CH E ',
    'ECON': 'Economics - ECON ',
    'MUS A': 'Music Performance Laboratories - MUS A',
    'ESS': 'Exercise & Sport Studies - ESS  ',
    'ED': 'Education - ED   ',
    'CNCSP': 'Counseling, Clinical, School Psychology - CNCSP',
    'ITAL': 'Italian - ITAL ',
    'HIST': 'History - HIST ',
    'MATH': 'Mathematics - MATH ',
    'ES 1-': 'Exercise Sport - ES   ',
    'W&L CS': 'Writing & Literature (Creative Studies) - W&L  ',
    'LING W': 'Linguistics (Online) - LING ',
    'RG ST': 'Religious Studies - RG ST',
    'MARINCS': 'Marine Science (Creative Studies) - MARIN',
    'ASTRO': 'Astronomy - ASTRO',
    'RENST': 'Renaissance Studies - RENST',
    'BL ST': 'Black Studies - BL ST',
    'CMPSC': 'Computer Science - CMPSC',
    'CMPSCW': 'Computer Science - CMPSC',
    'AS AM': 'Asian American Studies - AS AM',
    'INT': 'Interdisciplinary - INT  ',
    'BMSE': 'Biomolecular Science and Engineering - BMSE ',
    'MATH CS': 'Mathematics (Creative Studies) - MATH ',
    'SPAN W': 'Spanish (Online) - SPAN ',
    'SOC': 'Sociology - SOC  ',
    'COMM': 'Communication - COMM ',
    'ME ST': 'Medieval Studies - ME ST',
    'GLOBL': 'Global Studies - GLOBL',
    'LAIS': 'Latin American and Iberian Studies - LAIS ',
    'MUS CS': 'Music (Creative Studies) - MUS  ',
    'FEMST': 'Feminist Studies - FEMST',
    'MES': 'Middle East Studies - MES  ',
    'JAPAN': 'Japanese - JAPAN',
    'PSTAT': 'Statistics & Applied Probability - PSTAT',
    'LATIN': 'Latin - LATIN',
    'GEOG W': 'Geography (Online) - GEOG ',
    'CH ST': 'Chicano Studies - CH ST',
    'INT CS': 'Interdisciplinary (Creative Studies) - INT  ',
    'FR': 'French - FR   ',
    'ESS W': 'Exercise & Sport Studies (Online)       - ESS  ',
    'BIOE': 'Biological Engineering                   - BIOE ',
    'RUSS': 'Russian                                  - RUSS ',
    'GREEK': 'Greek                                    - GREEK',
    'BIOL CS': 'Biology (Creative Studies)               - BIOL ',
    'LING': 'Linguistics                              - LING ',
    'PORT': 'Portuguese                               - PORT ',
    'PSY': 'Psychology                               - PSY  ',
    'CLASS': 'Classics                                 - CLASS',
    'POL S': 'Political Science                        - POL S',
    'PHIL': 'Philosophy                               - PHIL ',
    'ECE': 'Electrical Computer Engineering          - ECE  ',
    'ME': 'Mechanical Engineering                   - ME   ',
    'GEOG': 'Geography                                - GEOG ',
    'CHEM CS': 'Chemistry (Creative Studies)             - CHEM ',
    'ANTH': 'Anthropology - ANTH ',
    'THTR': 'Theater                                  - THTR ',
    'ENV S': 'Environmental Studies                    - ENV S',
    'ART': 'Art                                      - ART  ',
    'SLAV': 'Slavic                                   - SLAV ',
    'EARTH': 'Earth Science                            - EARTH',
    'CHEM': 'Chemistry and Biochemistry               - CHEM ',
    'ART CS': 'Art (Creative Studies)                   - ART  ',
    'MS': 'Military Science                         - MS   ',
    'TMP': 'Technology Management                    - TMP  ',
    'EACS': 'East Asian Cultural Studies              - EACS ',
    'MCDB': 'Molecular, Cellular & Develop. Biology   - MCDB ',
}

for key, value in subject_mapping_20241.items():
    subject_mapping_20241[key] = " ".join(value.strip().split())


# Read gold_ids from PreReqsToScrape.txt
with open('./PreReqsToScrape.txt', 'r') as file:
    gold_ids = [line.strip() for line in file]

# Initialize the Chrome driver (ensure chromedriver is installed and in your PATH)
driver = webdriver.Chrome()

# URL for the course search page (which will redirect to the login page if not logged in)
url = 'https://my.sa.ucsb.edu/gold/ResultsFindCourses.aspx'
driver.get(url)

# Pause briefly to allow any JS events (like enabling the button) to occur.
time.sleep(3)


# Click the "Continue" button if present
try:
    continue_button = WebDriverWait(driver, 15).until(
        EC.element_to_be_clickable((By.ID, "pageContent_continueButton"))  # Adjust if necessary
    )
    continue_button.click()
    # print("Clicked Continue")
except:
    print("Continue button not found or not needed")

# Click on "Find Courses"
try:
    find_courses_link = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.LINK_TEXT, "FIND COURSES"))  # Adjust if necessary
    )
    find_courses_link.click()
    # print("Navigated to Find Courses")
except:
    print("Find Courses link not found")

# Click the "Switch to Advanced Search" button
try:
    adv_search_button = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.ID, "pageContent_AdvancedSearchButton"))
    )
    adv_search_button.click()
    # print("Clicked Switch to Advanced Search button")
except Exception as e:
    print("Failed to click Switch to Advanced Search button:", e)


for id in gold_ids : 
    courses_data = []
    last_space_index = id.rfind(' ')
    dept = id[:last_space_index]
    dept = subject_mapping_20241[dept]
    num = id[last_space_index + 1:]

    
    # Select "Winter 2024" from the quarter dropdown
    try:
        quarter_dropdown_element = WebDriverWait(driver, 3).until(
            EC.visibility_of_element_located((By.ID, 'pageContent_quarterDropDown'))
        )
        quarter_dropdown = Select(quarter_dropdown_element)
        quarter_dropdown.select_by_value("20241")
        # print("Selected Winter 2024 from quarter dropdown")
    except Exception as e:
        print("Failed to select Winter 2024 from quarter dropdown:", e)

    # Wait for the department dropdown to be visible and select the 'Chemistry and Biochemistry' option
    try:
        department_dropdown_element = WebDriverWait(driver, 3).until(
            EC.visibility_of_element_located((By.ID, 'pageContent_subjectAreaDropDown'))
        )
        department_dropdown = Select(department_dropdown_element)
        # Print all options for debugging
        options = [option.text for option in department_dropdown.options]
        # print("Department dropdown options:", options)
        # Select by visible text
        department_dropdown.select_by_visible_text(dept)
        # print(f"Selected {dept} from department dropdown")
    except Exception as e:
        print(f"Failed to select '{dept}' from department dropdown:", e)

    # Type "6AL" in the "Course #" box
    try:
        course_number_box = WebDriverWait(driver, 10).until(
            EC.visibility_of_element_located((By.ID, 'pageContent_courseNumberTextBox'))
        )
        course_number_box.send_keys(num)
        # print(f'Entered "{num}" in the Course # box')
    except Exception as e:
        print(f'Failed to enter "{num}" in the Course # box:', e)

    # Click the search button
    try:
        search_button = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.ID, "pageContent_searchButton"))
        )
        search_button.click()
        # print("Clicked Search button")
    except Exception as e:
        print("Failed to click Search button:", e)

    # Click the "Course Info" button
    try:
        course_info_button = WebDriverWait(driver, 3).until(
            EC.element_to_be_clickable((By.ID, "pageContent_CourseList_PrimarySections_0_CourseDetailLink_0"))
        )
        course_info_button.click()
        # print("Clicked Course Info button")
    except Exception as e:
        # print("Failed to click Course Info button:", e)
        print("Course not found for id:", id)
        try:
            new_search_button = WebDriverWait(driver, 10).until(
                EC.element_to_be_clickable((By.ID, "pageContent_newSearchBottomButton"))
            )
            new_search_button.click()
            # print("Clicked New Search button")
        except Exception as e:
            print("Failed to click New Search button:", e)
        continue

    # Click the "PreRequisites" button
    try:
        prereq_button = WebDriverWait(driver, 3).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, "a.list-group-item.text-center[data-container='prePageView']"))
        )
        prereq_button.click()
        # print("Clicked PreRequisites button")
    except Exception as e:
        print(f"Failed to click PreRequisites button for course {id} :", e)

    # Wait for the course page to load after login.
    try:
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, ".course-modal"))
        )
    except Exception as e:
        print("Course modals not found after login:", e)
        # Save page source for debugging
        with open(f"debug_page_{id}.html", "w", encoding="utf-8") as f:
            f.write(driver.page_source)
        driver.quit()
        exit()

    # Scrape the course modals.
    course_modals = driver.find_elements(By.CSS_SELECTOR, ".course-modal")
    # print(f"Found {len(course_modals)} course modals.")

    for modal in course_modals:
        try:
            prereq_tab = modal.find_element(By.CSS_SELECTOR, ".course-tab-content.active#prePageView")
            prereq = prereq_tab.get_attribute("outerHTML").strip()
        except Exception:
            prereq = None

    # Save the scraped prerequisites table to a .txt file
    with open(f'course_prerequisites.txt', 'a', encoding='utf-8') as f_out:
        f_out.write(f"id: {id}")
        f_out.write(f"\n{prereq}\n\n")
    time.sleep(1)

    # Click the "x" button to close the modal
    try:
        close_button = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, "a.close"))
        )
        close_button.click()
        # print("Clicked close button")
    except Exception as e:
        print("Failed to click close button:", e)

    # Click the "New Search" button
    try:
        new_search_button = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.ID, "pageContent_newSearchTopButton"))
        )
        new_search_button.click()
        # print("Clicked New Search button")
    except Exception as e:
        print("Failed to click New Search button:", e)


time.sleep(5)
driver.quit()
print("Scraping complete.")

