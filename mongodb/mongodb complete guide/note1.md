## show all databases 
show dbs 
show dbs
use <db name>
show collections
## create db or create db 

use shop 

## insert 1 document in shop db and collection products 
db.products.insertOne({name:"tafsir ibn kasir",price : 34.23})

## find all the value inside products 
db.products.find() 
db.products.find().pretty()

## CRUD Oparation 

### create
  insertOne(data,options)
  insertMany(data,options)
### Read  
  find(filter,options)
  findOne(filter,options)
### Update 
  updateOne(filter,data,options)
  updateMany(filter,data,options)
### Delete
  deleteOne(filter,options)
  deleteMany(filter,options)

## DELETE COMMAND 

db.flightData.deleteOne({departureAirport:"TXL"})
db.flightData.find().pretty()


db.flightData.deleteMany()
db.flightData.deleteMany({marker:"to delete"})
## delete all from  a collection
> db.stackcollection.remove({})

## UPDATE COMMAND 

db.flightData.update({distance:12002},{marker:"delete"})// ERROR
db.flightData.update({distance:12000},{$set:{marker:"delete"}})


db.flightData.updateMany({},{$set:{marker:"tODO"}}) 

## INSERT MANY 

[
{
	color: "red",
	value: "#f00"
	},
	{
	color: "green",
	value: "#0f0"
}
]


db.flight.insertMany([{ color: "red", value: "#f00" }, { color: "green", value: "#0f0"}]) 
db.flight.find().pretty()

## FIND COMMAND 
db.flight.find({name:"raka"})
db.flight.find({distance:1200})
db.flight.find({distance:{$gt:100}})
db.flight.findOne({distance:{$gt:900}}).pretty()

## UpdateOne UpdateMany (update is same as updateMany)

db.flight.updateOne({_id:ObjectId("78dn439nd39kd83d8")},{$set:{delayed:true}})

db.flight.update({_id:ObjectId("f5j3b6h46j443b")},{delayed:false}) 
// this will not give error , it will replace the object with new one 

## find 

db.passenger.find().toArray()
// give all the data 
db.passenger.find().forEach((passengerData)=>{printjson(passengerData)})
// this also gives all the data 
// pretty only works on  cursor object 
db.passenger.findOne().pretty() //error 
// findOne doesnt gives the cursor object 

## find only what's neeeded 

db.passenger.find({},{name:1}).pretty()
// gives only the name field 








