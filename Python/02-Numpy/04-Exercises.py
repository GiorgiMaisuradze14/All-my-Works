import numpy as np


#1 Generate a random 3x3 matrix and calculate its determinant.

# arr = np.random.randint(20,size=(3,3))
# det = np.linalg.det(arr) 

# print(arr)
# print(int(det))


#2 Create an array of zeros with shape (4, 5) and replace the second row with all ones.

# arr = np.zeros((4,5))
# arr[1,:] = 1

# print(arr)


#3 Find the mean and standard deviation of a given array.

# arr = np.arange(0,20,2)

# mean = np.mean(arr)
# std_dev = np.std(arr)

# print(arr)
# print(mean)
# print(std_dev)


#4 Multiply two matrices of different shapes.

# arr_1 = np.random.randint(10,size=(3,4))
# arr_2 = np.random.randint(10,size=(4,2))

# arr_result = np.dot(arr_1, arr_2)

# print(arr_1)
# print(arr_2)
# print(arr_result)


#5 Create a numpy array with values from 1 to 10, and filter out odd numbers.

# arr = np.arange(0,11)
# filter_arr = arr[arr%2==0]

# print(arr)
# print(filter_arr)


#6 Reshape a 1D array into a 2D array with 3 rows and 4 columns.

# arr = np.arange(1,13)
# arr_1 = arr.reshape(3,4)

# print(arr_1)


#7 Extract all even numbers from a given array and store them in a new array.

# given_array = np.array([3, 7, 2, 8, 5])
# even_numbers = given_array[given_array % 2 == 0]

# print(even_numbers)


#8 Calculate the dot product of two arrays.

# arr_1 = np.array([3, 7, 2])
# arr_2 = np.array([4, 1, 6])

# result = np.dot(arr_1,arr_2)
# print(result)


#9 Generate a 5x5 matrix with random integer values and find the maximum value.

# arr = np.random.randint(1,100,size=(5,5))
# max_value = np.max(arr)

# print(arr)
# print(max_value)


#10 Create a numpy array with numbers spaced at intervals of 0.5 between 1 and 5.

# arr = np.arange(1, 5.1, 0.5)
# print(arr)


#11 Normalize the values in a given array to have a mean of 0 and standard deviation of 1.

# given_array = np.array([1,4,-36,23,-34])
# normalized_array = (given_array - np.mean(given_array)) / np.std(given_array)

# print(given_array)
# print(normalized_array)


#12 Find the index of the maximum value in a 2D array along each axis.

# arr = np.array([[-4,6,9],[2,31,4]])

# index_max_row = np.argmax(arr, axis=0)
# index_max_col = np.argmax(arr, axis=1)
# print("\nIndex of Maximum Value along Rows:", index_max_row, "\nIndex of Maximum Value along Columns:", index_max_col)


#13 Perform element-wise addition on two arrays, broadcasting if necessary.

# array_a = np.array([[1, 2, 3], [4, 5, 6]])
# array_b = np.array([10, 20, 30])

# result = array_a + array_b
# print(result)



#15 Replace all negative values in an array with their absolute values.

# arr = np.array([1,4,-4,6,-34])
# abs_arr = np.abs(arr)

# print(arr)
# print(abs_arr)


#16 Concatenate two arrays along both rows and columns.






#17 Find the unique elements and their counts in a given array.






#18 Create a diagonal matrix from a 1D array of values.






#19 Calculate the eigenvalues and eigenvectors of a square matrix.






#20 Create a 3x3 identity matrix and swap its first and last rows.