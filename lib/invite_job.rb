class InviteJob < Struct.new(:from, :recipients, :message, :referer_id, :referer_name)
  def perform
    recipients.each do |rp|
      Mailer.invite_email(from, rp, message, referer_id, referer_name).deliver
    end
  end
end
