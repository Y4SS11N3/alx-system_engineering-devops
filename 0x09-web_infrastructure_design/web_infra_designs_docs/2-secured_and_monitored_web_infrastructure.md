# Secured and Monitored Web Infrastructure Design for www.foobar.com

This document outlines an enhanced web infrastructure for www.foobar.com, focusing on security, encryption, and monitoring to ensure a robust and reliable web service.

## Overview

Building upon the distributed web infrastructure, this setup introduces additional security measures and monitoring capabilities across three servers, aiming to secure the web service and provide comprehensive insight into its operations.

## Additions and Explanations

### Firewalls

- **Addition**: Three firewalls are implemented, one for each server.
- **Purpose**: Firewalls act as a security barrier, controlling incoming and outgoing network traffic based on predetermined security rules, thereby protecting the servers from unauthorized access and various types of attacks.

### SSL Certificate

- **Addition**: An SSL certificate is applied to serve www.foobar.com over HTTPS.
- **Purpose**: The SSL certificate encrypts data transmitted between the user's browser and the web server, ensuring the security and privacy of information exchanged, and fostering trust in the website.

### Monitoring Clients

- **Addition**: Three monitoring clients are installed, one on each server.
- **Purpose**: These clients collect and send data to a central monitoring service (such as Sumo Logic), allowing for real-time monitoring of server health, performance metrics, and potential security threats.

## Specifics

### Role of Firewalls

- Firewalls serve to filter traffic, blocking or allowing data packets based on a set of security rules, effectively preventing unauthorized access and mitigating various security risks.

### HTTPS Traffic

- Serving traffic over HTTPS, thanks to the SSL certificate, ensures that all data transferred between the web server and users is encrypted, protecting against eavesdropping, tampering, and man-in-the-middle attacks.

### Monitoring Purpose

- Monitoring is crucial for maintaining the operational health of the infrastructure. It provides insights into performance, detects anomalies, facilitates troubleshooting, and helps in preemptive issue resolution to ensure uninterrupted service.

### Data Collection by Monitoring Tools

- Monitoring tools collect data through agents installed on each server, which gather various metrics (CPU usage, memory usage, network activity, etc.) and logs for analysis, offering visibility into the system's state and performance.

### Monitoring Web Server QPS

- To monitor the web server's Queries Per Second (QPS), configure the monitoring tool to collect and analyze the web server access logs, which record all incoming requests, allowing for an accurate assessment of the server's request handling capacity.

## Infrastructure Issues

### SSL Termination at the Load Balancer

- **Issue**: Terminating SSL at the load balancer simplifies certificate management and reduces computational overhead on web servers but exposes traffic between the load balancer and web servers to potential interception within the network.

### Single MySQL Server for Writes

- **Issue**: Relying on a single MySQL server for all write operations creates a bottleneck and a single point of failure for the database layer, risking data loss and service disruption in case of server failure.

### Homogeneous Server Components

- **Issue**: Having servers with identical setups (combining database, web server, and application server) can lead to resource contention, increased attack surface, and difficulty in scaling individual components based on demand.
