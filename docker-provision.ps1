md tolle_puppe_docker
cd tolle_puppe_docker
func init --docker
func new --name spo-pageload-check --template HttpTrigger
docker build --tag mirontoli/puppeteer-azure-function:v1.0.1 .
docker run -p 8080:80 -it mirontoli/puppeteer-azure-function:v1.0.1
docker login --username mirontoli
docker push mirontoli/puppeteer-azure-function:v1.0.1