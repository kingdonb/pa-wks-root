This repo points at other repositories which are related container images, built using the Makefile included in this directory.

You are on the master branch of `git@github.com:kingdonb/pa-wks-root.git`.

This is a map to the child repos and instruction for how to prepare for the `make build` (first run `make clone`):

The images are tagged for push to a local/private repo, for use in CI or with local or air-gapped testing environments.  The registry is expected to be hosted at localhost:5000 on your workstation, and is addressed from within Docker or Footloose by the bridge IP of the private registry container. Typing `make build push` will build and push images called:

```
localhost:5000/personnel-actions:latest
localhost:5000/finance-api:latest
localhost:5000/hrpy-api:latest
localhost:5000/person-api:latest
localhost:5000/faculty-api:latest
```

You should update REGISTRY_IP and/or REGISTRY_PORT in the Makefile to reflect correct information regarding how the registry is addressed from inside of your cluster before running `make manifest`, which outputs deployments and services for the apps above into a constellation. The deployments will be created in the `pa-kingdonb` namespace, and are configured so that the frontend can discover APIs normally through their service objects.

```
kubectl apply -f pa-constellation.yaml
```
