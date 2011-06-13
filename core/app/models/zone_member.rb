class ZoneMember < ActiveRecord::Base
  belongs_to :zone
  belongs_to :zoneable, :polymorphic => true

  def name
    zoneable.try(:name)
  end
end
