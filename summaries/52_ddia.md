### Designing Data Intensive Applications

#### Ch. 1. Reliable, Scalable, Maintainable

* Many applications today are data-intensive, as opposed to compute-intensive.

For example, there are datastores that are also used as message queues (Redis), and there are message queues with database-like durability guar‐ antees (Apache Kafka).


#### Ch. 6. Paritioning

* Why? Scalability.

* How to spread load evenly
	- Key Value
		- Key Range. Boundaries can be chosen manually to spread load evenly. 
			- Issue: Say one partition per day. Say we write data from 1000s of sensors to the database as the measurements happen. All the writes end up going to the same partition (the one for today) while other partitions sit idle. 
				- A solution: prefix sensor name to each partition so partitioning first happens by sensor name. 
		- Hash of Key. A good hash function takes skewed data and makes it uniformly distributed.
			- Range of hashes can be assigned to one partition. Or you can assign random hashes to partitions (consistent hashing)
			- Issue: range queries are expensive
				- A solution: Cassandra can be declared with a compound primary key consisting of several columns. Only the first part of that key is hashed to determine the partition, but the other columns are used as a concatenated index for sorting the data in Cassandra’s SSTables. Great use case = social media updates. username as partition and timestamp for sorting.
		- Viral celebrity post --- lots of reads and writes (likes/comments). Hash fails. Add something to the hot key so that you can split it to more partitions.
	- Secondary Indices
		- Local Index
		- Global Index (by term)

	- Rebalancing
		- 

* Options
	- Shared Nothing: Data on diff. nodes

* Each node may be the leader for some partitions and a follower for other partitions.

#### Ch. 7. Transactions

* Transactions have been the mechanism of choice for simplifying these issues. A transaction is a way for an application to group several reads and writes together into a logical unit. Conceptually, all the reads and writes in a transaction are executed as one operation: either the entire transaction succeeds (commit) or it fails (abort, rollback).

* ACID vs. BASE
	- Atomicity, Consistency, Isolation, and Durability
	- Basically Available, Soft state, and Eventual consistency

* ACID
	* Atomicity. Transaction happens or doesn't happen.
	* Consistency. Certain statements about your data (invariants) that must always be true. For example, in an accounting system, credits and debits across all accounts must always be balanced.
	* Isolation. How to manage multiple clients writing to the same record. One ans. = serializability.
		- Read Committed. 
			- for every object that is written, the database remembers both the old com‐ mitted value and the new value set by the transaction that currently holds the write lock. While the transaction is ongoing, any other transactions that read the object are simply given the old value. 
		- Prevent dirty writes with row level locks
		- Snapshot isolation
	* Durability. Copy to multiple nodes, etc.

* Phantoms causing write skew
	- Step 1: Search for X
	- Step 2: if X is found, update, insert, delete
	- Step 3: Step 1 results would be diff.

* 2 PL
	* Two-phase locking is similar, but makes the lock requirements much stronger. Sev‐ eral transactions are allowed to concurrently read the same object as long as nobody is writing to it. But as soon as anyone wants to write (modify or delete) an object, exclusive access is required:)


#### The Trouble with Distributed Systems

* Unreliable network
* Clocks
* Detecting Faults
	* Timeouts
		* Synchronous model. The synchronous model assumes bounded network delay, bounded process pau‐ ses, and bounded clock error. 
		* 
	* Consensus
* A system is Byzantine fault-tolerant if it continues to operate correctly even if some of the nodes are malfunctioning and not obeying the protoco


#### Consistency and Consensus

* This is the idea behind linearizability [6] (also known as atomic consistency [7], strong consistency, immediate consistency, or external consistency [8]). 


#### Batch Processing

#### Stream Processing



* Direct messaging from producers to consumers, UDP, ZeroMQ

* Message Brokers: 
	* A widely used alternative is to send messages via a message broker (also known as a message queue), which is essentially a kind of database that is optimized for handling message streams 
	* By centralizing the data in the broker, these systems can more easily tolerate clients that come and go (connect, disconnect, and crash), and the question of durability is moved to the broker instead. 
	* Databases often support secondary indexes and various ways of searching for data, while message brokers often support some way of subscribing to a subset of topics matching some pattern
	*  In order to ensure that the message is not lost, message brokers use acknowledgments: a client must explicitly tell the broker when it has finished process‐ ing a message so that the broker can remove it from the queue.
		- With redelivery (if Client 1 crashes), this can change order in which stuff is processed

* Multiple consumers
	* Fan Out
	* Load balancing


