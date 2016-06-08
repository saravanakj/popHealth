module HealthDataStandards
  module CQM
    class MeasureSerializer < ActiveModel::Serializer
      attributes :_id, :name, :category, :hqmf_id, :type, :sub_id, :subtitle, :lower_is_better, :cms_id, :description
    end
  end
end
