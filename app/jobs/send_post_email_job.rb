class SendPostEmailJob < ActiveJob::Base
  queue_as :default

  def perform(post, email)
    # Send email containing the post
    PostMailer.create(post, email).deliver_now
  end
end
