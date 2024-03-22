# Distributed Web Infrastructure Design for www.foobar.com

This document expands on a basic web infrastructure by introducing a distributed system designed to enhance reliability, scalability, and performance for hosting www.foobar.com.

## Overview

The updated infrastructure involves three servers, additional web and application servers, a load balancer (HAproxy), and a database setup in a Primary-Replica (Master-Slave) configuration. This design aims to distribute traffic effectively, improve load handling, and increase fault tolerance.

## Components and Additions

### Servers

- **Total Servers**: Three servers are now part of the infrastructure, hosting various components of the web application stack.

### Web Servers (Nginx)

- **Addition**: One more Nginx web server is added.
- **Why**: To distribute the load and ensure high availability and redundancy.

### Application Servers

- **Addition**: One more application server is included.
- **Why**: To handle the execution of application code efficiently across multiple servers, improving application scalability and reliability.

### Load Balancer (HAproxy)

- **Addition**: An HAproxy load balancer is introduced to the architecture.
- **Why**: To distribute incoming traffic among the web servers, enhancing the website's ability to handle high traffic volumes and provide uninterrupted service.

### Application Files

- **Distribution**: The application files are now replicated across the application servers.
- **Why**: To ensure that all application servers can handle requests independently and provide the same content, improving reliability.

### Database (MySQL)

- **Configuration**: A Primary-Replica (Master-Slave) setup is adopted for the database.
- **Why**: To enhance data availability, facilitate backups without affecting the primary database, and allow read operations to be offloaded to replica databases.

## Specifics

### Load Balancer Distribution Algorithm

- **Algorithm**: Round Robin is typically used for its simplicity and effectiveness in distributing requests evenly across servers.
- **How It Works**: Each new request is sent to the next server in the list, and the process cycles through all servers in a loop.

### Load Balancer Setup: Active-Active vs. Active-Passive

- **Chosen Setup**: Active-Active.
- **Explanation**: In an Active-Active setup, all servers are handling traffic, which maximizes resource utilization and provides redundancy. In contrast, Active-Passive has standby servers that only take over if the primary servers fail, providing a failover mechanism but not utilizing all resources under normal operations.

### Database Primary-Replica Cluster

- **How It Works**: The Primary node handles all write operations and replicates these changes to the Replica nodes. Replica nodes can handle read queries to distribute the load.
- **Primary vs. Replica**: The Primary node is the source of truth for all write operations, while Replica nodes are used to spread out read operations, enhancing performance.

## Infrastructure Issues

### Single Point of Failure (SPOF)

- **SPOFs**: While redundancy is improved, single points of failure can still exist, such as with the load balancer or the primary database node.

### Security Issues

- **Concerns**: The lack of firewalls and HTTPS configuration exposes the infrastructure to potential security threats, including unauthorized access and data interception.

### Lack of Monitoring

- **Implication**: Without monitoring tools, it's challenging to detect and respond to issues proactively, which can lead to undetected failures or performance bottlenecks.
