import string


print("(1) metric (m,Kg) or (2) Non-Metric (ft,pound)? ")

choseSystem=input("Please choose : ")

if (choseSystem != "1" and choseSystem != "2" ):
    print("you have not choose any thing \n Shutting down ...!!! ")
    exit()

height_unit ="meters"
weight_unit ="kilograms"

if (choseSystem ==2):
    height_unit = "feet"
    weight_unit= "pounds"

print("please enter your height in "+height_unit)
user_height =float(input("your height : "))

print("please enter your weight in "+ weight_unit)
user_weight=float(input("your weight : "))

adj_height= user_height
adj_weight = user_weight

if (choseSystem == "2"):
    adj_height= user_height /3.28084
    adj_weight = user_weight/2.20462 

bmi = adj_weight/ (adj_height *adj_height) 

print("your body mass index : ", bmi)