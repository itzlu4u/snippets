# MongoDB Cheat Sheet

## Installation and Running MongoDB

1. Install MongoDB: https://www.mongodb.com/try/download/community
2. Run MongoDB server: `mongod`
3. Connect to MongoDB server: `mongo`

## Basic MongoDB Commands

1. Show databases: `show dbs`
2. Create or switch to a database: `use <database_name>`
3. Show current database: `db`
4. Show collections: `show collections`

## CRUD Operations

### Create (Insert)

1. Insert a single document: `db.<collection_name>.insertOne({<field1>: <value1>, <field2>: <value2>})`
2. Insert multiple documents: `db.<collection_name>.insertMany([{...}, {...}, ...])`

### Read (Query)

1. Find all documents: `db.<collection_name>.find()`
2. Find specific documents: `db.<collection_name>.find({<field>: <value>})`
3. Limit the results: `db.<collection_name>.find().limit(<number>)`
4. Sort the results: `db.<collection_name>.find().sort({<field>: <order>})` (-1 for descending, 1 for ascending)
5. Filter the fields: `db.<collection_name>.find({}, {<field1>: <0_or_1>, <field2>: <0_or_1>})`

### Update

1. Update a single document: `db.<collection_name>.updateOne({<filter>}, {$set: {<field1>: <value1>, <field2>: <value2>}})`
2. Update multiple documents: `db.<collection_name>.updateMany({<filter>}, {$set: {<field1>: <value1>, <field2>: <value2>}})`
3. Replace a document: `db.<collection_name>.replaceOne({<filter>}, {<new_document>})`

### Delete

1. Delete a single document: `db.<collection_name>.deleteOne({<field>: <value>})`
2. Delete multiple documents: `db.<collection_name>.deleteMany({<field>: <value>})`
3. Drop a collection: `db.<collection_name>.drop()`

## Indexing

1. Create an index: `db.<collection_name>.createIndex({<field>: <order>})`
2. List indexes: `db.<collection_name>.getIndexes()`
3. Drop an index: `db.<collection_name>.dropIndex(<index_name>)`

## Aggregation Framework

1. Basic aggregation: `db.<collection_name>.aggregate([{<pipeline_stage>: {<options>}}])`
2. Common pipeline stages: `$match, $group, $sort, $project, $limit, $skip, $unwind, $lookup`

## Best Practices

1. Use indexes for frequently queried fields.
2. Use the aggregation framework for complex queries.
3. Validate data using schema validation: https://docs.mongodb.com/manual/core/schema-validation/
4. Monitor performance using the MongoDB Atlas monitoring tools: https://www.mongodb.com/cloud/atlas
5. Follow the MongoDB data modeling guide: https://docs.mongodb.com/manual/core/data-modeling-introduction/
6. Remember to always consult the MongoDB documentation for the most up-to-date information: https://docs.mongodb.com/manual/
