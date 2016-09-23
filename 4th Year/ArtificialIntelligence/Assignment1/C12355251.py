# -*- coding: utf-8 -*-
"""
Created on Sun Feb 14 18:41:51 2016

@author: ronan
"""
import pandas as pd

pd.set_option('display.mpl_style', 'default') 


figsize(15, 5)
na_val=['?',' ?',' ...']
f_names = pd.read_csv('./data/featurenames.txt',header=None)
d_set = pd.read_csv('./data/DataSet.txt', sep =",",header=None, names=f_names[0],na_values=na_val)


#Selects category and continuous row numbers 
cat_rows=[2,4,6,7,8,9,10,14]
cont_rows=[1,3,5,11,12,13]

category=d_set[cat_rows]
continuous=d_set[cont_rows]


cont=["FEATURENAME","Count","Miss","Card.","Min","1st Qrt.","Mean","Median","3rd Qrt.","Max","Std. Dev."]

cat=["FEATURENAME","Count","Miss","Card.","Mode","Mode Freq.","Mode %","2nd Mode","2nd Mode Frequency","2nd Mode%"]





#Entering quality report data into Category dataframe
cat_tab=pd.DataFrame(columns=cat)
cat_tab['Count']=category.count()
cat_tab['Miss']=category.isnull().sum()/category.count()*100
cat_tab['Mode']=category.mode().sum()
cat_tab['Mode Freq.']=category[category == category.mode().sum()].count()
cat_tab['Mode %']=(cat_tab['Mode Freq.']*100)/cat_tab['Count']

cat_tab['2nd Mode']=category.mode().sum()
cat_tab['FEATURENAME']=cat_tab.index
for x in category:
    cat_tab['Card.'][x]=len(category[x].unique())
    
    
#Entering quality report data into Continuous dataframe
cont_tab=pd.DataFrame(columns=cont)

cont_tab['Count']=continuous.count()
cont_tab['Miss']=(continuous.isnull().sum()*100)/continuous.count()
cont_tab['Min']=continuous.min()
cont_tab['Max']=continuous.max()
cont_tab['Mean']=continuous.mean()
cont_tab['Median']=continuous.median()
cont_tab['1st Qrt.']=continuous.quantile(0.25) 
cont_tab['3rd Qrt.']=continuous.quantile(0.75)
cont_tab['Std. Dev.']=continuous.std()

for y in continuous:
    cont_tab['Card.'][y]=len(continuous[y].unique())

cont_tab['FEATURENAME']=cont_tab.index
cont_tab.to_csv('./data/c12355251CONT.csv')
cat_tab.to_csv('./data/c12355251CAT.csv')

