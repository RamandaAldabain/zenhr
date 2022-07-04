class  Api::V1::JobsController < ApplicationController
    def index
        c=Job.count()
        for i in 1..c do
            @job=Job.find(c)
            json_response c, true,{job: @job}, :ok
         end
          
    end



    def create
     if can?:create,@job
        @job=Job.new(job_params)
        if @job.save
            json_response "Added job Successfuly", true,{job: @job}, :ok
        else
            json_response "Not Added ", false,{}, :unprocessable_entity
        end
      end
    end


    def update
     if can?:update,@job 
        @job=Job.find(id :params[:id])
        if @job.update(job_params)
       
            json_response "Updated Successfuly", true,{job: @job}, :ok
        else
            json_response "Not Updated", false,{}, :unprocessable_entity
        end
     end
    end

    def destroy
        @job=Job.find(id :params[:id])
        @job.destroy
        json_response "Destroyed", true,{}, :ok
    end

    private
    
    def job_params
        params.require(:job).permit(:title, :desc)
    end
 
    def find_job
        @job=Job.find(params[:id])
    end

end
