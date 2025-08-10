# MacV AI - Task Management System API

This project is a lightweight but powerful Task Management System API built as part of the software engineer assessment for MacV AI. It provides a complete backend solution for managing projects, tasks, and users, including authentication, background jobs, and email notifications.

---

## Live API

**Live Deployed URL:** `[Your Deployed URL Here - e.g., https://macv-task-manager.onrender.com]`

**API Documentation (Swagger UI):** `[Your Deployed URL Here]/docs`

**Sample Credentials:**
* **Username:** `test@example.com`
* **Password:** `testpassword`

---

## Key Features

* **Project & Task Management:** Full CRUD (Create, Read, Update, Delete) functionality for projects and tasks.
* **User Authentication:** Secure, token-based authentication using JWT.
* **Authorization:** Users can only access and manage their own projects and tasks.
* **Advanced Filtering & Sorting:** The `/tasks/` endpoint supports filtering by status, priority, due date, and project, as well as sorting.
* **Asynchronous Background Jobs:** Uses Celery and Redis to handle long-running tasks like sending emails without blocking the API.
* **Scheduled Tasks:** A daily job sends email summaries of overdue tasks to users.
* **Containerized Environment:** The entire application stack is orchestrated with Docker and Docker Compose for easy setup and consistent environments.
* **Database Migrations:** Alembic is used to manage database schema changes.

---

## Tech Stack

* **Backend:** Python, FastAPI
* **Database:** PostgreSQL
* **ORM:** SQLAlchemy
* **Background Worker:** Celery
* **Message Broker / Cache:** Redis
* **Containerization:** Docker, Docker Compose
* **Migrations:** Alembic
* **Authentication:** python-jose (JWT), passlib (hashing)

---

## Database Schema Diagram

![Database Schema](https://www.reddit.com/r/SQL/comments/1fyfes3/what_schema_image_generation_tools_exist/)

*(To create this, you can use a tool like dbdiagram.io, take a screenshot, and upload the image to your GitHub repo, then link it here.)*

---

## Getting Started (Local Setup)

To run this project on your local machine, please ensure you have Git and Docker Desktop installed.

**1. Clone the repository:**
```bash
git clone [https://github.com/your-username/macv-task-manager-api.git](https://github.com/your-username/macv-task-manager-api.git)
cd macv-task-manager-api
```

**2. Create the environment file:**
Create a file named `.env` in the root of the project and copy the contents from the provided `.env.example` file. (It's good practice to create a `.env.example` file without sensitive values). For now, just create `.env` with the content we've been using.

**3. Run the application with Docker Compose:**
This single command will build the images, create the database, run migrations, and start all the services.
```bash
docker-compose up --build
```

**4. Access the API:**
* The API will be available at `http://127.0.0.1:8000`.
* Interactive documentation (Swagger UI) is available at `http://127.0.0.1:8000/docs`.

---

## API Authentication

1.  Use the `POST /auth/register` endpoint to create a user.
2.  Use the `POST /auth/token` endpoint with your user's email and password to receive a JWT access token.
3.  On the `/docs` page, click the "Authorize" button and paste your token in the format `Bearer <YOUR_TOKEN>`.
4.  You can now access the protected endpoints.

---

## Sample API Requests (cURL)

Replace `<YOUR_TOKEN>` with the token you received from the login step.

**Create a Project:**
```bash
curl -X POST "[http://127.0.0.1:8000/projects/](http://127.0.0.1:8000/projects/)" \
-H "Authorization: Bearer <YOUR_TOKEN>" \
-H "Content-Type: application/json" \
-d '{
  "name": "New Website Launch",
  "description": "Tasks for launching the new marketing site."
}'
```

**Create a Task:**
```bash
curl -X POST "[http://127.0.0.1:8000/tasks/](http://127.0.0.1:8000/tasks/)" \
-H "Authorization: Bearer <YOUR_TOKEN>" \
-H "Content-Type: application/json" \
-d '{
  "title": "Design the homepage",
  "description": "Create mockups in Figma.",
  "priority": "high",
  "project_id": 1
}'
```