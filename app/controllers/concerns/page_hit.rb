module PageHit
    private
        def set_page_count
            @page_count = session[:counter].nil? ? 
                            session[:counter] = 0 : 
                            session[:counter] += 1
            # if session[:counter].nil?
            #     session[:counter] = 0
            # else
            #     session[:counter] += 1
            # end
            # @page_count = session[:counter]
        end
end