class PaisesController < ApplicationController
   def index
      @countries = CompanyRecord.joins(:country).select("company_records.country_id, countries.country_name, countries.id").group("company_records.country_id, countries.country_name, countries.id").order("countries.country_name")
   end
   def ingreso
      @income = ViewIncomeCountry.all 
      @activities = Activity.all
   end

   def ganancia
      @profit = ViewProfitCountry.all 
   end

   def activo
      @asset = ViewAssetCountry.all 
   end

   def empleo
      @employment = ViewEmploymentCountry.all 
   end

   def empresas
      @empresas = ViewEmpresasCountry.all 
   end

   def pais
      @country = Country.find(params[:id])
      @countries = CompanyRecord.joins(:country).select("countries.id, countries.country_name, company_records.year_report, SUM(company_records.income) AS income, SUM(company_records.profit) AS profit, SUM(company_records.asset) AS asset, SUM(company_records.employment) AS employment, COUNT(company_records.employment) AS empresas").where("countries.id =?", params[:id]).group("countries.id, countries.country_name, company_records.year_report").order("company_records.year_report")    
   end
   def ingreso_actividad
      @income = ViewIncomeCountry.all 
      @activities = Activity.all
   end
end
