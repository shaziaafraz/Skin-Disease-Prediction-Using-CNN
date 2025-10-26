#!/bin/bash

# Skin Disease Prediction App Deployment Script

set -e

echo "🚀 Starting deployment process..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    print_error "Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if docker-compose is installed
if ! command -v docker-compose &> /dev/null; then
    print_error "docker-compose is not installed. Please install docker-compose first."
    exit 1
fi

# Create necessary directories
print_status "Creating necessary directories..."
mkdir -p staticfiles media ssl logs

# Copy environment file if it doesn't exist
if [ ! -f .env ]; then
    print_warning ".env file not found. Copying from .env.example..."
    cp .env.example .env
    print_warning "Please edit .env file with your production settings before running this script again."
    exit 1
fi

# Stop existing containers
print_status "Stopping existing containers..."
docker-compose down

# Build and start containers
print_status "Building and starting containers..."
docker-compose build --no-cache
docker-compose up -d

# Wait for database to be ready
print_status "Waiting for database to be ready..."
sleep 30

# Run database migrations
print_status "Running database migrations..."
docker-compose exec web python manage.py migrate

# Collect static files
print_status "Collecting static files..."
docker-compose exec web python manage.py collectstatic --noinput

# Create superuser (optional)
read -p "Do you want to create a Django superuser? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_status "Creating Django superuser..."
    docker-compose exec web python manage.py createsuperuser
fi

# Run health check
print_status "Running health check..."
sleep 10
if curl -f http://localhost:8000 > /dev/null 2>&1; then
    print_status "✅ Deployment successful! Application is running at http://localhost:8000"
else
    print_error "❌ Health check failed. Please check the logs."
    docker-compose logs
    exit 1
fi

print_status "🎉 Deployment completed successfully!"
print_status "Useful commands:"
echo "  - View logs: docker-compose logs -f"
echo "  - Stop application: docker-compose down"
echo "  - Restart application: docker-compose restart"
echo "  - Access Django shell: docker-compose exec web python manage.py shell"
