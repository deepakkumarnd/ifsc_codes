require 'csv'

namespace :data do

  def sanitize(rec)
    rec.map do |i|
      i = i.strip.upcase unless i.nil?
      (i == 'NA') ? nil : i
    end
  end

  desc 'Load states into database'
  task :load_state_data => [:environment] do
    file = "#{Rails.root}/db/data/states.csv"
    csv  = CSV.read(file)

    csv.drop(1).each do |rec|
      name, type, code = sanitize(rec)
      state = State.create(name: name, stype: type, code: code)

      if state.new_record?
        puts "DUPLICATE_RECORD record #{rec.inspect}"
      end
    end
  end

  desc 'Load banks into database'
  task :load_banks => [:environment] do
    file = "#{Rails.root}/db/data/banks.csv"
    csv  = CSV.read(file, :encoding => 'windows-1251:utf-8')

    csv.drop(1).each do |rec|
      rec = sanitize(rec)

      bank = Bank.create(
        name: rec[1],
        nbin: rec[2],
        ifsc_prefix: rec[3],
        bank_type: rec[4],
        p2a: !!rec[5],
        default_ifsc: rec[6]
      )

      if bank.new_record?
        puts "DUPLICATE_RECORD #{rec.inspect}"
      end
    end
  end
end