#1
for i in range(20,121,5):
    print(i)



##2
# i = 201
# while i > 25 :
#     if i % 8 == 0 :
#         print(i)
#     i = i - 1




##3
# i = 1499
# while i < 2000 :
#     if i % 5 == 0 and i % 7 == 0 :
#         print(i)
#     i = i + 1



##4
# i = 1499
# sum = 0
# while i < 2000 :
#     if i % 5 == 0 and i % 7 == 0 :
#         sum = sum + i
#     i = i + 1

# print(sum)




##5
# i = 1499
# sum = 0
# while i < 2000 :
#     if i % 5 == 0 and i % 7 == 0 :
#         sum = sum + i  
#         if sum > 20000 :
#             break
#     i = i + 1

# print(sum)



##6
# i = 1499
# count = 0
# while i < 2000 :
#     if i % 5 == 0 :
#         count += 1
#     i = i + 1
# print(count)



##7
# sum = 0
# for i in range(1,11) :
#     sum += i

# print(sum/10)




##8
# sum = 0
# for i in range(0,101) :
#     if i % 2 == 0 :
#         sum += i
# print(sum)




##9
# for i in range(15,151) :
#     if i == 50 or i == 75 or i == 80 :
#         continue
#     elif i % 5 == 0 :
#         print(i)



##10
# mp = 1
# input = int(input('Enter any number: '))

# for i in range(1,input+1) :
#     mp = mp * i
# print(f'{input}! = {mp}')




#12
# input_1 = int(input('Enter any number: '))
# input_2 = int(input('Enter any number: '))

# first_numbers_separator = []
# second_numbers_separator= []

# for i in range(1,input_1 + 1) :
#     if input_1 % i == 0 :
#      first_numbers_separator.append(i)

# for x in range(1,input_2 + 1) :
#     if input_2 % x == 0 :
#      second_numbers_separator.append(x)

# common_separators = set(first_numbers_separator) & set(second_numbers_separator)
# common_separators_list = list(common_separators)

# print(common_separators_list)




##13
# input_1 = int(input('Enter any number: '))
# input_2 = int(input('Enter any number: '))

# first_numbers_separator = []
# second_numbers_separator= []

# for i in range(1,input_1 + 1) :
#     if input_1 % i == 0 :
#      first_numbers_separator.append(i)

# for x in range(1,input_2 + 1) :
#     if input_2 % x == 0 :
#      second_numbers_separator.append(x)

# common_separators = set(first_numbers_separator) & set(second_numbers_separator)
# common_separators_list = list(common_separators)
# max_separator = max(common_separators_list)
# print(max_separator)


 
##14
# input_1 = int(input('Enter any number: '))
# input_2 = int(input('Enter any number: '))

# first_numbers_separator = []
# second_numbers_separator= []

# for i in range(1,input_1 + 1) :
#     if input_1 % i == 0 :
#      first_numbers_separator.append(i)

# for x in range(1,input_2 + 1) :
#     if input_2 % x == 0 :
#      second_numbers_separator.append(x)

# common_separators = set(first_numbers_separator) & set(second_numbers_separator)
# common_separators_list = list(common_separators)
# max_separator = max(common_separators_list)

# lowest_common_multiple = int((input_1*input_2)/max_separator)

# print(lowest_common_multiple)


# common_separators = set(first_numbers_separator) & set(second_numbers_separator)
# common_separators_list = list(common_separators)


## OR

# num_1 = 4
# num_2 = 6

# new_num = max(num_1,num_2)

# while True :
#     if new_num % num_1 == 0 and new_num % num_2 == 0 :
#         break
#     else:
#         new_num += 1
    
# print(new_num)


##15

























##16
# num_1 = int(input('Enter any number: '))

# sumber_of_separators = []

# for i in range(1,num_1+1):
#     if num_1 % i == 0 :
#      sumber_of_separators.append(i)

# if len(sumber_of_separators) == 2 :
#  print(f'{num_1} is a simple number')
# else :
#  print(f'{num_1} is not a simple number')



##17
# for num in range(1,1001):
#    if num > 1:
#        for i in range(2,num):
#            if (num % i) == 0:
#                break
#        else:
#            print(f"{num} is a prime number!")





##18
# x = 0
# y = 1

# while y < 100:
#     print(y)
#     x,y = y,x+y



##19
# number = int(input('Enter number: '))
# count = 0

# while number != 0   :
#     number //= 10
#     count += 1

# print(f'Number of digits {str(count)}')



##20
# number = int(input('Enter number: '))
# sum = 0

# while number != 0   :
#     digit = number % 10
#     sum += digit
#     number //= 10

# print(f'Sum of digits {str(sum)}')



##21
# number = int(input('Enter number: '))
# sum = []

# while number != 0   :
#     digit = number % 10
#     sum.append(digit) 
#     number //= 10

# print(f'Sum of digits {str(sum[-1])}')



##22
# number = int(input('Enter number: '))
# list_of_digits = []

# while number != 0  :
#     digit = number % 10
#     list_of_digits.append(digit) 
#     number //= 10

# list_1 = int(''.join(map(str, list_of_digits)))
# print(f'Reverse number {list_1}')




##23
# number = int(input('Enter number: '))
# list_of_digits = []

# while number != 0  :
#     digit = number % 10
#     list_of_digits.append(digit) 
#     number //= 10

# list_1 = int(''.join(map(str, list_of_digits)))
# list_2 = int(''.join(map(str, reversed(list_of_digits))))

# if list_1 == list_2 :
#     print(f'Reverse number {list_1}')
#     print(f'Your number {list_2}')
#     print('Yes its a Palindrome')
# else :
#     print(f'Reverse number {list_1}')
#     print(f'Your number {list_2}')
#     print('No its not a Palindrome')




    





























