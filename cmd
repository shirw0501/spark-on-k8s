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


spark-submit
--deploy-mode cluster
--master k8s://https://127.0.0.1:52597 \
--conf spark.kubernetes.authenticate.driver.serviceAccountName=spark-sa
--name spark-pi
--conf spark.executor.instances=5
--conf spark.kubernetes.driver.container.image=
--conf spark.kubernetes.executor.container.image=
local:///opt/spark/examples/src/main/python/pi.py

./bin/spark-submit \
  --master <master-url> \
  --deploy-mode <deploy-mode> \
  --conf <key<=<value> \
  --driver-memory <value>g \
  --executor-memory <value>g \
  --executor-cores <number of cores>  \
  --py-files file1.py,file2.py,file3.zip, file4.egg \
  wordByExample.py [application-arguments]

spark-submit \
--master k8s://https://127.0.0.1:52597 \
--deploy-mode cluster \
--conf spark.kubernetes.namespace=spark \
  spark-example.py

docker push shirleywongclp/spark-py:v3.3.1
docker push shirleywongclp/spark-example
kubectl config view --output=jsonpath='{.clusters[].cluster.server}'
kubectl get pods -n spark
kubectl logs -n spark spark-example-py-00bea785624cb6d6-driver
