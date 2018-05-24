require 'bundler'
Bundler.require


Dotenv.load

targetchannel = "omhouse_server_info"

bot = Discordrb::Bot.new (
    {
        :token => ENV["DISCORD_TOKEN"],
        :client_id => ENV["DISCORD_CLIENT_ID"]
    }
)

bot.run :async

# チャンネル情報を取得
ch_id = bot.find_channel(targetchannel).first

if ch_id != nil then
    dfresult = `df -h`
    bot.send_message(ch_id, "今日のサーバ容量をお知らせするでブラウニー！")
    bot.send_message(ch_id, dfresult)
    bot.send_message(ch_id, "以上だブラウニー！")
end


bot.stop
