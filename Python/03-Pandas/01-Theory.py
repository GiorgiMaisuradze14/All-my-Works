import pandas as pd
import numpy as np
import random


#                                               --------------------------------------------------------


#w3school

#What is a Series?
#A Pandas Series is like a column in a table.
#It is a one-dimensional array holding data of any type.       --> Series()

# a = [1, 7, 2]
# myvar = pd.Series(a)

# print(myvar)
# print(myvar[0])


#With the index argument, you can name your own labels

# a = [1, 7, 2]
# myvar = pd.Series(a, index = ["x", "y", "z"])

# print(myvar)


#Course --> Series(data,index)

# labels = ['a','b','c']
# my_data = [10,20,30]
# arr = np.array(my_data)
# d = {'a':10,'b':20,'c':30}

# myvar = pd.Series(my_data)
# myvar_1 = pd.Series(my_data,labels)
# myvar_2 = pd.Series(d)

# print(myvar_2)



# ser_1 = pd.Series([1,2,3,4],('USA','Germany','Japan','Spain'))
# ser_2 = pd.Series([1,2,5,4],('USA','Germany','Italy','Spain'))

# print(ser_1+ser_2)


#                                               --------------------------------------------------------


#What is a DataFrame? --> DataFrame()
#A Pandas DataFrame is a 2 dimensional data structure, like a 2 dimensional array, or a table with rows and columns.

# data = {
#     "calories" : [450,320,125] ,
#     "duration" : [50,40,45]
# }

# df = pd.DataFrame(data)
# print(df)


#As you can see from the result above, the DataFrame is like a table with rows and columns.  --> loc()
#Pandas use the loc attribute to return one or more specified row(s)

# data = {
#     "calories" : [450,320,125] ,
#     "duration" : [50,40,45]
# }

# df = pd.DataFrame(data)

# print(df.loc[0])




# np.random.seed(101)
# df = pd.DataFrame(np.random.randn(5,4),['A','B','C','D','E'],['W','X','Y','Z'])

# ქოლუმების დაბეჭდვა თუ გვინდა
# print(df['W']) 
# print(df[['W','Z']]) 


# როუების დაბეჭდვა თუ გვინდა 
# print(df.loc['C'])
# print(df.iloc[2])

# ერთი ან რამდენიმე ელემენტის ბეჭდვა
# print(df.loc['B','Y'])
# print(df.loc[['A' , 'C'],['W','Y']])


# df['New'] = df['W'] + df['Y']
# print(df)

# df.drop('New',axis=1,inplace=True)
# print(df)   



#
# np.random.seed(101)
# df = pd.DataFrame(np.random.randn(5,4),['A','B','C','D','E'],['W','X','Y','Z'])
# booldf = df > 0

# print(df[booldf])
# print(df[df['W'] > 0])
# print(df[(df['W'] > 0) & (df['Y'] > 1)])  #and
# print(df[(df['W'] > 0) | (df['Y'] > 1)])  #or


# print(df.reset_index())
# newind = 'CA NY WY OR CO '.split()
# df['states'] = newind
# print(df)

# print(df.set_index('states')) #states გავხადე ახალი ინდექსი


#

# Index Levels
# outside = ['G1','G1','G1','G2','G2','G2']
# inside = [1,2,3,1,2,3]
# hier_index = list(zip(outside,inside))
# hier_index = pd.MultiIndex.from_tuples(hier_index)

# df = pd.DataFrame(np.random.randn(6,2),hier_index,['A','B'])
# print(df)

# print(df.loc['G1'].loc[1])



#                                               --------------------------------------------------------

#Pandas Read CSVS
#A simple way to store big data sets is to use CSV files (comma separated files).
#CSV files contains plain text and is a well know format that can be read by everyone including Pandas.
#In our examples we will be using a CSV file called 'data.csv'


#Load the CSV into a DataFrame
#use to_string() to print the entire DataFrame

# df = pd.read_csv('data.csv')
# print(df.to_string())


#Print the DataFrame without the to_string() method
#If you have a large DataFrame with many rows, Pandas will only return the first 5 rows, and the last 5 rows

# df = pd.read_csv('data.csv')
# print(df)


#The number of rows returned is defined in Pandas option settings.
#You can check your system's maximum rows with the pd.options.display.max_rows statement

# print(pd.options.display.max_rows)


#In my system the number is 60, which means that if the DataFrame contains more than 60 rows, 
#the print(df) statement will return only the headers and the first and last 5 rows.
#You can change the maximum rows number with the same statement


# pd.options.display.max_rows = 9999
# df = pd.read_csv('data.csv')

# print(df)


#                                               --------------------------------------------------------

#Big data sets are often stored, or extracted as JSON.
#JSON is plain text, but has the format of an object, and is well known in the world of programming, including Pandas.
#In our examples we will be using a JSON file called 'data.json'.


#Load the JSON file into a DataFrame
# df = pd.read_json('data.json')
# print(df.to_string())



#If your JSON code is not in a file, but in a Python Dictionary, you can load it into a DataFrame directly

# data = {
#   "Duration":{
#     "0":60,
#     "1":60,
#     "2":60,
#     "3":45,
#     "4":45,
#     "5":60
#   },
#   "Pulse":{
#     "0":110,
#     "1":117,
#     "2":103,
#     "3":109,
#     "4":117,
#     "5":102
#   },
#   "Maxpulse":{
#     "0":130,
#     "1":145,
#     "2":135,
#     "3":175,
#     "4":148,
#     "5":127
#   },
#   "Calories":{
#     "0":409,
#     "1":479,
#     "2":340,
#     "3":282,
#     "4":406,
#     "5":300
#   }
# }

# df = pd.DataFrame(data)
# print(df) 




#Viewing the Data --> head()
#One of the most used method for getting a quick overview of the DataFrame, is the head() method.
#The head() method returns the headers and a specified number of rows, starting from the top

#Get a quick overview by printing the first 10 rows of the DataFrame

# df = pd.read_csv('data.csv')
# print(df.head(10))

#The tail() method returns the headers and a specified number of rows, starting from the bottom

# df = pd.read_csv('data.csv')
# print(df.tail())


#                                               --------------------------------------------------------
#                                               --------------------------------------------------------
#                                               --------------------------------------------------------

#Data Cleaning
#Data cleaning means fixing bad data in your data set.

#Bad data could be:
#1.Empty cells
#2.Data in wrong format
#3.Wrong data
#4.Duplicates
#5.In this tutorial you will learn how to deal with all of them




#Empty Cells --> dropna()
#Empty cells can potentially give you a wrong result when you analyze data.
#remove Rows
#One way to deal with empty cells is to remove rows that contain empty cells.
#This is usually OK, since data sets can be very big, and removing a few rows will not have a big impact on the result


#Return a new Data Frame with no empty cells
# df = pd.read_csv('data_1.csv')
# new_df = df.dropna()

# print(new_df.to_string())

#By default, the dropna() method returns a new DataFrame, and will not change the original
#If you want to change the original DataFrame, use the inplace = True argument

#Remove all rows with NULL values
# df = pd.read_csv('data_1.csv')
# df.dropna(inplace = True)

# print(df.to_string())




#Replace Empty Values --> fillna()
#Another way of dealing with empty cells is to insert a new value instead.
#This way you do not have to delete entire rows just because of some empty cells.
#The fillna() method allows us to replace empty cells with a value

#Replace NULL values with the number 130
# df = pd.read_csv('data_1.csv')
# df.fillna(130,inplace=True)

# print(df.to_string())


#Replace Only For Specified Columns
#The example above replaces all empty cells in the whole Data Frame.
#To only replace empty values for one column, specify the column name for the DataFrame

#Replace NULL values in the "Calories" columns with the number 130

# df = pd.read_csv('data_1.csv')
# df['Calories'].fillna(999,inplace=True)

# print(df.to_string())


#მოკლედ ცარიელი ადგილებისთვის მოსაშორებლად გვაქვს ფუნქციები : dropna() და fillna()


#                                               --------------------------------------------------------

#Data of Wrong Format
#Cells with data of wrong format can make it difficult, or even impossible, to analyze data.
#To fix it, you have two options: remove the rows, or convert all cells in the columns into the same format

#Let's try to convert all cells in the 'Date' column into dates. --> to_datetime()
#Pandas has a to_datetime() method for this:

#Convert to date
# df = pd.read_csv('data_1.csv')
# df['Date'] = pd.to_datetime(df['Date'])

# print(df.to_string())

# აქ რატომღაც არ გამოვიდა , მაგრამ ზოგადად თარიღის ფორმატში გადაგვყავს ფუნქციით : to_datetime()


#                                               --------------------------------------------------------


#To discover duplicates, we can use the duplicated() method.
#The duplicated() method returns a Boolean values for each row


#Returns True for every row that is a duplicate, otherwise False
# df = pd.read_csv('data_1.csv')
# print(df.duplicated())


# ფუნქცია duplicated() აბრუნებს true თუ ერთნაირი row ები ნახა , წინააღმდეგ შემთხვევაში false



#                                               --------------------------------------------------------


#Group By

# data = {'Company':['GOOG','GOOG','MSFT','MSFT','FB','FB'],
#        'Person':['Sam','Charlie','Amy','Vanessa','Carl','Sarah'],
#        'Sales':[200,120,340,124,243,350]}


# df = pd.DataFrame(data)
# byComp = df.groupby('Company')

# print(byComp.mean())

# ....


#                                               --------------------------------------------------------


# Merging Joining and Concatenating

# df1 = pd.DataFrame({'A': ['A0', 'A1', 'A2', 'A3'],
#                         'B': ['B0', 'B1', 'B2', 'B3'],
#                         'C': ['C0', 'C1', 'C2', 'C3'],
#                         'D': ['D0', 'D1', 'D2', 'D3']},
#                         index=[0, 1, 2, 3])

# df2 = pd.DataFrame({'A': ['A4', 'A5', 'A6', 'A7'],
#                         'B': ['B4', 'B5', 'B6', 'B7'],
#                         'C': ['C4', 'C5', 'C6', 'C7'],
#                         'D': ['D4', 'D5', 'D6', 'D7']},
#                          index=[4, 5, 6, 7]) 


# df3 = pd.DataFrame({'A': ['A8', 'A9', 'A10', 'A11'],
#                         'B': ['B8', 'B9', 'B10', 'B11'],
#                         'C': ['C8', 'C9', 'C10', 'C11'],
#                         'D': ['D8', 'D9', 'D10', 'D11']},
#                         index=[8, 9, 10, 11])



# print(pd.concat([df1,df2,df3]))
# print(pd.concat([df1,df2,df3],axis=1))




# Merge
# left = pd.DataFrame({'key': ['K0', 'K1', 'K2', 'K3'],
#                      'A': ['A0', 'A1', 'A2', 'A3'],
#                      'B': ['B0', 'B1', 'B2', 'B3']})
   
# right = pd.DataFrame({'key': ['K0', 'K1', 'K2', 'K3'],
#                           'C': ['C0', 'C1', 'C2', 'C3'],
#                           'D': ['D0', 'D1', 'D2', 'D3']})   


# pd.merge(left,right,how='inner',on='key')



#                                               --------------------------------------------------------

# df = pd.DataFrame({'col1':[1,2,3,4],'col2':[444,555,666,444],'col3':['abc','def','ghi','xyz']})

# print(df.head())
# print(df['col2'].unique())
# print(df['col2'].nunique())
# print(df['col2'].value_counts())
# print(df[(df['col1']>2) & (df['col2']==444)])




#Applying Functions --> ძაააააააან მნიშვნელოვანი რაღაცაა !!!
# df = pd.DataFrame({'col1':[1,2,3,4],'col2':[444,555,666,444],'col3':['abc','def','ghi','xyz']})

# def times2(x):
#     return 2*x

# values = df['col1'].apply(times2)
# print(values)


# values_1 = df['col2'].apply(lambda x : 2*x)
# print(values_1)


#Sort
# df = pd.DataFrame({'col1':[1,2,3,4],'col2':[444,555,666,444],'col3':['abc','def','ghi','xyz']})

# sorted = df.sort_values('col2')
# print(sorted)

# value_is_null = df.isnull()
# print(value_is_null) 



#                                               --------------------------------------------------------












