class Api::V1::MessagesController < ApplicationController
  before_action :set_channel

  def index
    messages = @channel.messages.order('created_at ASC')
    render json: messages
  end

  def create
    message = Message.create(
      content: params[:content],
      channel_id: @channel.id,
      user_id: current_user.id,
      author: current_user.email
    )
    render json: message # see Message.as_json method
  end

  private

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
end
