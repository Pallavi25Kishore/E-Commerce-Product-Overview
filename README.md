# E-Commerce Platform - Product Overview - Backend System Design and Optimization

## Overview
Welcome to the repository for the optimized and scaled backend services for the Product Overview feature of an e-commerce platform. This project showcases the transformation from a monolithic system to a web-scaled, highly performant architecture.

## About
This is a project to operationalize and web-scale the Product Overview component of an e-commerce platform. Inheriting a monolithic system, my goal was to enhance the overall performance of the backend services for the Product Overview component.

### Key Achievements
- **Optimized and scaled backend services for the Product Overview feature** using Node.js, Express.js, PostgreSQL, NGINX, AWS EC2, Grafana k6, and Loader.io.
- **Deployed 2 API servers and 2 databases on AWS EC2** and configured an NGINX load balancer, enhancing system fault tolerance and scalability.
- **Reduced query execution time by over 90%** and improved system performance by 200% for product lists and features, and 150% for product styles.
- **Achieved 2000 RPS** for product lists and features (over 3x target) and **1200 RPS** for product styles (over 2x target) through horizontal scaling.
- **Engineered PostgreSQL data models** and executed ETL pipelines to transform and ingest the application dataset, ensuring optimal performance and scalability.

### Journey of Optimization
The journey began with **query optimization**:
- Crafted complex queries to return data in the precise format required by the frontend, leveraging PostgreSQL's internal optimization mechanisms.
- Applied indexing and predicate pushdown techniques reducing query optimization time to single digits in milliseconds (>90% reduction)

Following query optimization, the application was deployed using 2 EC2 instances:
- One for the API server and one for the database

Next, I tackled **web-scaling**:
- Introduced an NGINX load balancer and an additional API server, doubling the performance for product lists and features (2000RPS) and increasing performance for product styles by 1.5x (750 RPS)
- This also improved the system's fault tolerance by introducing redundancy.

To address the potential database bottleneck, an additional database was added:
- This increased the performance of the styles endpoint to 1200 RPS with an error rate of less than 0.1% and latency under 700ms.
- Database scaling significantly enhanced the performance of complex queries but had less impact on simpler queries.

## Technologies
### Front-End:
![React](https://img.shields.io/badge/react-black?style=for-the-badge&logo=react)
![HTML5](https://img.shields.io/badge/html5-black?style=for-the-badge&logo=html5)
![CSS3](https://img.shields.io/badge/css3-black?style=for-the-badge&logo=css3)
![Axios](https://img.shields.io/badge/axios-black?style=for-the-badge&logo=axios)

### Back-End:
![Node.js](https://img.shields.io/badge/node.js-black?style=for-the-badge&logo=node.js)
![Express.js](https://img.shields.io/badge/express.js-black?style=for-the-badge&logo=express)
![PostgreSQL](https://img.shields.io/badge/postgresql-black?style=for-the-badge&logo=postgresql)
![NGINX](https://img.shields.io/badge/nginx-black?style=for-the-badge&logo=nginx)
![AWS EC2](https://img.shields.io/badge/aws%20ec2-black?style=for-the-badge&logo=amazon-aws)

### Testing:
![Grafana k6](https://img.shields.io/badge/grafana%20k6-black?style=for-the-badge&logo=grafana)
![Loader.io](https://img.shields.io/badge/loader.io-black?style=for-the-badge&logo=loader.io)

## Roadmap
 - [X] Set up the Node.js and Express.js framework.
 - [X] Implement PostgreSQL database schemas and establish connections.
 - [X] Complete ETL process
 - [X] Optimize query time
 - [X] Deploy API server and database on AWS EC2.
 - [X] Introduce NGINX load balancer and additional API server for horizontal scaling.
 - [X] Introduce additional database server to address potential database bottleneck.
 - [X] Conduct extensive load testing using Grafana k6 and Loader.io.
 - [X] Achieve and exceed performance targets with detailed monitoring and optimization.

## :white_check_mark: Getting Started
###  Prerequisites
![NPM](https://img.shields.io/badge/NPM-%23000000.svg?style=for-the-badge&logo=npm&logoColor=white)
```sh
npm install
```


### Installation
1. Clone the repo.
```sh
  git clone https://github.com/Pallavi25Kishore/E-Commerce-Product-Overview.git
```

2. Install NPM packages.
```sh
  npm install
```

3. Run in dev environment.
```sh
  npm run server-dev
```


