class ConsultaController < ApplicationController
  before_action :set_consulta, only: %i[ show update destroy ]

  # GET /consulta
  def index
    @consulta = Consulta.all

    render json: @consulta
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
    @consulta.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consulta
      @consulta = Consulta.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consulta_params
      params.require(:consulta).permit(:paciente_id, :medico_id, :data)
    end
end
