##1
# def my_func_avg (a,b):
#     return (a+b)/2

# avg_num_1 = my_func_avg(3,7)
# avg_num_2 = my_func_avg(4,9)
# avg_num_3 = my_func_avg(24,86)

# print(avg_num_1,avg_num_2,avg_num_3)


##2
# def my_func_avg (a,b):
#     avg_num = (a+b)/2
#     print(f'Avg = {avg_num}')

# my_func_avg(3,6)
# my_func_avg(2,14)
# my_func_avg(123,543)


##3
# def cube_of_number(a):
#     return a**3

# cube = cube_of_number(3)
# print(cube)


##4
# def find_min(a,b):
#     if a > b:
#         return b
#     else :
#         return a
    
# min_num = find_min(21,4)

# print(min_num)



##5
# def is_odd(a):
#     if a%2==0:
#         return False
#     else :
#         return True

# odd = is_odd(6)
# print(odd)


##6
# def factorial_any_number(input): 
#     mp = 1

#     for i in range(1,input+1) :
#         mp = mp * i
#     print(f'{input}! = {mp}')

# factorial_any_number(5)


##7
# def print_text():
#     print_hello_world = 'Hello,World'
#     print(print_hello_world)

# print_text()


##9
# cube = lambda x: x**3
# result = cube(2)
# print(result)  



##10
# def my_func(num_1):
#     sumber_of_separators = []

#     for i in range(1,num_1+1):
#         if num_1 % i == 0 :
#          sumber_of_separators.append(i)

#     if len(sumber_of_separators) == 2 :
#      print(f'{num_1} is a prime number')
#     else :
#      print(f'{num_1} is not a prime number')


# my_func(8)