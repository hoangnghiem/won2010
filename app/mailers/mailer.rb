class Mailer < ActionMailer::Base

  def invite_email(from, recipient, message, referer_id, referer_name)
    regexp = Regexp.new("#{Invitation::REFER_TOKEN}")
    @message = message.gsub(regexp, refer_sign_up_url(:referer_id => referer_id))
    mail(:to => recipient,
         :from => from,
         :subject => "#{referer_name} has sent you an invitation to Online Auction")
  end
end
