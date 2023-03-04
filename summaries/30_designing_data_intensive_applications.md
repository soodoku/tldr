## Designing Data Intensive Applications

* Interesting data intensive applications
	- Google Docs: https://medium.com/coinmonks/operational-transformations-as-an-algorithm-for-automatic-conflict-resolution-3bf8920ea447
	- Twitter: 
		- Posting a tweet simply inserts the new tweet into a global collection of tweets. When a user requests their home timeline, look up all the people they follow, find all the tweets for each of those users, and merge them (sorted by time).
		- Maintain a cache for each user’s home timeline—like a mailbox of tweets for each recipient user (see Figure 1-3). When a user posts a tweet, look up all the people who follow that user, and insert the new tweet into each of their home timeline caches. 
			- Why?
				- "This works better because the average rate of published tweets is almost two orders of magnitude lower than the rate of home timeline reads"
					- But for celebrities, writes can be 30M or more
						- "Tweets from any celebrities that a user may follow are fetched separately and merged with that user’s home timeline when it is read, like in approach 1."

### Chapter 1

* Reliable
	- Faults are ok but failures are not
* Scalable
	- Batch: Throughput + time to finish a job
		- throughput—the number of records we can process per second, or the total time it takes to run a job on a dataset of a certain size.
	- Online:
		- latency percentile:  service’s response time
		- cost-benefit:
			- 99.9 percentile --- valuable customers
			- Amazon has also observed that a 100 ms increase in response time reduces sales by 1% [20], and others report that a 1-second slowdown reduces a customer sat‐ isfaction metric by 16% [21, 22].
			- 99.9 -> 99.99 may be very expensive
		- Even if only a small percentage of backend calls are slow, the chance of getting a slow call increases if an end-user request requires multiple back‐ end calls, and so a higher proportion of end-user requests end up being slow (an effect known as tail latency amplification
		- measurement:
			- When generating load artificially in order to test the scalability of a system, the load- generating client needs to keep sending requests independently of the response time.
		- People often talk of a dichotomy between scaling up (vertical scaling, moving to a more powerful machine) and scaling out (horizontal scaling, distributing the load across multiple smaller machines). Distributing load across multiple machines is also known as a shared-nothing architecture.

	- Defining load
		- When you increase a load parameter and keep the system resources (CPU, mem‐ ory, network bandwidth, etc.) unchanged, how is the performance of your system affected?
		- When you increase a load parameter, how much do you need to increase the resources if you want to keep performance unchanged?

* Maintainable
	* Operability — ease to troubleshoot and run
	* Simplicity via abstraction
	* Evolvability

### Chapter 2

* Key Models
	* Relational Model --- optimizing for space
	* Document Model --- high write throughput, etc.
	* Network/Graph Based Model
		- The links between records in the network model were not foreign keys, but more like pointers in a programming language (while still being stored on disk). The only way of accessing a record was to follow a path from a root record along these chains of links. This was called an access path.
		* Triple-Stores and SPARQL
			-  (subject, predicate, object). For example, in the triple (Jim, likes, bananas)

* How to pick one over the other?
	- Document Over RDS
		- Pros
			- Dev Costs: Reduces the impedance mismatch between the application code and the storage layer.
			- Latency: The JSON representation has better locality than the multi-table schema in Figure 2-1. If you want to fetch a profile in the relational example, you need to either perform multiple queries (query each table by user_id) or perform a messy multiway join between the users table and its subordinate tables. In the JSON representation, all the relevant information is in one place, and one query is sufficient.
			- Price
		- Cons
			- Joins are done in program code
			- Moreover, even if the initial version of an application fits well in a join-free docu‐ ment model, data has a tendency of becoming more interconnected as features are added to applications. For example, consider some changes we could make to the résumé example: Organizations and schools as entities --- you want to launch a db
		- Other considerations
			- Schema on read
			- Alter table --- allegedly slow in RDS
			- Declarative (most of SQL) vs. imperative

### Chapter 3

* Key-value stores
	* Hash index
		- could use hash map in memory

The basic underlying write operation of a B-tree is to overwrite a page on disk with new data. It is assumed that the overwrite does not change the location of the page; i.e., all references to that page remain intact when the page is overwritten. This is in stark contrast to log-structured indexes such as LSM-trees, which only append to files (and eventually delete obsolete files) but never modify files in place.

As a rule of thumb, LSM-trees are typically faster for writes, whereas B-trees are thought to be faster for reads 

* OLAP and OLTP
* Star schema
	- Dimension --- objects
	- Fact --- observations


- Log Sort Merge or LSM Tables or SSTables
	+ optimized for write
- Page oriented
	+ B-trees

- Types of indices
	+ Clustered index
	+ Secondary index
	+ Covering index
	+ Multi-column index
	+ Fuzzy index
	+ In memory stores 

### Chapter 4

* backward compatibility
	- new service can read an old data store. say a new service adds a new field. default is to return null
* forward compatibility
	- old service and read the new data store

* encoding -> serialization -> marshalling
	- protobuf, avro --- key is stored as key_id

* Store to
	- file
	- db
	- external service
	- async server -- activeMQ

### Chapter 5

* Sync. vs. async. replication
	- durability
	- availability
	- latency

* Single leader
* Multi-leader
* Leaderless
	* ddb

Google docs
	- operational transform

### Chapter 6: Partitioning/Sharding/Bucketing/Splitting







