class ActividadesController < ApplicationController
   def index
      @activities = Activity.all
   end

   def ingreso
      @income = ViewIncomeActivity.all 
   end

   def ganancia
      @profit = ViewProfitActivity.all 
   end

   def activo
      @asset = ViewAssetActivity.all 
   end

   def empleo
      @employment = ViewEmploymentActivity.all 
   end

  def empresas
      @empresas = ViewEmpresasActivity.all 
   end

   def actividad
      @activity = Activity.find(params[:id])
      @activities = CompanyRecord.joins(:activity).select("activities.id, activities.activity_name, company_records.year_report, SUM(company_records.income) AS income, SUM(company_records.profit) AS profit, SUM(company_records.asset) AS asset, SUM(company_records.employment) AS employment, COUNT(company_records.employment) AS empresas").where("activities.id =?", params[:id]).group("activities.id, activities.activity_name, company_records.year_report").order("company_records.year_report")
    
   end

end
