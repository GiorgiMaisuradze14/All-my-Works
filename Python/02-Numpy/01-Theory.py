import numpy as np

# w3schools.com

# arr = np.array([1,2,3,4,5])

# print(arr)
# print(type(arr))

# arr = np.array((1,2,3,4,5))

# print(arr)
# print(type(arr))

#                                               --------------------------------------------------------

# 0-Directions
# arr = np.array(42)
# print(arr)

# 1-D
# arr = np.array([1, 2, 3, 4, 5])
# print(arr)

# 2-D
# arr = np.array([[1, 2, 3], [4, 5, 6]])
# print(arr)

# 3-D
# arr = np.array([[[1, 2, 3], [4, 5, 6]], [[1, 2, 3], [4, 5, 6]]])
# print(arr)

#                                               --------------------------------------------------------

#Check how many dimensions the arrays have (განზომილება) --> ndim

# a = np.array(42)
# b = np.array([1, 2, 3, 4, 5])
# c = np.array([[1, 2, 3], [4, 5, 6]])
# d = np.array([[[1, 2, 3], [4, 5, 6]], [[1, 2, 3], [4, 5, 6]]])

# print(a.ndim)
# print(b.ndim)
# print(c.ndim)
# print(d.ndim)


# Create an array with 5 dimensions and verify that it has 5 dimensions --> ndmin

# arr = np.array([1,2,3,4],ndmin=5)

# print(arr)
# print('number of dimensions :' , arr.ndim)


#                                               --------------------------------------------------------


#მეორე ელემენტი --> 2
# arr = np.array([1, 2, 3, 4])
# print(arr[1])

#მეორე სტრიქონის ელემენტი ანუ მეოთხე ელემენტი --> 9
# arr = np.array([[1,2,3,4,5], [6,7,8,9,10]])
# print(arr[1,3])

#პირველი მარტიცის მეორე სტრიქონის მესამე ელემენტი --> 6
# arr = np.array([[[1, 2, 3], [4, 5, 6]], [[7, 8, 9], [10, 11, 12]]])
# print(arr[0, 1, 2])

#მეორე სტრიქონის ბოლოდან პირველი ელემენტი -> 10
# arr = np.array([[1,2,3,4,5], [6,7,8,9,10]])
# print(arr[1, -1])



#                                               --------------------------------------------------------

# Create an array with data type
# arr = np.array([1, 2, 3, 4], dtype='S')

# print(arr)
# print(arr.dtype)



# Create an array with data type 4 bytes integer
# arr = np.array([1, 2, 3, 4], dtype='i4')

# print(arr)
# print(arr.dtype)



#Change data type from float to integer by using 'i' as parameter value --> astype()

# arr = np.array([1.1, 2.1, 3.1])
# newarr = arr.astype('i')

# print(newarr)
# print(newarr.dtype)


#                                               --------------------------------------------------------


#The Difference Between Copy and View
#The main difference between a copy and a view of an array is that the copy is a new array, and the view is just a view of the original array.
#The copy owns the data and any changes made to the copy will not affect original array, and any changes made to the original array will not affect the copy.
#The view does not own the data and any changes made to the view will affect the original array, and any changes made to the original array will affect the view


#Make a copy, change the original array, and display both arrays
# arr = np.array([1, 2, 3, 4, 5])
# x = arr.copy()
# arr[0] = 42

# print(arr)
# print(x)


#Make a view, change the original array, and display both arrays
# arr = np.array([1, 2, 3, 4, 5])
# x = arr.view()
# arr[0] = 42

# print(arr)
# print(x)    


#Every NumPy array has the attribute base that returns None if the array owns the data , The view returns the original array.
#Print the value of the base attribute to check if an array owns it's data or not

# arr = np.array([1, 2, 3, 4, 5])

# x = arr.copy()
# y = arr.view()

# print(x.base)
# print(y.base)



#                                               --------------------------------------------------------


#NumPy arrays have an attribute called shape that returns a tuple with each index having the number of corresponding elements --> shape
#Print the shape of a 2-D array

# arr = np.array([[1, 2, 3, 4], [5, 6, 7, 8]])
# print(arr.shape)

#Create an array with 5 dimensions using ndmin using a vector with values 1,2,3,4 and verify that last dimension has value 4

# arr = np.array([1,2,3,4],ndmin=5)

# print(arr)
# print(arr.shape)


#Reshaping means changing the shape of an array. --> reshape()
#The shape of an array is the number of elements in each dimension.
#By reshaping we can add or remove dimensions or change number of elements in each dimension


#Convert the following 1-D array with 12 elements into a 2-D array.
#The outermost dimension will have 4 arrays, each with 3 elements

# arr = np.array([1,2,3,4,5,6,7,8,9,10,11,12])
# newarr = arr.reshape(3,4)

# print(newarr)


#The outermost dimension will have 2 arrays that contains 3 arrays, each with 2 elements
# arr = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
# newarr = arr.reshape(2, 3, 2) #  2x3 ზე ორი მატრიცა

# print(newarr)


#Flattening array means converting a multidimensional array into a 1D array.
#We can use reshape(-1) to do this.

# arr = np.array([[11, 2, 3], [14, 5, 6]])
# newarr = arr.reshape(-1)

# print(newarr)




#                                               --------------------------------------------------------


#Iterating means going through elements one by one.
#As we deal with multi-dimensional arrays in numpy, we can do this using basic for loop of python


#Iterate on the elements of the following 1-D array
# arr = np.array([1, 2, 3])

# for x in arr:
#   print(x)



#Iterate on the elements of the following 2-D array
# arr = np.array([[1, 2, 3], [4, 5, 6]])

# for x in arr:
#   print(x)



#Iterate on each scalar element of the 2-D array
# arr = np.array([[1, 2, 3], [4, 5, 6]])

# for x in arr:
#     for y in x:
#         print(y)


#Iterate on the elements of the following 3-D array
# arr = np.array([[[1, 2, 3], [4, 5, 6]], [[7, 8, 9], [10, 11, 12]]])

# for x in arr:
#   for y in x:
#     for z in y:
#       print(z)



#The function nditer() is a helping function that can be used from very basic to very advanced iterations.  --> nditer()
#It solves some basic issues which we face in iteration, lets go through it with examples


#Iterate through the following 3-D array
# arr = np.array([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])

# for x in np.nditer(arr):
#   print(x)


#We can use op_dtypes argument and pass it the expected datatype to change the datatype of elements while iterating. --> op_dtypes=[]
#NumPy does not change the data type of the element in-place (where the element is in array) so it needs some other 
#space to perform this action, that extra space is called buffer, and in order to enable it in nditer() we pass -->  flags=['buffered'].

# arr = np.array([1,2,3])

# for x in np.nditer(arr , flags=['buffered'] , op_dtypes=['S']): 
#     print(x)



#Enumeration means mentioning sequence number of somethings one by one. --> ndenumerate()
#Sometimes we require corresponding index of the element while iterating, the ndenumerate() method can be used for those usecases

# arr = np.array([1, 2, 3])

# for idx, x in np.ndenumerate(arr):
#   print(idx, x)


#                                               --------------------------------------------------------

#Joining means putting contents of two or more arrays in a single array.  --> concatenate()
#In SQL we join tables based on a key, whereas in NumPy we join arrays by axes.
#We pass a sequence of arrays that we want to join to the concatenate() function, along with the axis. 
#If axis is not explicitly passed, it is taken as 0.



# arr1 = np.array([1, 2, 3])
# arr2 = np.array([4, 5, 6])

# arr = np.concatenate((arr1, arr2))
# print(arr)



# arr1 = np.array([[1, 2], [3, 4]])
# arr2 = np.array([[5, 6], [7, 8]])

# arr = np.concatenate((arr1, arr2), axis=1)
# print(arr)



#Stacking is same as concatenation, the only difference is that stacking is done along a new axis. --> stack()
#We can concatenate two 1-D arrays along the second axis which would result in putting them one over the other, ie. stacking.
#We pass a sequence of arrays that we want to join to the stack() method along with the axis. If axis is not explicitly passed it is taken as 0.

# arr1 = np.array([1, 2, 3])
# arr2 = np.array([4, 5, 6])

# arr = np.stack((arr1, arr2), axis=1)
# print(arr)


#NumPy provides a helper function: hstack() to stack along rows.--> hstack()
# arr1 = np.array([1, 2, 3])
# arr2 = np.array([4, 5, 6])

# arr = np.hstack((arr1, arr2))
# print(arr)


#NumPy provides a helper function: vstack()  to stack along columns --> vstack()
# arr1 = np.array([1, 2, 3])
# arr2 = np.array([4, 5, 6])

# arr = np.vstack((arr1, arr2))
# print(arr)


#NumPy provides a helper function: dstack() to stack along height, which is the same as depth --> dstack()

# arr1 = np.array([1, 2, 3])
# arr2 = np.array([4, 5, 6])

# arr = np.dstack((arr1, arr2))
# print(arr)


#                                               --------------------------------------------------------

#Splitting is reverse operation of Joining.
#Joining merges multiple arrays into one and Splitting breaks one array into multiple.
#We use array_split() for splitting arrays, we pass it the array we want to split and the number of splits.


# arr = np.array([1, 2, 3, 4, 5, 6])
# newarr = np.array_split(arr, 3)

# print(newarr)


# arr = np.array([1, 2, 3, 4, 5, 6])
# newarr = np.array_split(arr, 3)

# print(newarr[0])
# print(newarr[1])
# print(newarr[2])


# arr = np.array([[1, 2], [3, 4], [5, 6], [7, 8], [9, 10], [11, 12]])
# newarr = np.array_split(arr, 3)

# print(newarr)


# arr = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10, 11, 12], [13, 14, 15], [16, 17, 18]])
# newarr = np.array_split(arr, 3, axis=1)

# print(newarr)


#                                               --------------------------------------------------------

#You can search an array for a certain value, and return the indexes that get a match. --> where()
#To search an array, use the where() method.

# arr = np.array([1, 2, 3, 4, 5, 4, 4])
# x = np.where(arr == 4)

# print(x) # ინდექსების array ის აბრუნებს სადაც დახვდა 4


# arr = np.array([1, 2, 3, 4, 5, 6, 7, 8])
# x = np.where(arr%2 == 0)

# print(x)


#There is a method called searchsorted() which performs a binary search in the array,  --> searchsorted()
#and returns the index where the specified value would be inserted to maintain the search order.

# arr = np.array([6, 8 , 3 , 7 ])
# x = np.searchsorted(arr, 5)  #პირველი რომელზეც იქნება მეტი იმ რიცხვის ინდექსი , მარცხნიდან იწყებს იტერაციას
                                                       
# print(x)



#                                               --------------------------------------------------------


#Sorting means putting elements in an ordered sequence. --> sort()
#Ordered sequence is any sequence that has an order corresponding to elements, like numeric or alphabetical, 
#ascending or descending.
#The NumPy ndarray object has a function called sort(), that will sort a specified array.


# arr = np.array([3, 2, 0, 1])
# print(np.sort(arr))


# arr = np.array([[3, 2, 4], [5, 0, 1]])
# print(np.sort(arr))




#                                               --------------------------------------------------------

#Getting some elements out of an existing array and creating a new array out of them is called filtering.
#In NumPy, you filter an array using a boolean index list

#If the value at an index is True that element is contained in the filtered array, 
#if the value at that index is False that element is excluded from the filtered array


# arr = np.array([41, 42, 43, 44])
# x = [True, False, True, False]

# newarr = arr[x]
# print(newarr)


#Create a filter array that will return only values higher than 42

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


#                                               --------------------------------------------------------


# Course


#The np.arange() method in NumPy is used to create a new NumPy array containing a range of values
#start: The start value of the sequence (inclusive)
#stop: The end value of the sequence (exclusive)
#step: The difference between the elements in the sequence (default is 1)

# arr = np.arange(0,101,2)
# print(arr)


#The np.zeros() and np.ones() methods in NumPy are used to create new arrays filled with 0's and 1's respectively.

# arr = np.zeros((2,3))
# print(arr)


# arr = np.ones((2,2), dtype='I')
# print(arr)


#The np.linspace() method in NumPy returns evenly spaced numbers over a specified interval. 
#It is commonly used to create linearly spaced arrays
#start - The starting value of the sequence
#stop - The end value of the sequence
#num - Number of samples to generate. Default is 50.
#endpoint - If True, stop is the last sample. Otherwise, it is not included.
#retstep - If True, return (samples, step)

# arr = np.linspace(2,10,4, dtype='i')
# print(arr)



#ერთეულოვანი მატრიცა
# arr = np.eye(5)
# print(arr)


#                                               --------------------------------------------------------


#The randint() method takes a size parameter where you can specify the shape of an array.
# arr = np.random.randint(100, size=(5))
# arr_1 = np.random.randint(100, size=(3,5))

# print(arr)
# print(arr_1)


#The rand() method also allows you to specify the shape of the array.
# arr = np.random.rand(5)
# arr_1 = np.random.rand(3,5)

# print(arr)
# print(arr_1)



#The choice() method allows you to generate a random value based on an array of values.
#The choice() method takes an array as a parameter and randomly returns one of the values.

# arr = np.random.choice([3, 5, 7, 9])
# arr_1 = np.random.choice([3, 5, 7, 9], size=(3, 5))

# print(arr)
# print(arr_1)



#                                               --------------------------------------------------------


#min/max elements
# arr = np.array([12,4,6,46,3])
# print(arr.min())


# arr = np.array([12,4,6,46,3])
# print(arr.max())




# index of min/max elements
# arr = np.array([12,4,6,46,3])
# print(arr.argmin())


# arr = np.array([12,4,6,46,3])
# print(arr.argmax())



















