import csv
import ast
import json

json = []

file = open("keywords.csv",encoding="utf8")
csvreader = csv.reader(file)
header = next(csvreader)

for row in csvreader:
    json.append(ast.literal_eval(row[1]))


f = open("temp1.csv",'w',encoding="utf8")
writer = csv.writer(f)
for x in json:
    for y in x:
        writer.writerow(y.values())


with open('temp1.csv',encoding="utf8") as input, open('keyword.csv', 'w', encoding="utf8",newline='') as output:
    writer = csv.writer(output)
    for row in csv.reader(input):
        if any(field.strip() for field in row):
            writer.writerow(row)