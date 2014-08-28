DOCKER_HOST=tcp://localhost:4243
HDOCKER=docker -H $(DOCKER_HOST)
DOCKER=docker

USER=lgastako
APP=webundo
DEVELOP=`pwd`

all:
	@cat Makefile

b:
	$(HDOCKER) build -t $(APP) .

i:
	$(HDOCKER) images

p:
	$(DOCKER) push $(USER)/$(APP)

r:
	@echo "Mounting $(DEVELOP) @ /develop ..."
	$(DOCKER) run -t -i -v $(DEVELOP):/develop $(USER)/$(APP) /bin/bash
