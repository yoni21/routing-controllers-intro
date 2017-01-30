class PagesController < ApplicationController
    before_action :set_kitten_url, only: [:kitten, :kittens]

  def welcome
     @header = "This is the welcome page"

    render :about
  end

   def about
     @header = "10 years in business"
   end

   def kittens
     @header = "what"
     set_kitten_url
   end

   def kitten
     @header = "like this rail thing"
     set_kitten_url
   end

   def set_kitten_url
     requested_size = params[:size]
     @kitten_url = "http://lorempixel.com/#{requested_size}/#{requested_size}/cats"
   end

   def contest
     @header = "we win"
     flash[:notice] = "Sorry, the contest has ended"
     redirect_to welcome_url
   end

   def secrets
     unless params [:magic_word] == "yonas"

     flash[:notice] = "Sorry, you're not authorized to see that page!"
     redirect_to welcome_url
   end
 end
 end
