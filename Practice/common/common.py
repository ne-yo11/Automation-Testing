import requests
from bs4 import BeautifulSoup


def get_input_tag(url):
    response = requests.get(url)

    if response.status_code != 200:
        return f"Failed to load page {url}"
    
    soup = BeautifulSoup(response.text, "lxml")
    
    input_tags = soup.find_all("input")
    
    for index, tag in enumerate(input_tags, start=1):
        if tag.get("type") == "text" and tag.get("placeholder") == "Username":
            if tag.get("id"):
                Username_locator = f"id:{tag.get('id')}"
            elif tag.get("name"):
                Username_locator = f"name:{tag.get('name')}"
            elif tag.get("class"):
                Username_locator = f"class:{tag.get('class')[0]}"
            else:
                Username_locator = f"xpath:(//input)[{index}]"
        
        elif tag.get("type") == "password" and tag.get("placeholder") == "Password":
            if tag.get("id"):
                password_locator = f"id:{tag.get('id')}"
            elif tag.get("name"):
                password_locator = f"name:{tag.get('name')}"
            elif tag.get("class"):
                password_locator = f"class:{tag.get('class')[1]}"
            else:
                password_locator = f"xpath:(//input)[{index}]"
    
    return Username_locator, password_locator

def get_loginbtn_tag(url):
    response = requests.get(url)

    if response.status_code != 200:
        return f"Failed to load page {url}"
    soup = BeautifulSoup(response.text, "lxml")

    login_btn = soup.find("button")
    if login_btn:
        if login_btn.get("id"):
            Loginbtn_Locator = f"id:{login_btn.get('id')}"
        elif login_btn.get("name"):
            Loginbtn_Locator = f"name:{login_btn.get('name')}"
        elif login_btn.get("class"):
            Loginbtn_Locator = f"class:{login_btn.get('class')[0]}"
        else:
            Loginbtn_Locator = f"xpath:(//button)[1]"
    return Loginbtn_Locator




#with open("test.html", "r") as html_file:
  #  content = html_file.read()

  #  soup = BeautifulSoup(content, "lxml")
   # print(soup.prettify())

   # tags = soup.find_all("h1")
  #  print(tags)
    
