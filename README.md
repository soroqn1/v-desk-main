# v-desk-main

![Docker](https://img.shields.io/badge/docker-%23007ACC.svg?style=for-the-badge&logo=docker&logoColor=white)
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)
![React](https://img.shields.io/badge/react-%2320232a.svg?style=for-the-badge&logo=react&logoColor=%2361DAFB)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white)

---

### 📦 Ecosystem Overview

This monorepo acts as the central hub for the Virtual Front Desk application. It coordinates separate services into a single, unified development environment.

- **[🎨 V-Desk Web](https://github.com/soroqn1/v-desk-web.git):** Modern React + Tailwind CSS interface.
- **[⚙️ V-Desk API](https://github.com/soroqn1/v-desk-api.git):** Node.js + Express + Sequelize backend service.
- **[🗄️ Database Service]:** MySQL instance for persistent storage.

---

### 🚀 Launch Instructions

Follow these steps to raise the entire infrastructure on your machine:

#### 1. Prepare the Workspace
First, ensure you have the latest code for both services by running the automation script:
```bash
chmod +x setup.sh
./setup.sh
```

#### 2. Start the Engines
Spin up all containers (Database, API, and Web Client) in detached mode:
```bash
docker-compose up -d --build
```

#### 3. Initialize Database (Migrations & Seeds)
Once the containers are running, synchronize the database schema and populate it with demo tasks:
```bash
# Apply migrations
docker-compose exec backend npx sequelize-cli db:migrate

# Populate with demo data
docker-compose exec backend npx sequelize-cli db:seed:all
```

---

### 🔗 Access Points
- **Frontend UI:** [http://localhost:5173](http://localhost:5173)
- **Backend API:** [http://localhost:3000/api](http://localhost:3000/api)
- **Database Port:** `3306` (Internal)

---

### 🌍 Deployment Links
*   **Production UI:** [Vercel](https://v-desk-bmtewhz7h-soroqn1s-projects.vercel.app)
*   **Production API:** [ Render](https://v-desk-api.onrender.com)

---

### 🛡️ Infrastructure Highlights
- **Service Orchestration:** Uses `docker-compose` to manage networking and service dependencies.
- **Hot-Reloading:** Both Frontend and Backend containers are configured with volumes for real-time development.
- **Isolation:** Each service runs in its own container, ensuring no version conflicts between local tools and the project.

---
