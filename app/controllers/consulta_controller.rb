class ConsultaController < ApplicationController
  include Pagy::Backend
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  before_action :set_consulta, only: %i[ show update destroy ]
  before_action :load_consultas, only: [:index, :search]

  # GET /consulta
  def index
    begin
      pagy, @consultas = pagy(Consulta.order(:id), items: 20)
      render json: @consultas
    rescue Pagy::OverflowError
      render json: { error: "A página procurada não existe." }, status: :not_found
    end
  end

  # GET /consulta/1
  def show
    render json: @consulta
  end

  # POST /consulta
  def create
    @consulta = Consulta.new(consulta_params)

    if @consulta.save
      render json: @consulta, status: :created, location: @consulta
    else
      render json: @consulta.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consulta/1
  def update
    if @consulta.update(consulta_params)
      render json: @consulta
    else
      render json: @consulta.errors, status: :unprocessable_entity
    end
  end

  # DELETE /consulta/1
  def destroy
    @consulta.destroy
    render json: {message: 'Registro deletado com sucesso'}
  end

  def search
    if params[:paciente_nome].present? && params[:medico_nome].present?
      @consultas = Consulta.search_by_paciente_nome(params[:paciente_nome])
                      .search_by_medico_nome(params[:medico_nome])
    elsif params[:paciente_nome].present?
      @consultas = Consulta.search_by_paciente_nome(params[:paciente_nome])
    elsif params[:medico_nome].present?
      @consultas = Consulta.search_by_medico_nome(params[:medico_nome])
    else
      render json: { error: 'Nome do paciente ou nome do médico não fornecidos' }, status: :unprocessable_entity
      return
    end

    render json: @consultas
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consulta
      @consulta = Consulta.find_by(id: params[:id])
      unless @consulta
        render json: { error: 'Registro não encontrado' }, status: :not_found
      end
    end

    def load_consultas
      @consultas = Consulta.all
    end

    # Only allow a list of trusted parameters through.
    def consulta_params
      params.require(:consulta).permit(:paciente_nome, :paciente_id, :medico_nome, :medico_id, :data, :medico_endereco, :especialidade)
    end
end
