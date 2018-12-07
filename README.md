# TRIED TO ADD THIS FORM

#<OmniAuth::AuthHash credentials=#<OmniAuth::AuthHash expires=false token="4026b1ec0c901810d43377fd6f5304759b40d5ee"> extra=#<OmniAuth::AuthHash all_emails=#<Hashie::Array [#<OmniAuth::AuthHash email="ruth.mesfun@gmail.com" primary=true verified=true visibility="public">]> raw_info=#<OmniAuth::AuthHash avatar_url="https://avatars1.githubusercontent.com/u/11494166?v=4" bio=nil blog="" company=nil created_at="2015-03-16T01:25:56Z" email=nil events_url="https://api.github.com/users/ruthmesfun/events{/privacy}" followers=3 followers_url="https://api.github.com/users/ruthmesfun/followers" following=0 following_url="https://api.github.com/users/ruthmesfun/following{/other_user}" gists_url="https://api.github.com/users/ruthmesfun/gists{/gist_id}" gravatar_id="" hireable=nil html_url="https://github.com/ruthmesfun" id=11494166 location=nil login="ruthmesfun" name="Ruth Mesfun" node_id="MDQ6VXNlcjExNDk0MTY2" organizations_url="https://api.github.com/users/ruthmesfun/orgs" public_gists=0 public_repos=419 received_events_url="https://api.github.com/users/ruthmesfun/received_events"repos_url="https://api.github.com/users/ruthmesfun/repos" site_admin=false starred_url="https://api.github.com/users/ruthmesfun/starred{/owner}{/repo}" subscriptions_url="https://api.github.com/users/ruthmesfun/subscriptions" type="User" updated_at="2018-10-29T17:57:39Z" url="https://api.github.com/users/ruthmesfun">>info=#<OmniAuth::AuthHash::InfoHash email="ruth.mesfun@gmail.com" image="https://avatars1.githubusercontent.com/u/11494166?v=4"name="Ruth Mesfun" nickname="ruthmesfun" urls=#<OmniAuth::AuthHash Blog="" GitHub="https://github.com/ruthmesfun">> provider="github" uid="11494166">


email = request.env["omniauth.auth"].extra.all_emails[0].email
image = request.env["omniauth.auth"].extra.raw_info.avatar_url
name = request.env["omniauth.auth"].extra.raw_info.name



