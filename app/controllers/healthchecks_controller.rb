class HealthchecksController < ApplicationController
  def index
    metadata_url = 'http://169.254.169.254/latest/meta-data/instance-id'
    instance_id = `curl #{metadata_url} -m 3`
    instance_id = 'not_an_ec2_instance_bro' if instance_id.empty?
    @host = instance_id
  end
end
