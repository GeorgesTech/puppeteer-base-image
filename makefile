.PHONY: build test

build-onbuild: ## make build
	docker build --no-cache -f onbuild.Dockerfile -t ghcr.io/georgestech/puppeteer .

build-downstream-onbuild: ## make build-downstream-onbuild
	docker build --no-cache -f onbuild.downstream.Dockerfile -t ghcr.io/georgestech/puppeteer-downstream .

build-multistage:
	docker build --no-cache -f multistage.Dockerfile -t ghcr.io/georgestech/puppeteer .

build-downstream-multistage:
	docker build --no-cache -f multistage.downstream.Dockerfile -t ghcr.io/georgestech/puppeteer-downstream .

test: ## make test
	docker run --name test-puppeteer --rm -it -v ${PWD}/test:/opt/test ghcr.io/georgestech/puppeteer npm install && npm test

test-downstream: ## make test-downstream
	docker run --name test-puppeteer-downstream --rm -it -v ${PWD}/test:/app/test ghcr.io/georgestech/puppeteer-downstream npm test
