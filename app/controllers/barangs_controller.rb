class BarangsController < InheritedResources::Base

  before_action :authenticate_staff!
  def index
    @listbarang = Barang.search(params[:search])
  end

  # GET /barangs/1 or /barangs/1.json
  def show
  end

  # GET /barangs/new
  def new
    @barang = Barang.new
  end

  # GET /barangs/1/edit
  def edit
  end

  # POST /barangs or /barangs.json
  def create
    @barang = Barang.new(barang_params)

    respond_to do |format|
      if @barang.save
        puts "ini dari controller!!!!!!!!!!!!!!!!!!!!"
        format.html { redirect_to '/transaksis', notice: "Warung was successfully created." }
        format.json { render :show, status: :created, location: @barang }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @barang.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def barang_params
      params.require(:barang).permit(:kode_barang, :nama_barang)
    end

end
