from flask import Flask, jsonify, request
import json
import os

app = Flask(__name__)
my_data = "bookdata.json"


def read_data():
    with open(my_data) as book:
        return json.load(book)

def write_data(data):
    with open(my_data, "w") as book:
        json.dump(data, book, indent=4)


@app.route('/books', methods=['GET'])
def get_all_books():
    data = read_data()
    return jsonify(data)



@app.route('/books/<int:book_id>', methods=['GET'])
def get_book(book_id):
    data = read_data()
    book = next((b for b in data if b["id"] == book_id), None)    
    if book:
        return jsonify(book)
    else: "Not Found", 404


@app.route('/books', methods=['POST'])
def create_book():
    data = read_data()
    new_entry = request.json

    if any(i['id'] == new_entry['id'] for i in data):
        return {"error": "Book with this ID already exists."}, 400

    data.append(new_entry)
    write_data(data)
    return jsonify(new_entry), 201



@app.route('/books/<int:book_id>', methods=['DELETE'])
def delete_book(book_id):
    data = read_data()
    new_data = [b for b in data if b["id"] != book_id]
    
    if len(new_data) == len(data):
        return ("Not Found", 404)

    write_data(new_data)
    return ("", 204)


if __name__ == '__main__':
    app.run(debug=True)