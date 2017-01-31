require 'csv'

namespace :data do

  def sanitize(rec)
    rec.map do |i|
      i.strip.upcase
    end
  end

  desc 'Load states into database'
  task :load_state_data => [:environment] do
    file = "#{Rails.root}/db/data/states.csv"
    csv  = CSV.read(file)

    csv.drop(1).each do |rec|
      name, type, code = sanitize(rec)
      State.create!(name: name, stype: type, code: code)
    end
  end
end