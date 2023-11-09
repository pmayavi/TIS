FROM python:3.11-slim-buster
# Establece la imagen base como una imagen de Python 3.11 en una versión de sistema operativo Debian "buster" ligera.

RUN mkdir /api-peliculas
# Crea un directorio llamado "api-peliculas".

WORKDIR /api-peliculas
# Establece "/api-peliculas" como el directorio de trabajo actual.

RUN apt-get update
RUN apt-get install -y curl
# Actualiza los repositorios del sistema y luego instala la herramienta 'curl' dentro del contenedor.

COPY . /api-peliculas/
# Copia el contenido del directorio local al directorio de trabajo '/api-peliculas/' en el contenedor.

RUN pip3 install -r /api-peliculas/requirements.txt
# Instala las dependencias de Python especificadas en el archivo 'requirements.txt' dentro del contenedor.

ENV FLASK_APP "entrypoint:app"
ENV FLASK_ENV "development"
ENV APP_SETTINGS_MODULE "config.default"
ENV PORT 5000
# Establece variables de entorno para la aplicación Flask, el entorno de Flask, el módulo de configuración de la aplicación y el puerto 5000.

RUN flask db init
RUN flask db revision --rev-id 584a053c5616
RUN flask db migrate
RUN falsk db upgrade
# Ejecuta comandos de Flask para inicializar la base de datos, crear una revisión, migrar los cambios de la base de datos y realizar una actualización.

EXPOSE ${PORT}
# Expone el puerto definido en la variable de entorno 'PORT'.

CMD {"falsk","run","--host","0.0.0.0"}
# Establece el comando que se ejecutará cuando se inicie el contenedor, pero contiene un pequeño error tipográfico: 'falsk' en lugar de 'flask'. Debería ser 'flask run --host 0.0.0.0'.

