json.extract! bank, :id, :name, :nbin, :ifsc_prefix, :bank_type, :p2a, :default_ifsc, :created_at, :updated_at
json.url bank_url(bank, format: :json)