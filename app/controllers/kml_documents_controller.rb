class KmlDocumentsController < ApplicationController
  def index
    @kml_documents = KmlDocument.all
  end

  def new
    @kml_document = KmlDocument.new
  end

  def create
    geojson = params.dig(:kml_document, :geojson)

    if geojson.present?
      KmlDocument.create_from_geojson(geojson)
      redirect_to(kml_documents_path)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @kml_document = KmlDocument.find_by(id: params[:id])
  end

  def show
    @kml_document = KmlDocument.find_by(id: params[:id])
  end
end
