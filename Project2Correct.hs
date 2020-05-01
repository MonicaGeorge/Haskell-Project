
items = ["item1","item2","item3","item4","item5","item6"]


createEmptyFreqList _ []=[]
createEmptyFreqList ((a,b):z) (x:xs)=(x,createTuple x b):createEmptyFreqList ((a,b):z) xs             --call createTuple (getItems ()!!0) inside empty lists (x,[counter sth:createEmptyFreqList!!

getAllUsersStats []=[]
getAllUsersStats ((a,b):xs)=(a,createEmptyFreqList ((a,b):xs) items) :getAllUsersStats xs
                                                                  --Creating an empty list of lists of items ("item1",[]),("item2",[])
--createEmpty []=[]                                        
--createEmpty (b:xs)=createEmptyFreqList (b:xs)

getItems []=[]                                                                  --getting items lists without String "user X"
getItems ((a,b):xs)=b :getItems xs
                                                                  

                                                                 --checks if a String is present in a list of lists of Strings

elemT a []=False
elemT a (x:xs)=if a `elem` x then True else elemT a xs

                                                                 --Counting number of items that came wih each item
--counter a []=[]
--counter a (x:xs)= if a/=x then (x,1):counter a xs else counter a xs	
--checks  [] _=[]
--checks (a:b) ((x,y):xs)=if a elemT (x:xs) then counter a b (x:xs) else checks b ((x,[]):xs)
 
--counter a (b:c) (x:xs)= 
createTuple item1 []=[]
createTuple item1 (x:xs)=if elemT item1 (x:xs) then (count1 item1 (check item1 (x:xs))) else []
 
check item1 []=[]
check item1 (x:xs)=if elem item1 x then x:check item1 xs else check item1 xs 
                                                                          --Counting number of items that came wih each item in a single list

count1 _ []=[]																		  
count1 item1 (x:xs)=if x==[] then count1 item1 xs else count2 item1 x (x:xs)++count1 item1 (removeL x (x:xs))
                                                                           --Counting number of items that came wih each item in list of lists
count2 _ [] (y:z)=[]
count2 item1 (x:xs) (y:z)=if x/=item1  then (x,search item1 x (y:z)):(count2 item1 xs (remove2 x (y:z))) else (count2 item1 xs (y:z))
                                                                           --Counting number of items that came wih each item in list of lists


                                                                 --removing an element from a list

remove1 _ []=[]
remove1 a (x:xs)=if a==x then remove1 a xs else x:remove1 a xs
                                                                 --removing an element from a list of lists
remove2 _ []=[]
remove2 a (x:xs)=remove1 a x :remove2 a xs

removeL _ []=[]                                                                 --removes all members of a list from a list of lists except if member equals c
removeL [] (x:xs)=(x:xs)
removeL (a:b) (x:xs)=if elemT a (x:xs) then removeL b (remove2 a (x:xs)) else removeL b (x:xs)

removeE []=[]
removeE (x:xs)=if x==[] then removeE xs else x:removeE xs

search b a []=0                                                    --searching for an item in a list of lists
search b a (x:xs)=if elem a x && a/=b  then (search2 a x)+search b a xs else search b a xs

search2 a []=0                                                  --searching for an item in a list
search2 a (x:xs)=if x==a then 1+(search2 a xs) else search2 a xs

