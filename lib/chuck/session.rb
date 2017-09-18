module Chuck
  class Session < Swift::Record
    store :sessions
    attribute :id,         Swift::Type::String,   default: proc { SecureRandom.uuid }, key: true
    attribute :created_at, Swift::Type::DateTime, default: proc { DateTime.now  }
  end
end
