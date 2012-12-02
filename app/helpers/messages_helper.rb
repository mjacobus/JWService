module MessagesHelper
  def messages
    unless @messages_shown
      @messages_shown = true
      show_messages
    end
  end
  
  def show_messages
    unless flash.empty?
      html = ['<div class="messages">']
      
      flash.each do |type, message|
        if type.to_sym == :notice
          type = :success
        end
        
        html << "<div class='#{type}'>"
        html << "<p class='text-#{type}'>"
        html << message
        html << "</p>"
        html << "</div>"
      end
      
      html << '</div>'
      raw html.join('')
    end
  end
  
end