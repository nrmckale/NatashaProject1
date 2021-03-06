## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](Images/ELK%20DIAGRAM.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.


This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting traffic to the network.
-  The Load Balancers protect applications from emerging threats and potential DDos attacks. They ensure that the application will be highly available as well as restricting traffic to the network. Load balancing works with the 3rd part of the CIA triad which is availability. The advantage of the Jump Box provisioner is simplification. When using the Jump Box you on have to use the .yml file to configure both Web Servers and the Elk Server.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
-  What does Filebeat watch for? Filebeat monitors the log files or locations that you specify, collects log events and forwards them either to Elasticsearch or Logstash for indexing.
-  What does Metricbeat record? Metricbeat follows closely to Filebeat but Metricbeat focuses on system and application/service metrics and statistics

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web1     | Web Server  | 10.0.0.7 | Linux        |
| Web2     | Web Server   | 10.0.0.6 |   Linux    |
| ELK Server(MooseVM)|ELK Monitoring | 10.1.0.4  |  Linux   |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
-  My Personal IP

Machines within the network can only be accessed by SSH. 
-  I allowed the Jump Box provisioner (Jump Box private IP: 10.0.0.4/Jump Box Public IP:40.121.33.252) access to my ELK VM. My ELK VM's IP is 20.65.15.117

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | Personal IP          |
| Web1     | via Load Balancer   | LB: 20.85.245.145     |
| Web2     | via Load Balancer   | LB: 20.85.245.145      |
|ELK Server| Yes                 | Personal IP JB:10.0.04 |

# Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
-  then the machine becomes less vulnerable to error if it does not need to be replicated. When the YAML config playbook is ran automatically it allows IT administrators to focus on more valuable efforts during their day. Ansible allows you to more easily maintain and reuse each playbook on different VMs.

The playbook implements the following tasks:
-  Installs docker on the machine along with setting the machine's max virtual memory
-  Installs pip for Python 3 to install Python Packages
-  Installs docker python package using pip
-  Installs the elk docker container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![](https://github.com/nrmckale/NatashaProject1/blob/main/Images/dockerps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
-  Web1: 10.0.0.7
-  Web2: 10.0.0.6

We have installed the following Beats on these machines:
-  Filebeat
-  Metricbeat

These Beats allow us to collect the following information from each machine:
-  Filebeat is often used to collect log files from very specific files, such as logs generated by Apache, Microsoft Azure tools, the Nginx web server, or MySQL databases

-  Metricbeat collects metrics from your systems and services. From CPU to memory, Redis to NGINX, it is a lightweight way to send system and service statistics.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the elk-playbook.yml file to /etc/ansible.
- Update the /etc/ansible/hosts file to include the name of the machine you are deploying to
- Run the playbook, and navigate to HTTP://ELKserver(MooseVM Public IP):5601/app/kibana to check that the installation worked as expected.



_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
