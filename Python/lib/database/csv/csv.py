import csv

reader = csv.reader(file)
writer = csv.writer(file)
writer.writerow(data)   # write one line
writer.writerows(data)   # write multi line

# Dictionary
reader = csv.DictReader(file)
writer = csv.DictWriter(file)
writer.writeheader()    # file header
writer.writerow(data)   # write one line
writer.writerows(data)   # write multi line
