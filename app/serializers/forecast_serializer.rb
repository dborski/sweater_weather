class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :timezone, :hourly, :current, :daily
end
