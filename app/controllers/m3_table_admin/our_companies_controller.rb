class M3TableAdmin::OurCompaniesController < M3TableAdmin::ApplicationController
  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("our_companies")
      @table.add_column("name", "text", {"index" => true})
      @table.add_column("reference_number", "text")
      @table.add_column("address", "text", {"index" => false})
      @table.add_column("zip_code", "text", {"index" => false})
      @table.add_column("city", "text", {"index" => false})
      @table.add_column("country", "text", {"index" => false})
      @table.add_column("trr", "text", {"index" => false})
      @table.add_column("registration_number", "text")
      @table.add_column("vat_number", "text")
      @table.add_column("bank", "text", {"index" => false})
      @table.add_column("swift_bic_code", "text", {"index" => false})
      @table.add_column("contact_name", "text", {"index" => false})
      @table.add_column("contact_phone", "text", {"index" => false})
      @table.add_column("contact_email", "text", {"index" => false})
    end
end
