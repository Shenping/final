class CandidatesController < ApplicationController
  
  before_action :find_candidate,only: [:show, :edit, :update, :destroy, :vote]
  #only可以改寫成except
  
  def index
    @candidates= Candidate.all
  end
  
  def show
    @candidate= Candidate.find_by(id: params[:id])
  end
  
  def vote
    log =Log.new(candidate: @candidate,ip_address: request)
    @candidate.logs << log
    @candidate.save
    @candidate.vote
  redirect_to candidates_path, notice: "done!"
  end
  
 def new
   @candidate =Candidate.new
  end
  
 def create
    @candidates=Candidate.new(candidates_params)
    if @candidates.save
      redirect_to candidates_path, notice: "新增成功"
    else
      render 'new'
      #redirect_to new_candidates_path
    end
  end
  
  def edit
  end
  
  def update
    @candidate =find_candidate()
    
    if @candidate.update(candidates_params)
      redirect_to candidates_path, notice: "更改成功"
    else
      render 'edit'
    end
  end
  
  def destroy
    @candidate.destroy
    redirect_to candidates_path, notice:"delete"
  end


    
  private
  def
    candidates_params
    params.require("candidate").permit(:name,:party,:age, :politics)
  end
  
  def find_candidate
     @candidate =Candidate.find_by(id:params[:id])
    redirect_to candidates_path, notice: "no data!" if @candidate.nil?
    @candidate
  end
  
 # add "app/views/candidates/new.html.erb"
  
end