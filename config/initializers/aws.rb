Aws.use_bundled_cert!
Aws.config.update(region: ENV['AWS_REGION'])
s3 = Aws::S3::Resource.new
S3_BUCKET = s3.bucket(ENV['BUCKET_NAME'])
