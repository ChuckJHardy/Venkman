class V1::UserDecorator < V1::BaseDecorator
  delegate_all

  def as_json(options={})
    source.as_json(
      :only => [
        :id,
        :email,
        :authentication_token
      ]
    )
  end
end
