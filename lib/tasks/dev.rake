namespace :dev do
  task :fetch_wechat => :environment do
    puts "Fetch city data..."
    response = RestClient.get "http://v.juhe.cn/weixin/query?key=07d4fd8fdf16f16f373fd7c0bc7cb582"
    data = JSON.parse(response.body)

    data["result"]["list"].each do |c|
      existing_wechat = Wechat.find_by_juhe_id( c["id"] )
      if existing_wechat.nil?
        Wechat.create!( :juhe_id => c["id"], :title => c["title"],
                      :source => c["source"], :url => c["url"] )
      end
    end

    puts "Total: #{Wechat.count} wechats"
  end
end