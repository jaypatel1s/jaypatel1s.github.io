class UserMailer < ApplicationMailer

    def welcome_email
        @user = User.first
        @url ="http://127.0.0.1:3000/login"
        mail(to: @user.email, subject: 'Welcome to Zay E-commerce')
    end
end
