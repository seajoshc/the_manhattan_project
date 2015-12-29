#
# Base image
#
FROM rails:onbuild

#
# Environment variables
#
ENV RAILS_ENV docker_dev
ENV AWS_ACCESS_KEY_ID your_key_id
ENV AWS_REGION us-east-1
ENV AWS_SECRET_ACCESS_KEY your_secret_key
ENV BUCKET_NAME your_bucket
ENV CF_URL http://localhost:3000
ENV ELASTICACHE your_elasticache_cluster
ENV RDS_DB_NAME your_database
ENV RDS_HOSTNAME your_rds_instance
ENV RDS_PASSWORD your_password
ENV RDS_PORT 3306
ENV RDS_USERNAME your_username
ENV S3_CF_URL your_s3_cf_url
ENV SECRET_KEY_BASE your_secret
