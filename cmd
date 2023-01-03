docker build -t shirleywongclp/spark-example .
docker push shirleywongclp/spark-example


spark-submit \
--master k8s://https://127.0.0.1:52597 \
--deploy-mode cluster \
--conf spark.kubernetes.driver.container.image=shirleywongclp/spark-example:latest \
--conf spark.kubernetes.executor.container.image=shirleywongclp/spark-example:latest \
--conf spark.kubernetes.namespace=spark \
--conf spark.kubernetes.authenticate.driver.serviceAccountName=spark-service-account \
local:///opt/application/spark-example.py


