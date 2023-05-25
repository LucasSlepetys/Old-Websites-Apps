x = 0
y = 2
final = 0
for i in range(31):
    y = y**x
    final = final + y
    x = x + 1
    

print(final)

