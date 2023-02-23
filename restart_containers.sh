#!/bin/bash
docker stop applicants.api service-api-identity service-api-jobs

sleep 10

docker start applicants.api service-api-identity service-api-jobs

sleep 10

docker stop web_container sqlServer_container

sleep 20

docker start sqlServer_container

sleep 10

docker start web_container