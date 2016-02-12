module Ecm
  module Tags
    class TagSearchsController < Ecm::Tags::Configuration.base_controller.constantize
      respond_to :html, :json

      def new
        @tag_search = TagSearch.new
        @result = {}
        respond_with @tag_search do |format|
          format.html
          format.json { render json: @tag_search }
        end
      end

      def create
        @tag_search = TagSearch.new(permitted_params)
        @result = @tag_search.result
        respond_with @tag_search do |format|
          format.html { render :new }
          format.json { render json: @tag_search }
        end
      end

      private

      def new_resource_path
        url_for(action: :new)
      end

      def permitted_params
        params.require(:tag_search).permit(:tag_list, :fuzzy)
      end
    end
  end
end
