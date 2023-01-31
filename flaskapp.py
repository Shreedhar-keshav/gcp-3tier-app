from flask import Flask, render_template, request
from sqlalchemy import create_engine,text
app = Flask(__name__)
db_url = 'mysql+pymysql://sridhar:sridhar@10.19.192.11:3306/FlaskDemo'
@app.route('/',methods=['GET','POST'])
def home():
    status = ''
    if request.method == 'POST':
        name = request.form['name']
        phone = request.form['phone_number']
        print(name,phone)
        db_engine = create_engine(db_url)
        with db_engine.connect() as con:
            con.execute(text('INSERT INTO Contacts VALUES (:name,:phone_number);'),[{'name':name,'phone_number':phone}])
            status = 'SAVED!!'
    return render_template('contactform.html',result={'status':status})

if __name__== '__main__':
    app.run('0.0.0.0',5000)

############

# CREATE DATABASE FlaskDemo

# USE DATABASE FlaskDemo

# CREATE TABLE Contacts(name varchar(200),phone_number varchar(15))

# SELECT * FROM Contacts
# ######

# sudo apt-get update
# sudo apt-get install python3-pip

# pip install sqlalchamy

# pip install pymysql




