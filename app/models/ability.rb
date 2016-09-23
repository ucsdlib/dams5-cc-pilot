class Ability
  include Hydra::Ability
  
  include CurationConcerns::Ability
  self.ability_logic += [:everyone_can_create_curation_concerns]

  # Define any customized permissions here.
  def custom_permissions
    if !current_user.id.nil?
      can [:read, :create, :edit, :update, :destroy], Agent
      can [:read, :create, :edit, :update, :destroy], Concept
    else
      can [:read], Agent
      can [:read], Concept
    end
    # Limits deleting objects to a the admin user
    #
    # if current_user.admin?
    #   can [:destroy], ActiveFedora::Base
    # end

    # Limits creating new objects to a specific group
    #
    # if user_groups.include? 'special_group'
    #   can [:create], ActiveFedora::Base
    # end
  end
end
