class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :timezone, :current, :hourly, :daily
end
