# 0x09. Web Infrastructure Design

This repository contains detailed documentation on the design, security enhancements, monitoring implementations, and scalability improvements for the web infrastructure of www.foobar.com. It progresses from a basic single-server architecture to a complex, distributed, and scalable system, ensuring high availability, security, and performance.

## Table of Contents

1. [Simple Web Stack](#simple-web-stack)
2. [Distributed Web Infrastructure](#distributed-web-infrastructure)
3. [Secured and Monitored Web Infrastructure](#secured-and-monitored-web-infrastructure)
4. [Scale Up](#scale-up)

---

## Simple Web Stack

### Overview

A foundational setup using a LAMP stack on a single server, designed to host the website www.foobar.com. This section outlines the initial infrastructure, including the server, web server (Nginx), application server, application files (codebase), database (MySQL), and domain name configuration.

### Components

- **Server**: Hosts the operating system and the LAMP stack components.
- **Web Server (Nginx)**: Handles HTTP requests and serves web content.
- **Application Server**: Executes application code and dynamically generates web content.
- **Database (MySQL)**: Stores and manages data for the web application.
- **Domain Name (foobar.com)**: Translates to the server IP via DNS, making the website accessible.

### Issues and Solutions

Discusses potential challenges like Single Points of Failure (SPOF), downtime during maintenance, and scalability limits, offering insights into basic web infrastructure design.

---

## Distributed Web Infrastructure

### Overview

Expands the initial setup into a three-server architecture, introducing additional servers, a load balancer (HAproxy), and a database replication setup. This design aims to enhance load handling, reliability, and fault tolerance.

### Enhancements

- **Additional Servers**: Improves capacity and performance.
- **Load Balancer (HAproxy)**: Distributes incoming traffic to prevent overload and ensure high availability.
- **Database Primary-Replica Setup**: Enhances data availability and load distribution.

### Specifics

Explains the rationale behind each addition, including the distribution algorithm for the load balancer, the Active-Active setup, and the workings of a Primary-Replica database cluster.

---

## Secured and Monitored Web Infrastructure

### Overview

Further advances the infrastructure by incorporating security measures like firewalls and SSL certificates, and by implementing a monitoring system. These additions aim to secure the web service and provide operational insights.

### Security and Monitoring

- **Firewalls**: Protect servers by controlling traffic based on security rules.
- **SSL Certificate**: Encrypts data transfer, ensuring secure communication.
- **Monitoring Clients**: Collects and analyzes data to monitor the health and performance of the infrastructure.

### Challenges

Addresses potential issues such as SSL termination at the load balancer, the reliance on a single MySQL server for writes, and the problems of homogenous server configurations.

---

## Scale Up

### Overview

Describes the strategic addition of servers and the separation of components (web, application, and database) onto their dedicated servers to support growth. This section also covers the clustering of load balancers for enhanced reliability.

### Scalability Improvements

- **Additional Server**: Further distributes the workload.
- **Load Balancer Clustering**: Provides redundancy for load balancing, eliminating single points of failure.
- **Component Separation**: Optimizes performance by dedicating servers to specific functions.

### Infrastructure Evolution

Discusses the rationale behind scaling up and the benefits of a more distributed, robust, and scalable infrastructure.

## Authors
- Yassine Mtejjal
