# creacion de la imagen 
FROM node:20.5.1-alpine3.18  
# creacion de usario en el sistema y asiganacion de grupo para el usuario 
RUN addgroup react && adduser -S -G react react
# se cambia de usuario
USER react
# selecion de la ruta 
WORKDIR /app/
RUN mkdir datos 
# hacer optimisacion de las dependencias , para no reconstruir lo mismo en las modificaciones 
COPY --chown=react package*.json .
# ejecutar comandos con argumentos 
RUN npm install 
# agregacion de los archivos es mas especificos
COPY --chown=react . .
# se crean las variables de entorno 
ENV API  https://miweb.api.com
# comando para exponer el puerto de la app
EXPOSE 5173
# comando de instruccion de correr ala aplicacion/ se hace para no consumir demasiados recursos 
CMD ["npm", "run" ,"dev"]
