import pandas as pd
import numpy as np
import random

#1
# a = [1, 7, 2]
# myvar = pd.Series(a)

# print(myvar)
# print(myvar[0])


#2
# labels = ['a','b','c']
# my_data = [10,20,30]
# arr = np.array(my_data)
# d = {'a':10,'b':20,'c':30}

# myvar = pd.Series(my_data)
# myvar_1 = pd.Series(my_data,labels)
# myvar_2 = pd.Series(d)

# print(myvar_2)


#3
# data = {
#     "calories" : [450,320,125] ,
#     "duration" : [50,40,45]
# }

# df = pd.DataFrame(data)
# print(df)
# print(df.loc[0])


#4
# np.random.seed(101)
# df = pd.DataFrame(np.random.randn(5,4),['A','B','C','D','E'],['W','X','Y','Z'])

# print(df) 
# print('-------')

# #ქოლუმების დაბეჭდვა თუ გვინდა
# print(df['W']) 
# print(df[['W','Z']]) 
# print('-------')

# #როუების დაბეჭდვა თუ გვინდა 
# print(df.loc['C'])
# print(df.iloc[2])
# print('-------')

# #ერთი ან რამდენიმე ელემენტის ბეჭდვა
# print(df.loc['B','Y'])
# print(df.loc[['A' , 'C'],['W','Y']])
# print('-------')


# df['New'] = df['W'] + df['Y']
# print(df)

# df.drop('New',axis=1,inplace=True)
# print(df)


#5
# np.random.seed(101)
# df = pd.DataFrame(np.random.randn(5,4),['A','B','C','D','E'],['W','X','Y','Z'])
# booldf = df > 0

# print(df[booldf])
# print('-----')
# print(df[df['W'] > 0])
# print('-----')
# print(df[(df['W'] > 0) & (df['Y'] > 1)])  ##and
# print('-----')
# print(df[(df['W'] > 0) | (df['Y'] > 1)])  ##or


#6
# df = pd.read_csv('data.csv')
# print(df.head())
# print(df.tail())


#7
# new_df = df.dropna()
# df['Calories'].fillna(999,inplace=True)


#8
# df = pd.read_csv('data_1.csv')
# df['Date'] = pd.to_datetime(df['Date'])


#9
# df = pd.read_csv('data_1.csv')
# print(df.duplicated())


#10
# data = {'Company':['GOOG','GOOG','MSFT','MSFT','FB','FB'],
#        'Person':['Sam','Charlie','Amy','Vanessa','Carl','Sarah'],
#        'Sales':[200,120,340,124,243,350]}


# df = pd.DataFrame(data)
# byComp = df.groupby('Company')

# print(byComp.mean())


#11
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


#12
#Applying Functions --> ძაააააააან მნიშვნელოვანი რაღაცაა !!!
# df = pd.DataFrame({'col1':[1,2,3,4],'col2':[444,555,666,444],'col3':['abc','def','ghi','xyz']})

# def times2(x):
#     return 2*x

# values = df['col1'].apply(times2)
# print(values)


# values_1 = df['col2'].apply(lambda x : 2*x)
# print(values_1)


#13

# df = pd.DataFrame({'col1':[1,2,3,4],'col2':[444,555,666,444],'col3':['abc','def','ghi','xyz']})

# sorted = df.sort_values('col2')
# print(sorted)

# value_is_null = df.isnull()
# print(value_is_null) 
























