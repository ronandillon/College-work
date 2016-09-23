# -*- coding: utf-8 -*-
"""
Created on Fri Apr 18 12:36:50 2016

@author: Ronan Dillon
@student number: C12355251
"""

import pandas as pd
from sklearn.feature_extraction import DictVectorizer
import numpy as np
from sklearn.ensemble import BaggingClassifier
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn import linear_model
from sklearn import tree
from sklearn.ensemble import AdaBoostClassifier
from sklearn import cross_validation
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score
from sklearn.ensemble import RandomForestClassifier 
from sklearn import svm
from sklearn import linear_model
from sklearn.discriminant_analysis import QuadraticDiscriminantAnalysis
from sklearn.neighbors import KNeighborsClassifier
from sklearn.naive_bayes import BernoulliNB,GaussianNB
gnb = GaussianNB()



def gaussian(train_dfs,targetLabels,ts_dfs,testSet):
    
    clf = GaussianNB()
    #splits the records in the train set for training (60%) and testing (40%)
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0.4, random_state=0)
    
    #Trains the model fitting the training 60%
    clf.fit(instances_train,target_train)
    
    #predicts the results of each record in the testing 40%
    output = clf.predict(instances_test)
    print("Accuracy : " + str(accuracy_score(target_test, output, normalize=True)))  
    
def Bernoulli(train_dfs,targetLabels,ts_dfs,testSet):
    clf = BernoulliNB()
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0.4, random_state=0)
    clf.fit(instances_train,target_train)
    output = clf.predict(instances_test)
    print("Accuracy : " + str(accuracy_score(target_test, output, normalize=True))) 

def decisionTree(train_dfs,targetLabels,ts_dfs,testSet):
        
    decTreeModel2 = tree.DecisionTreeClassifier(criterion='entropy')
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0, random_state=0)
    decTreeModel2.fit(instances_train, target_train)
    predictions = decTreeModel2.predict(ts_dfs)
    print("Accuracy : " + str(accuracy_score(target_test, predictions, normalize=True)))
    
    
def forest(train_dfs,targetLabels,ts_dfs,testSet):
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0.4, random_state=0)
    forest = RandomForestClassifier(n_estimators = 100)
    forest = forest.fit(instances_train,target_train)
    output = forest.predict(instances_test)
    print("Accuracy : " + str(accuracy_score(target_test, output, normalize=True)))
    
    
    
def svc(train_dfs,targetLabels,ts_dfs,testSet):
    clf = svm.SVC()
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0.4, random_state=0)
    clf.fit(instances_train,target_train)
    output = clf.predict(instances_test)
    print("Accuracy : " + str(accuracy_score(target_test, output, normalize=True)))
    
    
def linearSVC(train_dfs,targetLabels,ts_dfs,testSet):
    clf = svm.LinearSVC()
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0.4, random_state=0)
    clf.fit(instances_train,target_train)
    output = clf.predict(instances_test)
    print("Accuracy : " + str(accuracy_score(target_test, output, normalize=True))) 

def sgd(train_dfs,targetLabels,ts_dfs,testSet):
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0.4, random_state=0)
    clf = linear_model.SGDClassifier()
    clf.fit(instances_train,target_train)
    output=clf.predict(instances_test)
    print("Accuracy : " + str(accuracy_score(target_test, output, normalize=True)))
    

def bagging(train_dfs,targetLabels,ts_dfs,testSet):
    
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0.4, random_state=0)
    bag = BaggingClassifier()
    bag.fit(instances_train,target_train)
    output=bag.predict(instances_test)
    print("Accuracy : " + str(accuracy_score(target_test, output, normalize=True)))

def linear(train_dfs,targetLabels,ts_dfs,testSet):
    clf = LinearDiscriminantAnalysis()
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0.4, random_state=0)
    clf.fit(instances_train,target_train)
    output = clf.predict(instances_test)
    print("Accuracy : " + str(accuracy_score(target_test, output, normalize=True)))
    
def quadratic(train_dfs,targetLabels,ts_dfs,testSet):
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0.4, random_state=0)
    clf = QuadraticDiscriminantAnalysis()
    clf.fit(instances_train,target_train)
    output=clf.predict(instances_test)
    print("Accuracy : " + str(accuracy_score(target_test, output, normalize=True)))
     
    
def neighbours(train_dfs,targetLabels,ts_dfs,testSet):
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0.4, random_state=0)
    clf = KNeighborsClassifier()
    clf.fit(instances_train,target_train)
    output=clf.predict(instances_test)
    print("Accuracy : " + str(accuracy_score(target_test, output, normalize=True)))
    
def logistic(train_dfs,targetLabels,ts_dfs,testSet):
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0.4, random_state=0)
    log = LogisticRegression()
    log.fit(instances_train,target_train)
    output=log.predict(instances_test)
    print("Accuracy : " + str(accuracy_score(target_test, output, normalize=True)))
    
    
def adaBoost(train_dfs,targetLabels,ts_dfs,testSet):
    
    #splits the records in the train set for training (60%) and testing (40%)
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0.4, random_state=0)
    clf = AdaBoostClassifier()
    clf.fit(instances_train,target_train)
    output=clf.predict(instances_test)
    
    #Prints out the accuracy of the classifier
    print("Accuracy : " + str(accuracy_score(target_test, output, normalize=True)))
    
    
    instances_train, instances_test, target_train, target_test = cross_validation.train_test_split(train_dfs, targetLabels, test_size=0, random_state=0)
    forest = RandomForestClassifier(n_estimators = 100)
    #Trains the model
    forest = forest.fit(instances_train,target_train)
    
    #predicts the results of each record in the test set
    output = forest.predict(ts_dfs)
    #Open file with write permission
    f = open('solutions/C12355251.txt', 'w')
    for i in range(len(testSet)):
        #write to the file with the id and the prediction
        f.write(testSet["id"][i]+","+output[i]+"\n")
    f.close() 
    


def main():
    
    #Read in text files for training and test sets
    Data = pd.read_csv("data/trainingset.txt",header=None,names=['id','age','job','marital','education','default','balance','housing','loan','contact','day','month','duration','campaign','pdays','previous','poutcome','y'])
    testSet = pd.read_csv("data/queries.txt",header=None,names=['id','age','job','marital','education','default','balance','housing','loan','contact','day','month','duration','campaign','pdays','previous','poutcome','y'])

    #Seperate numeric and categorial features for the training set
    numeric_features = ['age','balance','day','duration','campaign','pdays','previous']
    numeric_dfs = Data[['age','balance','day','duration','campaign','pdays','previous']]
    categorical_features = ['job','marital','education','default','housing','loan','contact','month','poutcome']
    cat_dfs = Data[['job','marital','education','default','housing','loan','contact','month','poutcome']]
    cat_dfs.replace('?','NA')
    cat_dfs.replace('unknown','NA')
    cat_dfs.fillna( 'NA', inplace = True )
    cat_dfs = cat_dfs.T.to_dict().values()
    
    #convert to numeric encoding
    vectorizer = DictVectorizer( sparse = False )
    vec_cat_dfs = vectorizer.fit_transform(cat_dfs) 
    #Merge numeric and categorical features
    train_dfs = np.hstack((numeric_dfs.as_matrix(), vec_cat_dfs ))
    
    #Repeat previous process for the test set
    ts_numeric_dfs = testSet[['age','balance','day','duration','campaign','pdays','previous']] 
    ts_cat_dfs = testSet[['job','marital','education','default','housing','loan','contact','month','poutcome']]
    testSet['y'].replace('?','NA')  
    ts_cat_dfs.replace('?','NA')
    ts_cat_dfs.replace('unknown','NA')
    ts_cat_dfs.fillna( 'NA', inplace = True )
    ts_cat_dfs = ts_cat_dfs.T.to_dict().values()
    #convert to numeric encoding
    ts_vec_cat_dfs = vectorizer.fit_transform(ts_cat_dfs) 
    #Merge numerical and categorical features
    ts_dfs = np.hstack((ts_numeric_dfs.as_matrix(), ts_vec_cat_dfs ))
    
    targetLabels=Data['y']
    
    #Fucntion calls to classfiers all commented out bar the most accurate. Accuracies found on the right hand side    
    
    #decisionTree(train_dfs,targetLabels,ts_dfs,testSet) #Accuracy 83.3%
    #gaussian(train_dfs,targetLabels,ts_dfs,testSet)     #Accuracy 83.4%
    #Bernoulli(train_dfs,targetLabels,ts_dfs,testSet)    #Accuracy 83.7%
    #quadratic(train_dfs,targetLabels,ts_dfs,testSet)    #Accuracy 84.3%
    #linearSVC(train_dfs,targetLabels,ts_dfs,testSet)    #Accuracy 85.4%
    #sgd(train_dfs,targetLabels,ts_dfs,testSet)          #Accuracy 29-86%  Inconsistent
    #neighbours(train_dfs,targetLabels,ts_dfs,testSet)   #Accuracy 87.6%
    #svc(train_dfs,targetLabels,ts_dfs,testSet)          #Accuracy 88.3%   Very Slow 
    #bagging(train_dfs,targetLabels,ts_dfs,testSet)      #Accuracy 88.8%
    #linear(train_dfs,targetLabels,ts_dfs,testSet)       #Accuracy 89.0%
    #forest(train_dfs,targetLabels,ts_dfs,testSet)       #Accuracy 89.1%
    #logistic(train_dfs,targetLabels,ts_dfs,testSet)     #Accuracy 89.30%
    
    #Most accurate of all 13 tested by .01%  
    adaBoost(train_dfs,targetLabels,ts_dfs,testSet)      #Accuracy 89.31%
   
   
    
main()