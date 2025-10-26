# Skin Disease Detection Web Application

## Overview

The Skin Disease Detection Web Application is a machine learning-powered platform built using Django. It enables users to upload images of their skin and receive predictions about potential skin diseases. The system uses a trained deep learning model with an accuracy rate of approximately **95%** on the test dataset.

This application aims to assist users and healthcare professionals in the early identification of skin conditions, reducing the chances of delayed diagnosis and improving overall dermatological care accessibility.

## Motivation

Skin diseases are among the most common health problems worldwide, yet early and accurate diagnosis can be challenging, especially in areas with limited access to dermatologists.  
The motivation behind this project was to leverage machine learning and computer vision to create a **supportive diagnostic tool** that can provide reliable preliminary assessments.  

By integrating this AI-driven detection system into a web interface, anyone with an internet connection can upload an image and receive insights within seconds.  
This project demonstrates how artificial intelligence can make healthcare more **accessible, affordable, and efficient**.

## Benefits

- **Early Detection:** Helps identify potential skin diseases in their early stages, improving treatment outcomes.
- **Accessibility:** Provides diagnostic support in remote or underserved areas without easy access to dermatologists.
- **Time Efficiency:** Delivers quick, automated results that can guide users before seeking professional consultation.
- **Educational Use:** Can be used in healthcare education for training and awareness.
- **High Accuracy:** Achieves approximately **95% accuracy**, making it reliable for preliminary screening.

## Features

- Web interface for uploading and analyzing skin images.
- Deep learning-based disease prediction model.
- RESTful API endpoints for integration with external tools.
- Dockerized architecture for smooth deployment.
- Configurable NGINX reverse proxy for production.
- CI/CD pipeline using GitHub Actions for automated deployment.

## Project Structure

```
github_repo/
├── SkinDisease/              # Core Django project configuration
│   ├── settings.py
│   ├── urls.py
│   ├── wsgi.py
│   └── __init__.py
├── SkinDiseaseApp/           # Main Django application
│   ├── models.py
│   ├── views.py
│   ├── urls.py
│   ├── admin.py
│   ├── apps.py
│   └── tests.py
├── scripts/
│   └── deploy.sh             # Deployment script
├── requirements.txt          # Development dependencies
├── requirements-prod.txt     # Production dependencies
├── docker-compose.yml        # Multi-container setup (app + NGINX)
├── Dockerfile                # Application container configuration
├── nginx.conf                # NGINX server configuration
├── manage.py                 # Django management utility
├── start_server.py           # Application startup script
├── testtrain.py              # Model training/testing script
├── README.md                 # Project documentation
└── .github/workflows/deploy.yml  # CI/CD configuration
```

## Technologies Used

- **Backend Framework:** Django 4.x
- **Language:** Python 3.x
- **Web Server:** NGINX
- **Containerization:** Docker, Docker Compose
- **Version Control:** Git, GitHub
- **Deployment:** Render.com (recommended)
- **Machine Learning Framework:** TensorFlow / PyTorch (depending on implementation)

## Setup and Installation

### Prerequisites

Ensure the following are installed:

- Python 3.8+
- Docker and Docker Compose
- Git

### Local Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/skin-disease-detection.git
   cd skin-disease-detection
   ```

2. Create and activate a virtual environment:

   ```bash
   python -m venv venv
   source venv/bin/activate    # On Windows use: venv\Scripts\activate
   ```

3. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

4. Run migrations:

   ```bash
   python manage.py migrate
   ```

5. Start the development server:

   ```bash
   python manage.py runserver
   ```

Access the application at `http://127.0.0.1:8000/`.

### Docker Setup

1. Build and start containers:

   ```bash
   docker-compose up --build
   ```

2. Access the app at `http://localhost/`.


## Environment Variables

| Variable Name | Description | Example |
|----------------|--------------|----------|
| `SECRET_KEY` | Django secret key | `django-insecure-...` |
| `DEBUG` | Debug mode flag | `False` |
| `ALLOWED_HOSTS` | Allowed domains | `yourapp.onrender.com` |
| `DATABASE_URL` | Database connection string | `postgres://...` |

## Testing

To run the test suite:

```bash
python manage.py test
```


## Contact

**Author:** Shazia Afraz
**Email:** shaziaafraz23@gmail.com 
**GitHub:** https://github.com/shaziaafraz
