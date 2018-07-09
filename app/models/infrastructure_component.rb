class InfrastructureComponent < ApplicationRecord
  validates :infrastructure, :hostname, :category, :sequence, :status, presence: true

  belongs_to :infrastructure

  enum statuses: {
    pending: 'PENDING',
    provisioning_started: 'PROVISIONING_STARTED',
    provisioning_error: 'PROVISIONING_ERROR',
    provisioning_finished: 'PROVISIONING_FINISHED',
    bootstrap_started: 'BOOTSTRAP_STARTED',
    bootstrap_error: 'BOOTSTRAP_ERROR',
    finished: 'FINISHED',
  }

  def update_status(status, message=nil)
    status = status.downcase.to_sym
    if InfrastructureComponent.statuses.key?(status)
      update_attribute(:status, InfrastructureComponent.statuses[status])
      update_attribute(:message, message || status)
    else
      false
    end
  end

  def update_ipaddress(ipaddress)
    unless ipaddress.empty?
      update_attribute(:ipaddress, ipaddress)
    else
      false
    end
  end

  def self.add(infrastructure, node, seq)
    InfrastructureComponent.create(
      infrastructure_id:  infrastructure.id,
      hostname:           node[:name] || node['name'],
      category:           node[:type] || node['type'],
      sequence:           seq,
      status:             InfrastructureComponent.statuses[:pending],
    )
  end
end
