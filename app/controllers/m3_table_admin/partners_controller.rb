class M3TableAdmin::PartnersController < M3TableAdmin::ApplicationController

  before_action :set_table

  private
    def set_table
      @table = M3TableAdmin::Table.new("partners")
      @table.add_column "name", "text", {"index" => true}
      @table.add_column "address", "text", {"index" => true}
      @table.add_column "zip_code", "text", {"index" => true}
      @table.add_column "city", "text", {"index" => true}
      @table.add_country_column "country", {"index" => true}
      @table.add_column "attention_to", "text", {"index" => true}
      @table.sort_type = "id DESC"
    end
end
