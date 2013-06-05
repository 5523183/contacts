require 'oauth2'
require 'rubygems'
require 'active_support'

class Contacts
  class Gmail < Base
    
    DETECTED_DOMAINS = [ /gmail.com/i, /googlemail.com/i ]
    CONTACTS_SCOPE = 'http://www.google.com/m8/feeds/'
    CONTACTS_FEED = CONTACTS_SCOPE + 'contacts/default/full/?max-results=1000&alt=json'
    
    def initialize(login, password, options={})
      @client_id = options[:client_id]
      @client_secret = options[:client_secret]
      super(login,password,options)
    end

    def contacts
      return @contacts if @contacts
    end
    
    def real_connect
      cl = OAuth2::Client.new(@client_id,@client_secret)
      @client = OAuth2::AccessToken.new(cl,@password)
      @contacts = []
      feed = @client.get(CONTACTS_FEED).parsed['feed']
      if feed['entry']
        @contacts = feed['entry'].collect do |entry|
          title, email = entry['title']['$t'], nil
          primary_email = nil

          if entry['gd$email']
            entry['gd$email'].each do |e|
              if e['primary']
                primary_email = e['address'] 
              else
                email = e['address']
              end
            end
          end

          email = primary_email unless primary_email.nil?

          [title, email] unless email.nil?
        end
      end
      @contacts.compact!

    # rescue GData::Client::AuthorizationError => e
    #   raise AuthenticationError, "Username or password are incorrect"
    end
    
    private
    
    TYPES[:gmail] = Gmail
  end
end