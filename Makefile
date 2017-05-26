IMAGE := wpengine/newrelic-daemon

build:
	docker build -t $(IMAGE) .

run:
	docker run -it $(IMAGE)
