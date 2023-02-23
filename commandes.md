# ##############
# docker build #
# ##############

cd Database/
docker build -t image_database -f Dockerfile .

# -----------------

docker build -t image_applicants_api -f Services/Applicants.Api/Dockerfile .

# -----------------

docker build -t image_job_api -f Services/Jobs.Api/Dockerfile .

# -----------------

docker build -t image_identity_api -f Services/Identity.Api/Dockerfile .

# ###################
# Docker tag & push #
# ###################

docker tag image_applicants_api:latest 030396/applicants-api:v1
docker push 030396/applicants-api:v1

# -----------------

docker tag image_job_api:latest 030396/job-api:v1
docker push 030396/job-api:v1

# -----------------

docker tag image_identity_api:latest 030396/identity-api:v1
docker push 030396/identity-api:v1

# ########################
# procedure de lancement #
# ########################

- les 3 services d'API vont exit, il faut les relancer avec la commande
docker stop applicants.api service-api-identity service-api-jobs
docker start applicants.api service-api-identity service-api-jobs

- ensuite il faut arreter le container < WEB > et < sql.dat >
docker stop web mssql-linux

- damarrer le container < sql.data > 
docker start mssql-linux

- damarrer le container < web > 
docker start web

- l'application est lancé < youpiii >