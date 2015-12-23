[ ![Codeship Status for irlrobot/the_manhattan_project](https://codeship.com/projects/caa654b0-8a32-0133-1395-125a119444d3/status?branch=master)](https://codeship.com/projects/123404)

# The Manhattan Project
Collecting the Manhattans of the world

# Required Environment Variables
* AWS_ACCESS_KEY_ID
  * AWS Credentials
* AWS_REGION
  * Region where the application resides
* AWS_SECRET_ACCESS_KEY
  * AWS Credentials
* BUCKET_NAME
  * S3 Bucket that holds images of Manhattans
* CF_URL
  * Cloudfront Distribution for the application
* ELASTICACHE
  * URL of Elasticache Cluster
* RDS_DB_NAME
  * RDS Instance Database name associated with RDS_HOSTNAME param
* RDS_HOSTNAME
  * RDS Instance hostname
* RDS_PASSWORD
  * Password for the username associated with the RDS_USERNAME param
* RDS_PORT
  * Port for RDSInstance associated with RDS_HOSTNAME param
* RDS_USERNAME
  * RDS Instance user with permissions to read and write data
* S3_CF_URL
  * Cloudfront Distribution for the S3 Bucket that holds images of Manhattans
* SECRET_KEY_BASE
  * Rails secret
