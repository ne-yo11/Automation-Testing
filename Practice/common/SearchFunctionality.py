from selenium.webdriver.common.by import By
from SeleniumLibrary import SeleniumLibrary
from robot.libraries.BuiltIn import BuiltIn

def get_filtered_course_codes(search_term):
    # Get the active WebDriver instance from SeleniumLibrary
    selenium_lib = BuiltIn().get_library_instance("SeleniumLibrary")
    driver = selenium_lib.driver

    matching_courses = []

    # Locate all course code elements in the column
    course_code_elements = driver.find_elements(By.XPATH, "//td[count(//th[normalize-space()='Course Code']/preceding-sibling::th) + 1]")

    # Extract and filter course codes
    for element in course_code_elements:
        course_code = element.text.strip()
        if search_term in course_code:
            matching_courses.append(course_code)

    return matching_courses

def student_code_from_popup(message):
    student_code = message.split("with code")[-1].strip()
    student_code = student_code.rstrip("?")
    return student_code
