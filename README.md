# 🏛️ ABTZone - Sistema Multitenant en Ruby on Rails con Docker


ABTZone es un sistema multiorganización diseñado bajo arquitectura **multitenant** y desplegado localmente mediante contenedores Docker. Permite gestionar organizaciones, usuarios y bandejas internas, manteniendo una lógica de aislamiento y control de acceso.

## 🚀 Tecnologías utilizadas

- **Ruby on Rails 8.0**
- **PostgreSQL**
- **Docker y Docker Compose**
- **WSL2 (Ubuntu) en Windows 11**
- **Apache Benchmark (ab)** para pruebas de carga
- Autenticación Devise + Políticas de autorización Pundit

## 📦 Estructura del sistema

- **Superadmin**: Visualiza y administra todas las organizaciones y usuarios.
- **Organizaciones (tenants)**: Separación lógica por `organization_id`.
- **Usuarios**: Pueden ser _administradores_ o _miembros_ dentro de una organización.
- **Bandejas**: Área interna de mensajes o tareas personalizadas por organización.

## 🛠️ Instalación local

### 1. Clonar el repositorio

```bash
git clone https://github.com/tuusuario/abtzone.git
cd abtzone
````

### 2. Crear los contenedores

#### PostgreSQL

```bash
docker run -d \
  --name postgres-container \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=Rootalex* \
  -e POSTGRES_DB=myapp_development \
  -p 5432:5432 \
  postgres:latest
```

#### Ruby on Rails

```bash
docker run -it -d --name rails-container \
  --link postgres-container:db \
  -v $(pwd):/app -w /app \
  -p 3000:3000 ruby:latest bash
```

### 3. Configurar entorno

Dentro del contenedor `rails-container`, instalar dependencias:

```bash
gem install rails -v 8.0
bundle install
rails db:create db:migrate
```

### 4. Ejecutar la aplicación

```bash
rails server -b 0.0.0.0
```

Accede desde tu navegador en:
👉 [http://localhost:3000](http://localhost:3000)

## ✅ Funcionalidades implementadas

* Registro y autenticación de usuarios
* Creación y gestión de organizaciones
* Asignación de roles por organización
* Control de acceso con políticas
* Bandejas por tenant
* Dashboard del superadmin
* Edición de datos y recuperación de contraseña

## 📊 Resultados y rendimiento

* 15.98 solicitudes por segundo (Apache Benchmark)
* Tiempo promedio por solicitud: **62.58 ms**
* Pruebas funcionales y de aislamiento exitosas
* Arquitectura modular sin errores de arranque

## 🔐 Seguridad y privacidad

* Implementación de roles y políticas de acceso
* Aislamiento lógico mediante `organization_id`
* Cumplimiento básico de términos y política de privacidad local

## 📁 Licencia

Este proyecto se desarrolla como parte del curso de Ingeniería de Software - Universidad Católica de Colombia. Uso académico.

---
