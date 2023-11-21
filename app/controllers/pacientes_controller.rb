class PacientesController < ApplicationController
  include Pagy::Backend
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  
  before_action :set_paciente, only: %i[ show update destroy ]
  before_action :load_pacientes, only: [:index, :search]

  # GET /pacientes
  def index
    begin
      pagy, @pacientes = pagy(Paciente.order(:id), items: 20)
      render json: @pacientes
    rescue Pagy::OverflowError
      render json: { error: "A página procurada não existe." }, status: :not_found
    end
  end

  # GET /pacientes/1
  def show
    render json: @paciente
  end

  # POST /pacientes
  def create
    @paciente = Paciente.new(paciente_params)

    if @paciente.save
      render json: @paciente, status: :created, location: @paciente
    else
      render json: @paciente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pacientes/1
  def update
    if @paciente.update(paciente_params)
      render json: @paciente
    else
      render json: @paciente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pacientes/1
  def destroy
    @paciente.destroy
    render json: {message: 'Registro deletado com sucesso'}
  end

  def search
    if params[:nome].present?
      @pacientes = Paciente.search_by_nome(params[:nome])
      render json: @pacientes
    else
      render json: { error: 'Nome não fornecido' }, status: :unprocessable_entity
      return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      @paciente = Paciente.find_by(id: params[:id])
      unless @paciente
        render json: { error: 'Registro não encontrado' }, status: :not_found
      end
    end

    def load_pacientes
      @pacientes = Paciente.all
    end

    # Only allow a list of trusted parameters through.
    def paciente_params
      params.require(:paciente).permit(:nome, :email, :telefone, :cpf, :endereco)
    end
end
