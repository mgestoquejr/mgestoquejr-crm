class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ edit update destroy ]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to root_path, notice: "Customer was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to root_path, notice: "Customer was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy!

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("customer-#{@customer.id}") }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.expect(customer: [ :first_name, :last_name, :email, :phone, :company, :stage, :probability ])
    end
end
