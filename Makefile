NAMESPACE:=workloads

.PHONY: source
source: deploy-source

.PHONY: publish
publish:
	docker push $(DOCKER_HUB_USERNAME)/python-flask-app

.PHONY: delete
delete:
	tanzu apps workload delete python-flask-app -n $(NAMESPACE) -y

.PHONY: get
get:
	tanzu apps workload get python-flask-app -n $(NAMESPACE)

.PHONY: deploy-source
deploy-source:
	tanzu apps workload apply -f config/workload.yaml -y -n $(NAMESPACE)