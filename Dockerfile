# Använd den senaste versionen av MongoDB-bilden från Docker Hub
FROM mongo:latest

# Kopiera init-mongo.sh-skriptet från din bygdmiljö till bilden
COPY init-mongo.sh /init-mongo.sh

# Ange kommandot som ska köras när containern startar
CMD [ "/init-mongo.sh" ]
