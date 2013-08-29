module AccessHelper
  include AuthHelper
  def searcher_has_access?(sought)
    if searcher_signed_in?
      Access.find_by_user_id(sought.user.id) == Access.find_by_searcher_id(current_searcher.id)
    end
  end
end
