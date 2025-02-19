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


def get_all_gold_ids():
    name = os.getenv('POSTGRES_URL_NON_POOLING_NAME')
    password = os.getenv('POSTGRES_URL_NON_POOLING_PASSWORD')
    host = os.getenv('POSTGRES_URL_NON_POOLING_HOST')
    port = os.getenv('POSTGRES_URL_NON_POOLING_PORT')

    try:
        connection = psycopg2.connect(dbname=name, user=name, password=password, host=host, port=port)
        cursor = connection.cursor()
        
        cursor.execute("SELECT gold_id FROM Course")
        gold_ids = [row[0] for row in cursor.fetchall()]
        
        cursor.close()
        connection.close()
        
        return gold_ids
    except psycopg2.OperationalError as e:
        print(f"OperationalError: {e}")
        print(f"Host: {host}, Port: {port}, User: {name}")
        print("Please check your network connection and ensure the database server is accessible.")
        return []
    except Exception as e:
        print(f"Error connecting to the database: {e}")
        return []

# Read gold_ids from PreReqsToScrape.txt
with open('./PreReqsToScrape.txt', 'r') as file:
    gold_ids = [line.strip() for line in file]

# Initialize the Chrome driver (ensure chromedriver is installed and in your PATH)
driver = webdriver.Chrome()

# URL for the course search page (which will redirect to the login page if not logged in)
url = 'https://my.sa.ucsb.edu/gold/ResultsFindCourses.aspx'
driver.get(url)

# Wait for the login page to load and locate the username and password fields.
try:
    username_field = WebDriverWait(driver, 20).until(
        EC.presence_of_element_located((By.ID, "username"))
    )
    password_field = WebDriverWait(driver, 20).until(
        EC.presence_of_element_located((By.ID, "password"))
    )
except Exception as e:
    print("Could not locate login fields:", e)
    driver.quit()
    exit()

# Replace these with your actual UCSB login credentials.
username = "..."
password = "..."

# Enter credentials into the fields.
username_field.send_keys(username)
password_field.send_keys(password)

# Pause briefly to allow any JS events (like enabling the button) to occur.
time.sleep(1)

# Locate the login (submit) button.
try:
    login_button = driver.find_element(By.CSS_SELECTOR, "input.btn.btn-block.btn-submit")
    # Remove the disabled attribute if present.
    driver.execute_script("arguments[0].removeAttribute('disabled');", login_button)
    login_button.click()
except Exception as e:
    print("Login button not found or click failed, trying ENTER key:", e)
    password_field.send_keys(Keys.RETURN)



# Click the "Continue" button if present
try:
    continue_button = WebDriverWait(driver, 5).until(
        EC.element_to_be_clickable((By.ID, "pageContent_continueButton"))  # Adjust if necessary
    )
    continue_button.click()
    print("Clicked Continue")
except:
    print("Continue button not found or not needed")

# Click on "Find Courses"
try:
    find_courses_link = WebDriverWait(driver, 5).until(
        EC.element_to_be_clickable((By.LINK_TEXT, "FIND COURSES"))  # Adjust if necessary
    )
    find_courses_link.click()
    print("Navigated to Find Courses")
except:
    print("Find Courses link not found")

# Click the "Switch to Advanced Search" button
try:
    adv_search_button = WebDriverWait(driver, 10).until(
        EC.element_to_be_clickable((By.ID, "pageContent_AdvancedSearchButton"))
    )
    adv_search_button.click()
    print("Clicked Switch to Advanced Search button")
except Exception as e:
    print("Failed to click Switch to Advanced Search button:", e)


courses_data = []
for id in gold_ids : 
    last_space_index = id.rfind(' ')
    dept = id[:last_space_index]
    if len(dept) < 5:
        dept += " " * (5 - len(dept))
    num = id[last_space_index + 1:]

    # Wait for the department dropdown to be visible and select the 'Chemistry and Biochemistry' option
    try:
        department_dropdown_element = WebDriverWait(driver, 10).until(
            EC.visibility_of_element_located((By.ID, 'pageContent_departmentDropDown'))
        )
        department_dropdown = Select(department_dropdown_element)
        # Print all options for debugging
        options = [option.text for option in department_dropdown.options]
        print("Department dropdown options:", options)
        # Select by value instead of visible text
        department_dropdown.select_by_value(dept)
        print(f"Selected {dept} from department dropdown")
    except Exception as e:
        print(f"Failed to select '{dept}' from department dropdown:", e)

    # Type "6AL" in the "Course #" box
    try:
        course_number_box = WebDriverWait(driver, 10).until(
            EC.visibility_of_element_located((By.ID, 'pageContent_courseNumberTextBox'))
        )
        course_number_box.send_keys(num)
        print(f'Entered "{num}" in the Course # box')
    except Exception as e:
        print(f'Failed to enter "{num}" in the Course # box:', e)

    # Click the search button
    try:
        search_button = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.ID, "pageContent_searchButton"))
        )
        search_button.click()
        print("Clicked Search button")
    except Exception as e:
        print("Failed to click Search button:", e)

    # Click the "Course Info" button
    try:
        course_info_button = WebDriverWait(driver, 3).until(
            EC.element_to_be_clickable((By.ID, "pageContent_CourseList_PrimarySections_0_CourseDetailLink_0"))
        )
        course_info_button.click()
        print("Clicked Course Info button")
    except Exception as e:
        print("Failed to click Course Info button:", e)

    # Click the "PreRequisites" button
    try:
        prereq_button = WebDriverWait(driver, 3).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, "a.list-group-item.text-center[data-container='prePageView']"))
        )
        prereq_button.click()
        print("Clicked PreRequisites button")
    except Exception as e:
        print("Failed to click PreRequisites button:", e)

    # Wait for the course page to load after login.
    try:
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, ".course-modal"))
        )
    except Exception as e:
        print("Course modals not found after login:", e)
        driver.quit()
        exit()


    # Scrape the course modals.
    course_modals = driver.find_elements(By.CSS_SELECTOR, ".course-modal")
    print(f"Found {len(course_modals)} course modals.")

    for modal in course_modals:
        course_info = {}
        try:
            title_elem = modal.find_element(By.CSS_SELECTOR, ".courseTitle")
            course_info['course_title'] = title_elem.text.strip()
        except Exception:
            course_info['course_title'] = None
        try:
            prereq_tab = modal.find_element(By.ID, "prePageView")
            course_info['prerequisites_html'] = prereq_tab.get_attribute("innerHTML").strip()
        except Exception:
            course_info['prerequisites_html'] = None
        courses_data.append(course_info)

    # Click the "x" button to close the modal
    try:
        close_button = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.CSS_SELECTOR, "a.close"))
        )
        close_button.click()
        print("Clicked close button")
    except Exception as e:
        print("Failed to click close button:", e)

    # Click the "New Search" button
    try:
        new_search_button = WebDriverWait(driver, 10).until(
            EC.element_to_be_clickable((By.ID, "pageContent_newSearchTopButton"))
        )
        new_search_button.click()
        print("Clicked New Search button")
    except Exception as e:
        print("Failed to click New Search button:", e)

    # Save the scraped data to a JSON file.
    with open('courses_prerequisites.json', 'a', encoding='utf-8') as f:
        json.dump(courses_data, f, indent=2, ensure_ascii=False)


time.sleep(5)
driver.quit()
print("Scraping complete. Data saved to courses_prerequisites.json")

