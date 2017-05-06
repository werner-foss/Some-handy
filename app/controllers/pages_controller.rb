class PagesController < ApplicationController
  def home
    @skills = Skill.all
  end

  def about
  end

  def contact
  end
  
  def esl_news
    @tweets = SocialTool.twitter_search
  end
end
