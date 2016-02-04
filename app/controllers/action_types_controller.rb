class ActionTypesController < InheritedResources::Base

  private

    def action_type_params
      params.require(:action_type).permit(:name, :image)
    end
end

