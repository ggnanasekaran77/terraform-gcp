## Automating Deployments

```shell
gcloud services enable sourcerepo.googleapis.com cloudbuild.googleapis.com iam.googleapis.com
gsutil mb gs://automating-d-271-510d989f
gcloud source repos create ci-app
gcloud source repos clone ci-app
```

```shell
cd ci-app
mkdir -p modules/web
cd modules/web
wget https://raw.githubusercontent.com/linuxacademy/content-advanced-terraform-with-gcp/main/automation_lab/main.tf
wget https://raw.githubusercontent.com/linuxacademy/content-advanced-terraform-with-gcp/main/automation_lab/index.html
cd ../..
wget https://raw.githubusercontent.com/linuxacademy/content-advanced-terraform-with-gcp/main/automation_lab/cloudbuild.yaml
git add --a && git commit -m 'added module code'
git push --set-upstream origin dev
```