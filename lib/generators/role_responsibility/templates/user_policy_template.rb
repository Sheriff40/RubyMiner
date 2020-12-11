class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  # Method to check if the roles that are assigned to a user,
  # is given access to peform the action in the request parameter of the model
  def user_access?
    @user_access = false

    user_roles = @user.roles

    # If user has no roles, then return false
    if !user_roles.nil?

      # Loop to give access to the user if at least on rule allows the user to perform the action
      user_roles.each do |role|
        role_rule = role.role_and_responsibility.role_rule

        # If the rules are not specified for a user's role, do not authorize them.
        if !role_rule.nil?
          if !eval(role_rule)[@record[:controller].titleize].nil?
            # Break if at least on rule allows the user to perform the action
            access = eval(role_rule)[@record[:controller].titleize][@record[:action]]
            if access.nil?
              return false
            elsif access == "true"
              @user_access = true
              break
            end
          end
        end
      end
    end

    return @user_access
  end

end
