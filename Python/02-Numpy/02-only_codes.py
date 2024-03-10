import numpy as np

#1
# arr = np.array([1,2,3,4,5])
# print(arr)

#2
# arr = np.array([[[1, 2, 3], [4, 5, 6]], [[1, 2, 3], [4, 5, 6]]])
# print(arr.ndim)
# print(arr)
# print(arr[0, 1, 2])

#3
# arr = np.array([1.1, 2.1, 3.1])
# newarr = arr.astype('i')

#4
# arr = np.array([1, 2, 3, 4, 5])
# x = arr.copy()
# arr[0] = 42

# print(arr)
# print(x)


# arr = np.array([1, 2, 3, 4, 5])
# x = arr.view()
# arr[0] = 42

# print(arr)
# print(x) 

#5
# arr = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])
# print(arr.shape)

#6
# arr = np.array([1,2,3,4,5,6,7,8,9,10,11,12])
# newarr = arr.reshape(3,4)

# print(newarr)

#7
# arr = np.array([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])

# for x in np.nditer(arr):
#   print(x)

# arr = np.array([1,2,3])

# for x in np.nditer(arr , flags=['buffered'] , op_dtypes=['S']): 
#     print(x)

#8
# arr = np.array([1, 2, 3])

# for idx, x in np.ndenumerate(arr):
#   print(idx, x)

#9
# arr1 = np.array([1, 2, 3])
# arr2 = np.array([4, 5, 6])

# arr = np.concatenate((arr1, arr2))
# print(arr)


# arr1 = np.array([[1, 2], [3, 4]])
# arr2 = np.array([[5, 6], [7, 8]])

# arr = np.concatenate((arr1, arr2), axis=1)
# print(arr)

#10

# arr1 = np.array([1, 2, 3])
# arr2 = np.array([4, 5, 6])

# arr = np.stack((arr1, arr2), axis=1)
# print(arr)


# arr1 = np.array([1, 2, 3])
# arr2 = np.array([4, 5, 6])

# arr = np.hstack((arr1, arr2))
# print(arr)


# arr1 = np.array([1, 2, 3])
# arr2 = np.array([4, 5, 6])

# arr = np.vstack((arr1, arr2))
# print(arr)


# arr1 = np.array([1, 2, 3])
# arr2 = np.array([4, 5, 6])

# arr = np.dstack((arr1, arr2))
# print(arr)

#11
# arr = np.array([1, 2, 3, 4, 5, 6])
# newarr = np.array_split(arr, 3)

# print(newarr)

#12
# arr = np.array([1, 2, 3, 4, 5, 6, 7, 8, 10])
# x = np.where(arr%2 == 0)

# print(x)

#13
# arr = np.array([6, 8 , 3 , 7 ])
# x = np.searchsorted(arr, 5)

# print(x)

#14
# arr = np.array([41, 42, 43, 44])
# filter_arr = []


# for element in arr:
#   if element > 42:
#     filter_arr.append(True)
#   else:
#     filter_arr.append(False)


# newarr = arr[filter_arr]

# print(filter_arr)
# print(newarr)

#15
# arr = np.arange(0,101,2)
# print(arr)

#16
# arr = np.zeros((2,3))
# print(arr)

# arr = np.ones((2,2), dtype='I')
# print(arr)

#17
# arr = np.linspace(2,10,4, dtype='i')
# print(arr)

#18
# arr = np.eye(5)
# print(arr)

#19
# arr = np.random.randint(10, size=(5))
# arr_1 = np.random.randint(100, size=(3,5))

# print(arr)
# print(arr_1)

#20
# arr = np.random.choice([3, 5, 7, 9])
# arr_1 = np.random.choice([3, 5, 7, 9], size=(3, 5))

# print(arr)
# print(arr_1)

#21
#min/max elements
# arr = np.array([12,4,6,46,3])
# print(arr.min())

# arr = np.array([12,4,6,46,3])
# print(arr.max())

#22
# arr = np.array([12,4,6,46,3])
# print(arr.argmin())


# arr = np.array([12,4,6,46,3])
# print(arr.argmax())















#19















