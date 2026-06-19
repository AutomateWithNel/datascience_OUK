---
type: assignment
course_code: CSC 209
module: 11
---

# Module 11 - Quiz Answers

**Source Reference**: `Module 11 - Distributed Databases.md`

## Question 1
**Which of the following are advantages of using replication as a design strategy in distributed database systems? (Select all that apply)**
*   **A. Faster data retrieval** (Correct - data can be retrieved from a local or closer replica)
*   **C. Improved data availability** (Correct - if one site fails, data is still available elsewhere)
*   **E. Easier backup and recovery processes** (Correct - the inherent copies serve as natural backups and aid in recovery)
*(Options B and D regarding simplified consistency management are incorrect, as replication makes consistency management significantly more complex).*

## Question 2
**Which of the following are potential disadvantages of using fragmentation as a design strategy in distributed database systems? (Select all that apply)**
*   **A. Higher maintenance costs** (Correct - managing and maintaining multiple fragments increases administrative overhead)
*   **C. Risk of data inconsistency** (Correct - ensuring referential integrity across fragments can be complex)
*   **E. Increased query complexity** (Correct - queries often need to join multiple fragments together, requiring a sophisticated optimizer)

## Question 3
**Which of the following statements correctly describe location transparency in distributed database systems? (Select all that apply)**
*   **B. It simplifies the distribution of data across multiple sites** (Correct - by abstracting physical locations, it simplifies how data is distributed and managed from an application development perspective)
*   **C. Users can access data without knowing its physical location** (Correct - this is the exact definition of location transparency)
*   **D. It is critical for providing a seamless user experience** (Correct - it hides backend complexity from the end user)

## Question 4
**Which of the following are characteristics of the Client-Server Architecture for DDBMS? (Select all that apply)**
*   **A. Centralized server handles all database requests** (Correct - in this specific pattern, clients offload database processing to a server)
*   **C. Supports multiple client requests simultaneously** (Correct - client-server models are designed for concurrent client access)
*   **D. Suitable for large-scale distributed systems** (Correct - it scales well by adding more powerful servers or load balancing)

## Question 5
**Which of the following are true about fragmentation and replication transparency in distributed database systems? (Select all that apply)**
*   **B. Fragmentation transparency ensures users are unaware of data partitioning** (Correct)
*   **C. They ensure that users can access data without concerning themselves with how it is stored or replicated** (Correct)
*   **D. Replication transparency hides the existence of data copies from users** (Correct)
*   **E. These transparencies are crucial for maintaining data integrity across sites** (Correct - by abstracting the complexity of fragments and replicas, the DBMS handles consistency and integrity, preventing users from making erroneous manual updates to individual partitions)
