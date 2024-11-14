module CompaniesHelper
  def all_company_data
    Company.all.collect { |c| [c.name, c.id] }
  end
end
