# GitHub Actions Runner Images by FugaCloud

[![Build image](https://github.com/FugaCloud/actions-runner-images/actions/workflows/build.yaml/badge.svg)](https://github.com/FugaCloud/actions-runner-images/actions/workflows/build.yaml)

This repository provides alternative Docker images for self-hosted GitHub Actions runners, serving as a substitute for the official images from [actions/runner-images](https://github.com/actions/runner-images). These images are designed to work seamlessly with the [Actions Runner Controller](https://github.com/actions/actions-runner-controller), including support for Runner Scale Sets as detailed in [GitHub's documentation](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/deploying-runner-scale-sets-with-actions-runner-controller).

## Table of Contents

- [Overview](#overview)
- [Features](#added-features)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Using Pre-built Images](#using-pre-built-images)
  - [Deploy with Actions Runner Controller](#deploy-with-actions-runner-controller)
- [Available Tags](#available-tags)
- [Customization](#customization)
- [Updating the Images](#updating-the-images)
- [Contributing](#contributing)

## Overview

The images provided by this repository are pre-built and available at `registry.fuga.io/public/actions-runner`. They serve as an alternative to the official GitHub Actions runner images and can be utilized in your Kubernetes clusters via the Actions Runner Controller, allowing you to manage self-hosted runners efficiently, including deploying Runner Scale Sets.

## Added features

The following tools and features are added compared to the base image:

- curl

## Prerequisites

- **Kubernetes Cluster**: A running cluster with administrative access.
- **Actions Runner Controller**: Installed in your Kubernetes cluster. [Installation Guide](https://github.com/actions/actions-runner-controller#installation)
- **GitHub Access**: Permissions to add self-hosted runners to your repository or organization.

## Getting Started

Follow these steps to deploy your custom GitHub Actions runners using the pre-built images.

### Using Pre-built Images

The pre-built runner images are hosted at `registry.fuga.io/public/actions-runner`. You can use these images directly in your Kubernetes deployments without the need to build them yourself.

Available tags:

- `registry.fuga.io/public/actions-runner:latest`
- `registry.fuga.io/public/actions-runner:2.319.1`

**Note**: The tag `2.319.1` corresponds to the GitHub Actions Runner version `2.319.1`.

### Deploy with Actions Runner Controller

#### Install Actions Runner Controller (if not already installed)

Follow the [official installation guide](https://github.com/actions/actions-runner-controller#installation) to set up the Actions Runner Controller in your Kubernetes cluster.

#### Configure RunnerDeployment or RunnerSet

Create a `RunnerDeployment` or `RunnerSet` YAML file to deploy the runners using the pre-built image.

```yaml
apiVersion: actions.summerwind.dev/v1alpha1
kind: RunnerDeployment
metadata:
  name: fugacloud-runner-deployment
spec:
  replicas: 2
  template:
    spec:
      repository: your-username/your-repo
      image: registry.fuga.io/public/actions-runner:latest
      labels:
        - custom
        - self-hosted
```

- Replace `your-username/your-repo` with your GitHub repository.
- You can specify a specific runner version by changing the image tag to `2.319.1`.

For deploying Runner Scale Sets, refer to the [GitHub documentation](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/deploying-runner-scale-sets-with-actions-runner-controller).

#### Apply the Configuration

Deploy the runners by applying the configuration file:

```bash
kubectl apply -f fugacloud-runner-deployment.yaml
```

## Available Tags

The following tags are available for the pre-built images:

- `latest`: The latest stable version of the GitHub Actions runner.
- `2.319.1`: Specific version tag corresponding to GitHub Actions runner version `2.319.1`.

You can specify the desired tag in your deployment configuration:

```yaml
spec:
  template:
    spec:
      image: registry.fuga.io/public/actions-runner:2.319.1
```

## Customization

You can customize the runner deployment configurations as needed.

### Update Runner Configuration

Modify the `RunnerDeployment` or `RunnerSet` YAML to adjust environment variables, labels, or other settings.

```yaml
env:
  - name: RUNNER_GROUP
    value: "Custom Group"
  - name: RUNNER_LABELS
    value: "custom,self-hosted"
```

## Updating the Images

The images at `registry.fuga.io/public/actions-runner` are maintained and updated regularly. To use the latest images, update the image tag in your deployment configuration.

```yaml
spec:
  template:
    spec:
      image: registry.fuga.io/public/actions-runner:latest
```

Apply the updated configuration:

```bash
kubectl apply -f fugacloud-runner-deployment.yaml
```

## Contributing

We welcome contributions! Please fork the repository and submit a pull request with your changes. For significant changes, please open an issue first to discuss your ideas.

---

*For questions or support, please open an issue in this repository.*

---

# Additional Resources

- **Official GitHub Runner Images**: [actions/runner-images](https://github.com/actions/runner-images)
- **Actions Runner Controller**: [actions/actions-runner-controller](https://github.com/actions/actions-runner-controller)
- **Deploying Runner Scale Sets**: [GitHub Documentation](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners-with-actions-runner-controller/deploying-runner-scale-sets-with-actions-runner-controller)

By leveraging the pre-built images provided at `registry.fuga.io/public/actions-runner`, you can efficiently deploy and manage your GitHub Actions runners without the need to build images yourself.

---
