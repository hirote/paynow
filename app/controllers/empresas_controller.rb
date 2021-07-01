class EmpresasController<ApplicationController

	def index
		@empresas=Empresa.all
	end

	def show
		@empresa = Empresa.find(params[:id])
	end

end