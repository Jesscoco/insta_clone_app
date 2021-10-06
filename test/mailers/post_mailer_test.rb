require 'test_helper'

class PostMailerTest < ActionMailer::TestCase
  test "post_mail" do
    mail = PostMailer.post_mail
    assert_equal "Post mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
