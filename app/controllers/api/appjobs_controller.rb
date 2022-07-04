class Api::V1::AppjobsController < ApplicationController
    def create
      if can?:create,@appjob
         getid=SessionsController.new
         getid.send(:get_id)
         @appjob=Appjob.new(appjob_params)
         @appjob.id=getid
         if @appjob.save
             json_response "Applied Successfuly", true,{appjob: @appjob}, :ok
         else
             json_response "Not Added ", false,{}, :unprocessable_entity
         end
      end 
    end
      def show_user
        getid=SessionsController.new
        getid.send(:get_id)
        @appjob=Appjob.find(:get_id)
         json_response "Jobs application", true,{job: @job}, :ok
      end



      def show_admin
        c=Appjob.count()
        for i in 1..c do
            @appjob=AppJob.find(c)
            json_response c, true,{appjob: @appjob}, :ok
            @appjob.seen=0;
         end
      end



    private
    def appjob_params
        params.require(:appjob).permit(:title)
    end
end
