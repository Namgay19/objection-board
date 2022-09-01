class DreamAccountsQuery
  attr_reader :params, :current_user

  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def run
    dream_accounts
  end

  def dream_accounts
    @dream_accounts ||= current_user.dream_accounts
  end
end
