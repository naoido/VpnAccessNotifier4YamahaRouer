--##  http://www.rtpro.yamaha.co.jp/RT/docs/lua/rt_api.html  ##--

--          #    Setting     #          --
PROJECT_NAME = "VPN_ACCESS_NOTIFIER"
LOG_MATCH_PATTERN = "Call detected from user"
WEBHOOK_URL = "https://discord.com/api/webhooks/XXX"
USER_NAME = "YAMAHA RTX1210"
ADMIN_DISCORD_ID = "your discord id"

--          #     Logger     #          --
local function logger(log_level, text)
    rt.syslog(log_level, "["..PROJECT_NAME.."] "..text)
end

--          #     Watcher    #          --
while(true) do
    local rtn, str = rt.syslogwatch(LOG_MATCH_PATTERN)

    if rtn and str then
        local nowTime = os.date("%y/%m/%d %H:%M:%S")
        local response = rt.httprequest({
            url = WEBHOOK_URL,
            method = "POST",
            post_text = '{"content": "<@!'..ADMIN_DISCORD_ID..'> VPNに接続がありました！`'..nowTime..'`\\n'..str[1]..'","username": "'..USER_NAME..'"}',
            content_type = "application/json"
        })
        if response.err then
            logger("info", "error response: " .. response.err)
        elseif response.code == 200 then
            logger("info", "A notification has been sent.")
        else
            logger("info", "Bad response code: " .. response.code)
        end
    end
end
