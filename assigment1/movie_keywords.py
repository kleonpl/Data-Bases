import csv
import ast
import json

excel = []
movie_id =[]
json = []
id = []

file = open("keywords.csv",encoding="utf8")
csvreader = csv.reader(file)
header = next(csvreader)

for row in csvreader: 
    excel.append(row)
    movie_id.append(row[0])
    json.append(ast.literal_eval(row[1]))

for x in range(len(movie_id)):
    for i in range(len(json[x])):
        id.append(list(json[x][i].values())[0])

movie_id = list(map(lambda el:[el], movie_id))
id = list(map(lambda el:[el], id))   

f = open("temp.csv",'w',encoding="utf8")
writer = csv.writer(f)
for x in range(len(movie_id)):
    for i in range(len(json[x])):
        writer.writerow(movie_id[x]+id[i])

with open('temp.csv',encoding="utf8") as input, open('movie_keywords.csv', 'w', encoding="utf8",newline='') as output:
    writer = csv.writer(output)
    for row in csv.reader(input):
        if any(field.strip() for field in row):
            writer.writerow(row)