import json
def getAll ():
    with open("bookdata.json") as book:
        data = json.load(book)
        print(data)

getAll()

def getId(req):
    with open("bookdata.json") as book:
        data = json.load(book)
        
        for i in data:
            if i['id']==req :
                print(i)
                break

getId(2)


def deleteBook(req):
    with open ("bookdata.json") as book:
        data = json.load(book)

        for i in data:
            if i["id"]==req:
                new_data = [i for i in data if i["id"] != req]
    with open ("bookdata.json", "w") as book:
        json.dump(new_data, book)

deleteBook(2)


def createBook():
    with open("bookdata.json", 'a') as book:
        data = json.load(book)
        new_entry = {
        "id":8,
        "title":"Rethinking Productivity in Software Engineering",
        "subtitle":"",
        "author":"Caitlin Sadowski, Thomas Zimmermann",
        "published":"2019-05-11T00:00:00.000Z",
        "publisher":"Apress",
        "pages":310,
        "description":"Get the most out of this foundational reference and improve the productivity of your software teams. This open access book collects the wisdom of the 2017 \"Dagstuhl\" seminar on productivity in software engineering, a meeting of community leaders, who came together with the goal of rethinking traditional definitions and measures of productivity.",
        "website":"https://doi.org/10.1007/978-1-4842-4221-6"
    }

    for i in data:
        if i['id']==new_entry['id']:
            print("Error")
            return
    data.append(new_entry)
    with open("bookdata.json", 'w') as newbook:
          json.dump(data,newbook, indent = 4)



