REGISTRY_IP=172.25.0.2
REGISTRY_PORT=5000

.PHONY: all build push clone personnel-actions finance-api hrpy-api person-api faculty-api
.PHONY: manifest

all:  build push

clone:
	git clone git@bitbucket.org:nd-oit/personnel-actions.git \
    -b dockerfile             personnel-actions;
	git clone git@bitbucket.org:nd-oit/nd_finance_api_internal.git \
    -b finance-api-dockerfile finance-api;
	git clone git@bitbucket.org:nd-oit/nd_hrpy_api_internal.git \
    -b hrpy-dockerfile        hrpy-api;
	git clone git@bitbucket.org:nd-oit/nd-person-api-ws.git \
    -b person-api-dockerfile  person-api;
	git clone git@bitbucket.org:nd-oit/nd-faculty-api-ws.git \
    -b faculty-api-dockerfile faculty-api;

build: personnel-actions finance-api hrpy-api person-api faculty-api

personnel-actions:
	docker build personnel-actions -t localhost:5000/personnel-actions:latest
finance-api:
	docker build finance-api -t localhost:5000/finance-api:latest
hrpy-api:
	docker build hrpy-api -t localhost:5000/hrpy-api:latest
person-api:
	docker build person-api -t localhost:5000/person-api:latest
faculty-api:
	docker build faculty-api -t localhost:5000/faculty-api:latest

push:
	docker push localhost:5000/personnel-actions:latest
	docker push localhost:5000/finance-api:latest
	docker push localhost:5000/hrpy-api:latest
	docker push localhost:5000/person-api:latest
	docker push localhost:5000/faculty-api:latest

manifest:
	echo "TODO"
