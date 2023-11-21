class MedicosController < ApplicationController
  include Pagy::Backend
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  
  before_action :set_medico, only: [:show, :update, :destroy]
  before_action :load_medicos, only: [:index, :search]
  

  # GET /medicos
  def index
    begin
      pagy, @medicos = pagy(Medico.order(:id), items: 20)
      render json: @medicos
    rescue Pagy::OverflowError
      render json: { error: "A página procurada não existe." }, status: :not_found
    end
  end

  # GET /medicos/1
  def show
    render json: @medico
  end

  # POST /medicos
  def create
    @medico = Medico.new(medico_params)

    if @medico.save
      render json: @medico, status: :created, location: @medico
    else
      render json: @medico.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medicos/1
  def update
    if @medico.update(medico_params)
      render json: @medico
    else
      render json: @medico.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medicos/1
  def destroy
    @medico.destroy
    render json: {message: 'Registro deletado com sucesso'}
  end

  def search
    if params[:especialidade].present? && params[:nome].present?
      @medicos = Medico.search_by_especialidade(params[:especialidade])
                      .search_by_nome(params[:nome])
    elsif params[:especialidade].present?
      @medicos = Medico.search_by_especialidade(params[:especialidade])
    elsif params[:nome].present?
      @medicos = Medico.search_by_nome(params[:nome])
    else
      render json: { error: 'Especialidade ou nome não fornecidos' }, status: :unprocessable_entity
      return
    end

    render json: @medicos
  end


  private
  
    def set_medico
      @medico = Medico.find_by(id: params[:id])
      unless @medico
        render json: { error: 'Registro não encontrado' }, status: :not_found
      end
    end

    def load_medicos
      @medicos = Medico.all
    end

    # Only allow a list of trusted parameters through.
    def medico_params
      params.require(:medico).permit(:nome, :especialidade, :email, :telefone, :crm, :endereco)
    end
end
