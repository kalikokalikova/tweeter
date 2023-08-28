class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def show
  end

  def new
  end

  def create
    tweet = Current.user.tweets.new(tweet_params)
    if tweet.save
      redirect_to root_path, notice: "YAAAY success"
    else
      redirect_to root_path, alert: "whoops. something went wrong"
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end
