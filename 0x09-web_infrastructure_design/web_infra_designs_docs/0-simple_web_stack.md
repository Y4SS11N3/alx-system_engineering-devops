# Simple Web Infrastructure Design for www.foobar.com

This document describes a basic web infrastructure design intended to host the website accessible at www.foobar.com. The setup comprises a single server utilizing a LAMP stack, addressing the requirements for a web server, application server, database, and domain configuration.

## Overview

A user wishing to access the website will initiate a request to www.foobar.com. This request is resolved through DNS to the server IP address 8.8.8.8, where a LAMP stack is configured to serve the website's content.

### Components

#### 1. Server

- **Description**: A physical or virtual machine hosting all components necessary to serve the website's content.
- **Role**: Hosts the operating system and all the services required for the web infrastructure, including the web server, application server, and database.

#### 2. Web Server (Nginx)

- **Description**: Software that handles incoming HTTP requests from users and serves web content.
- **Role**: Receives user requests and serves static content directly or forwards dynamic content requests to the application server.

#### 3. Application Server

- **Description**: The environment where the application runs.
- **Role**: Executes application code, handles dynamic content generation, and communicates with the database as necessary.

#### 4. Application Files (Your Codebase)

- **Description**: The collection of files constituting the website's application logic.
- **Role**: Contains the source code and resources needed for the application to function.

#### 5. Database (MySQL)

- **Description**: A relational database management system.
- **Role**: Stores, retrieves, and manages the application data efficiently.

#### 6. Domain Name (foobar.com)

- **Description**: The human-readable address of the website.
- **Role**: Translates to the server IP via DNS, making the website accessible to users.

### DNS Configuration

- **Type of DNS record for www**: The `www` subdomain is typically an A record in DNS, which points to the server IP address (8.8.8.8 in this case).

### Communication Protocol

- **Server and User Communication**: The server communicates with the user's computer using the HTTP/HTTPS protocol, enabling the transfer of web pages and user data.

## Infrastructure Issues

### Single Point of Failure (SPOF)

- The design includes a single server, which constitutes a single point of failure. If the server goes down, the website becomes inaccessible.

### Downtime During Maintenance

- Maintenance activities, such as deploying new code or restarting the web server, will cause downtime, rendering the website temporarily unavailable.

### Scalability Limitations

- The infrastructure cannot scale effectively to handle increased traffic. High volumes of incoming traffic might overwhelm the server, leading to performance degradation or outages.
