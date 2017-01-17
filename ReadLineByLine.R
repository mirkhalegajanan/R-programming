path = "c:/Users/Innova/Downloads/2015.csv"
print(path)

conn <- file(path,open="r")
lines <- readLines(conn)
for (i in 1:length(lines)){
  print(lines[i])
}
close(conn)



