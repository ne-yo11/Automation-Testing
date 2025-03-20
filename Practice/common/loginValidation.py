def loginvalidation(username, password):
    if username == "admin" and password == "admin":
        return "Valid user name and password"
    elif username == "admin" and password != "admin":
        return "Valid user name but invalid password"
    elif username != "admin" and password == "admin":
        return  "Invalid user name but valid password"
    else:
        return "Invalid user name and password"





















"""VALID_USERNAME = "admin"
VALID_PASSWORD = "admin"
INVALID_USERNAME = "qwerty"
INVALID_PASSWORD = "123456"

test_data = [
    (INVALID_USERNAME,VALID_PASSWORD),
    (INVALID_USERNAME,INVALID_PASSWORD),
    (VALID_USERNAME,INVALID_PASSWORD),
    (VALID_USERNAME,VALID_PASSWORD)
]

def loginInputusername():
    for username,password in test_data:
        print(username)
    return 
def loginInputpassword():
    for username,password in test_data:
        print(password)
    return 

loginInputusername()
loginInputpassword()"""


    