<div align="justify">

# About this repository ℹ️
This repository is a record of my hands-on practice in learning Kubernetes, focusing on the practical aspects of Kubernetes concepts and the exercises I completed on the KodeKloud platform as part of my preparation for the Certified Kubernetes Administrator (CKA) exam. It contains code and configurations I worked through to deepen my understanding of Kubernetes operations, cluster management, and troubleshooting. This collection represents my progress and serves as a personal resource for reinforcing key skills required for the CKA certification.

<br>

# What is Kubernetes ❓
Kubernetes is an open-source platform designed to automate deploying, scaling, and operating application containers. It enables organizations to deploy, manage, and scale applications in containerized environments across clusters of machines, providing flexibility, efficiency, and resilience in managing infrastructure. Originally developed by Google, Kubernetes has become the industry standard for container orchestration.

<br>

# What is the Certified Kubernetes Administrator (CKA) 🪪
The Certified Kubernetes Administrator (CKA), provided by the Cloud Native Computing Foundation (CNCF) in collaboration with the Linux Foundation, validates an individual's skills in managing and administering Kubernetes environments. The CKA exam tests practical knowledge of key Kubernetes concepts and skills, including setting up a Kubernetes cluster, managing applications, networking, storage, and troubleshooting.

<br>

# Motivation ⚙️
I was driven by a deep interest in emerging technologies and the role they play in shaping modern infrastructure. Kubernetes quickly stood out as a foundational platform for cloud-native applications, offering the skills I needed to effectively deploy and manage scalable systems. Earning the Certified Kubernetes Administrator (CKA) certification felt like the ideal way to validate this knowledge with an industry-recognized credential. I saw it as an opportunity not just to build a solid skill set, but to prepare myself for real-world challenges in DevOps and infrastructure management, where Kubernetes plays a key role.

<br>

# Environment 👩🏻‍💻

<div align="center">
  <img src="https://img.shields.io/badge/Kode%20Kloud-252863.svg?style=flat-square&logo=data:image/png;base64,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">
</div>

<br>

# Stack 🛠️
<div align="center">
  <img src="https://img.shields.io/badge/kubernetes-326CE5?&style=flat-square&logo=kubernetes&logoColor=white">&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://img.shields.io/badge/docker-2496ED?style=flat-square&logo=docker&logoColor=white">&nbsp;&nbsp;&nbsp;&nbsp;  
  <img src="https://img.shields.io/badge/YAML-CB171E?&style=flat-square&logo=yaml&logoColor=white">&nbsp;&nbsp;&nbsp;&nbsp;
 <img src="https://img.shields.io/badge/Linux-FCC624?&style=flat-square&logo=linux&logoColor=black">&nbsp;&nbsp;&nbsp;&nbsp;
  
</div>

<br>

# Repository Structure 🌲
```bash

```


<br>

# Reflection 🪞
Learning Kubernetes has been incredibly valuable for me in terms of improving both my efficiency and problem-solving skills. The platform automates many complex tasks, like container orchestration, scaling, and load balancing, allowing me to deploy and manage applications much more smoothly. Preparing for the CKA certification has also sharpened my troubleshooting abilities, giving me confidence in handling real-world challenges such as diagnosing and resolving cluster issues. Since the CKA exam is hands-on, it's pushed me to gain practical, applicable skills that will directly benefit my work in real Kubernetes environments.


</div>


