[![CircleCI](https://dl.circleci.com/status-badge/img/gh/bolah2009/udacity-ml-microservice-kubernetes/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/bolah2009/udacity-ml-microservice-kubernetes/tree/master)

## Project Overview

This project is an operationalize Machine Learning Microservice API.

With a given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project demonstrates the ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls.

This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

You can find more details about this project in the [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

## Setup the Environment

- Clone this repo with the following command

```
git clone git@github.com:bolah2009/udacity-ml-microservice-kubernetes.git
```

- Create a virtualenv and activate it
- Run `python3 -m venv ~/.devops` or `make setup` to create a virtual env
- Run `source ~/.devops/bin/activate` to activate the virtual env just created
- Run `make install` to install the necessary dependencies
- Run `make lint` (pylint for python files and hadolint Dockerfile) to detect errors in the code.
- can also run `make all` instead of the previous two steps.

### Running `app.py`

1. Standalone: `python app.py`
2. Run in Docker: `./run_docker.sh`
3. Run in Kubernetes: `./run_kubernetes.sh`

### Kubernetes Steps

1. Setup and Configure Docker locally
   - install docker as described in the [link](https://docs.docker.com/engine/install/ubuntu/).
   - Run `./run_docker.sh`
   - Run `docker ps` to check if docker is running.
   - Run `./make_prediction.sh` to make a prediction.
2. Create Flask app in Container
   - Run `./run_docker.sh` to build and start the Flask app container as in the previous step.
   - Run `./upload_docker.sh` to upload the container to docker hub, an example is [this](https://hub.docker.com/repository/docker/bolah2009/udacity-ml-microservice).
3. Setup and Configure Kubernetes locally
   - Run `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`
   - Run `sudo install minikube-linux-amd64 /usr/local/bin/minikube`
   - Run `minikube start` to start minikube
   - Run `kubectl get pods` to see which pods are running.
   - Run `./run_kubernetes.sh` to pull the image from docker hub and create a pod using the pulled image.
   - Run `./make_prediction.sh` to make a prediction.

### Folder structure

```sh
.
├── .circleci
│ └── config.yml # circle ci config
├── model_data # model data
│ ├── boston_housing_prediction.joblib
│ └── housing.csv
├── output_txt_files # log output from qeuring predictions
│ ├── docker_out.txt
│ └── kubernetes_out.txt
├── .gitignore
├── Dockerfile
├── Makefile
├── README.md
├── app.py # flask app
├── make_prediction.sh # script for making prediction
├── requirements.txt # list of dependencies
├── run_docker.sh # script for running docker
├── run_kubernetes.sh # script for running kubernetes
└── upload_docker.sh # script for uploading image to docker hub
```

## 👤 Author

- Github: [@bolah2009](https://github.com/bolah2009)
- Twitter: [@bolah2009](https://twitter.com/bolah2009)
- Linkedin: [@bolah2009](https://www.linkedin.com/in/bolah2009/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](../../issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Udacity

## 📝 License

[MIT licensed](./LICENSE).
