# Mongodb Note

mongo configaration file 

```
/etc/mongod.conf
```

system log will be stored 

```
/var/log/mongodb/mogod.log
```

where data is sored 

```
/var/lib/mongo
```

insert data 

```
db.flightdata.insertOne({"name":"raka"})
```

### CRUD operations

#### create

```
insertOne(data,options)


insertMany(data,options)
```

### read

```
find(filter,options)

findOne(filter,options)
```

### update

```
updateOne(filter,data,options)

updateMany(filter,data,options)

replaceOne(filter,data,options)
```

### delete

```
delelteOne(filter,options)

deleteMany(filter,options)
```

update one

```
  db.flightdata.UpdateOne({distance:1200} , {$set : {marker:"delete"}} )
```

update many 

```
db.flightdata.updateMany({},{$set: {marker:"todelete"})
 // all the document will update with this value
```

delete many 

```
db.flightdata.deleteMany({marker:"todelte"})
// delete all the document where marker
```

insert many 

```
db.flightData.insertMany([
    {name: "raka"},
    {name: "ssar"},
])
// give an array of data 
```

find 

```
db.flightdata.find({name:"Max"})

db.flightdata.find({distance:12000})

db.flightdata.find({distance: {$gt: 120})
```

find one 

```
db.flightdata.findOne({name:"Max"})

db.flightdata.findOne({distance:12000})

db.flightdata.findOne({distance: {$gt: 120})
```

for each 

```
db.passenger.fing().forEach((passengerData)=>{printjson(passenger)})

// this will print allthe value
```

.pretty() // only works when function return cursor object

set projection in find 

```
db.passenger.find({}, {name:1}).pretty()


db.passenger.find({}, {name:1,_id:0}).pretty()
// output without _id
```

find nested document 

```
db.flightData.find({"status.description":"on-time"}).pretty()

db.flightData.find({"status.details.responsible":"max"}).pretty()
```
