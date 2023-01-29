class KmlDocumentsController < ApplicationController
  def index
    @kml_documents = KmlDocument.all
  end

  def new
    @kml_document = KmlDocument.new
    render :form
  end

  def create
    geojson = params[:kml_document][:geojson]
    data = JSON.parse(File.read(geojson.tempfile)).with_indifferent_access

    debugger

    @kml_document = KmlDocument.new(name: geojson.original_filename)

    if @kml_document.save
      redirect_to kml_documents_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kml_document = KmlDocument.find_by(id: params[:id])
    render :form
  end

  def show
    @kml_document = KmlDocument.find_by(id: params[:id])
  end
end
