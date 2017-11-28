class CampMailer < ApplicationMailer
  default from: 'dreams@midburn.org'
  layout 'mailer'

  def safety_comments_updated(camp, editor)
    @camp = camp
    @editor = editor
    mail(:to      => [@camp.creator.email, @editor.email].uniq!,
         :subject => t("mails.safety_comments_updated.subject") + " #{camp.name}")
  end
end
