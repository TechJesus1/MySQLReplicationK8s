## Database Replication Features

In this project, I implemented database replication for MySQL. MySQL replication is a powerful feature that automatically copies data from one MySQL database server (the master) to one or more MySQL database servers (the slaves). This replication ensures data synchronization across multiple instances, enhancing fault tolerance, scalability, and performance.

### Key Features of MySQL Replication

1. **Master-Slave Architecture:** MySQL replication follows a master-slave architecture, where one server serves as the master, handling write operations, while one or more servers act as slaves, receiving and applying replicated data.

2. **Asynchronous Replication:** MySQL replication operates asynchronously by default, with transactions committed on the master being replicated to the slaves after a delay. This delay can vary based on factors like network latency.

3. **Read Scaling:** Replication enables distributing read operations among multiple slave servers, improving performance for read-heavy workloads.

4. **High Availability:** Replication contributes to high availability by providing failover capabilities. If the master fails, a slave can be promoted to become the new master, ensuring uninterrupted database access.

## Major Steps for Deployment in Kubernetes

1. **ConfigMap and Services:** Defined a ConfigMap (`configmap.yaml`) to store MySQL configuration files and created services (`services.yaml`) for MySQL database and read-only access to replicas.

2. **StatefulSet Deployment:** Utilized a StatefulSet (`statefulset.yaml`) to manage MySQL instances, including initialization, replication setup, and data persistence.

3. **Kubernetes Add-ons and Configuration:** Utilized `setup.sh` to start a 3-node Kubernetes cluster with minikube, enabled necessary add-ons for storage management, and configured volume snapshots.

4. **Testing and Monitoring:** Monitored pod progress (`kubectl get pods --watch`) post-deployment to ensure correct initialization.

## Challenges Faced and Solutions

1. **Configuring Replication:** Overcame challenges in configuring MySQL replication within Kubernetes by scripting initialization and data cloning steps.

2. **Storage Provisioning:** Addressed persistent storage challenges by configuring volume mounts in the StatefulSet definition.

## Testing Replication and Observations

Tested replication using `db-queries.sh` to execute SQL commands on MySQL instances and verified successful data replication.



