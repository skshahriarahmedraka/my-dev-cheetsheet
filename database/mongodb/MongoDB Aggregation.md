# MongoDB Aggregation

```
db.getCollection("persons").find({})
```

```
db.persons.insertMany()
```

### aggregation process

aggregate()

- documents during aggregation process pass through  the stages 

```
db.<collection>.aggregate([
    <stage1>,
    <stage2>,
    ...
    <stageN>
])
```

note: Aggregation request return cursor form the server

note : `db.persons.aggregate([])`   with out any stages will give same results as `db.persons.find()`

### Aggregration stage

doc1  doc2 doc3  . . .  docN

                | input 

            Stage

                | 

doc1 doc2  . . .   docN

#### each stage starts from the stage operator

```
{ $<stageOperator> : {} }
```

- examples 
  
  ```
  { $match : {age: {$gt : 20 }} }
  { $group: { _id: "$age"}}
  {$sort : {count : -1 }}
  ```

- ```
  $match  $group $project $sort $count $limit $skip $out
  ```

- expression refers to the name of the field in input  documents
  
  `"$<fieldName>"`
  
  - example 
  
  - ```
    {$group : {_id : "$age"}}
    {$group: {_id: "$company.location.company"}}
    {$group: {_id : "$name", total: {
        $sum : "$price"
    }}}
    ```
  
  - 

#### $match stage

- match specific documents useing query

- `{$match: {<query>}}`

- exmaples 

- ```
  {$match:{city : "Dhaka"} }
  { $mathc : {age : {$gt : 25 } } }
  { $match : {$and : [ {gender: "male" }, {age : {$gt:25 } } ] } }
  ```

- Note : match uses standard mongodb querites and supports all query operators 

### Example 1: $match

```
db.persons.aggregate([
    {$match: { age: {$gt: 25 } } }
] )
```

```
db.persons.aggregate([
    // stage 1 
    {$match: { isActive: true } }
] )
```

```
db.persons.aggregate([
    // stage 1 
    {$match: { tags: { $size: 3 } } }
] )
```

### $group stage

- Group input document by certain expression 

- ```
  { $group: { _id : <expression> , <field1> : 
  { <accumulator1> : <expression> }, . . . } }
  ```

- example  :

- ```
  { $group: {  _id : "$age" } }
  { $group: { _id: {age: "$age",gender: "$gender" } } }
  
  // here _id  is mandatory field
  ```

- example 2 $group 

- ```
  db.persons.aggregate([
      { $group :  { _id : "$age" }  }
  ])
  ```

- example3 : $group by nested fields 

- ```
  db.persons.aggregate([
      { $group: { _id: "$company.location.country" } }
  ])
  ```

- example 4 $group by multiple fields 

- ```
  db.persons.aggregate([
      { $group: { _id: { age: "$age" , gender: "$gender" } }}
  ])
  ```

- ```
  db.persons.aggregate([
      { $group: { _id: { eyeColor: "$eyeColor" ,
       favouriteFruit: "$FavouriteFruit" } }}
  ])
  ```

- example 5 : $match and \$group 

- ```
  db.persons.aggregate([
      // stage 1
      { $match: { favouriteFruit: "banana" } },
      // stage 2
      { $group: { _id: { age: "$age" , eyeColor: "$eyeColor" } } }
  ])
  ```

- example 6: \$group and \$match  

- ```
  db.persons.aggregate([
      { $group: { _id : { age: "$age" , eyeColor: "$eyeColor" } } },
      { $match: { favouriteFruit: "banana" } }
  ])
  // empty 
  // wrong stages order 
  ```

- example 7: \$group and \$match

- ```
  db.persons.aggregate([
      {$group: { _id: { age: "$age" , eyeColor: "$eyeColor" } } },
      { $match: { "_id.age" :{ $gt : 30 } }   }
  ])
  ```

- 

### \$count stage

- counts number of the input  of documents

```
{ $count : "<title>" }
```

- example 

```
{  $count: "countries" }


will give output like this 
`{"countries" :4 }`
```

- different count method

```
// these are client side count method
db.persons.aggregate([]).toArray().length
// 1 to 7 second 

// client side method
db.person.aggregate([]).itcount()
// 1 to 4 second 

// serverside method
db.persons.aggregate([{$count : "total" }])
// 0 to 0.21 second
// return :  { "total" :1000 }


// serverside method
db.persons.find({}).count()
// 0 to 0.21 second

Note : find count() is a wrapper of Aggregate $count  
```

### Example 9 : \$group and \$count

```
db.persons.aggregate([
    { $group: { _id : "$company.location.country" } },
    { $count: "countriesCount" }
])
```

```
db.persons.aggregate([
    { $match :  { age: { $gte: 25 } } },
    { $group: { _id : { eyeColor : "$eyeColor", age: "$age" } } },
    { $count: "eyeColorAndAge" }
])
```

### \$sort stage

- Sorts input document by certain field(s)
  
  ```
  { $sort: { <field1>: <-1|1> , <field2> : <-1|1> . . . } }
  ```

- examples 

```
{ $sort: { score: -1 } }
{ $sort: { age:1 , country:1 } }
```

Note:  <field>:1 assending order  , <field>: -1 descending Order

### example 10 :  $sort

```
db.persons.aggregate([
    {$sort: {name:1} }
])
```

2d sort 

```
db.persons.aggregate([
    {$sort: {name:1 , gender:-1 } }
])
```

### Example 11: \$group and \$sort

```
db.persons.aggregate([
    { $group: { _id : "$favouriteFruit" } },
    {$sort : {_id : 1 } }
])
```

```
db.persons.aggregate([
    { $group: {  _id : { eyeColor : "$eyeColor",
         favoriteFruit :"$favouriteFruit" } },
    {$sort : { "_id.eyeColor" : 1 , "_id.favouriteFruit" : -1 } }
])
```

```
db.persons.aggregate([
    { $match : { eyeColor: { $ne : "blue" } }}
    { $group: {  _id : { eyeColor : "$eyeColor",
         favoriteFruit :"$favouriteFruit" } },
    {$sort : { "_id.eyeColor" : 1 , "_id.favouriteFruit" : -1 } }
])
```



### $project Stage

- includes ,exclude or adds new fields 

```
{
    $project : { <field1>:<1> , <field1>: <0>, 
<newField1> : <expression> . . .  }
}
```

```
{
    $project: { name: 1, "company.title": 1 }
}
{
    $project: { _id:0 , name:1 , age: 1}
}
{
    $project: { eyeColor:0, age:0}
}
{
    $project: {name:1 , newAge: "$age"}
}
```



### exmaple 12: \$project

```
db.persons.aggregate([
    {$project: { name: 1 , "company.location.country": 1 }}
])


// result 
{
    "_id": ObjectId("387253785),
    "name" : "sk raka"
    "company" : {
        location : {
            country : USA
}
}
}
```

```
db.persons.aggregate([
    {$project: { isActive:1, name: 1 , _id:1, gender:1 }}
])
// this will only return  4 field

db.persons.aggregate([
    {$project: { isActive:0, name: 0 , gender:0}}
])
// this will return all field except these three
```

### example 13: \$Project With new field

```
db.persons.aggregate([
    { $project: {
       _id :0 ,
        name: 1
        info: {
            eyes: "$eyeColor"
            fruit: "$favouriteFruit",
            country: "$company.location.country"
}
}
    
}
])


// result
{
    "index": 0
    "name" : raka
    "info" : {
        "eyes": "green",
        "company": "yurture",
        "country" : "USA"
}
}
```














