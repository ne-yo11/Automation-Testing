def loginvalidation(username, password):
    if username == "admin" and password == "admin":
        return "Valid user name and password"
    elif username == "admin" and password != "admin":
        return "Valid user name but invalid password"
    elif username != "admin" and password == "admin":
        return  "Invalid user name but valid password"
    else:
        return "Invalid user name and password"
