DOCKER_NAMESPACE=labasc
DOCKER_REPO=javaci-jenkins

all: build

build:
	docker build -t ${DOCKER_NAMESPACE}/${DOCKER_REPO}:latest .

tag:
	docker tag ${DOCKER_NAMESPACE}/${DOCKER_REPO} ${DOCKER_NAMESPACE}/${DOCKER_REPO}:${TAG}

push-latest:
	docker push ${DOCKER_NAMESPACE}/${DOCKER_REPO}:latest

push-tag:
	docker push ${DOCKER_NAMESPACE}/${DOCKER_REPO}:${TAG}

docker-login:
	@docker login -u "${DOCKER_ID}" -p "${DOCKER_PASS}"