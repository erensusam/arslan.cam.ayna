import urllib.request
import re

def get_images(url):
    req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
    try:
        html = urllib.request.urlopen(req).read().decode('utf-8')
        urls = set(re.findall(r'https://lh3\.googleusercontent\.com/[^\s"\'\)\\]+', html))
        for u in urls:
            print(u)
    except Exception as e:
        print(f"Error: {e}")

print("URUN KATALOGU:")
get_images("https://contribution.usercontent.google.com/download?c=CgthaWRhX2NvZGVmeBJ7Eh1hcHBfY29tcGFuaW9uX2dlbmVyYXRlZF9maWxlcxpaCiVodG1sX2MwZDE4OGU2MjM1ZTQ4YTZhZGJlOWMzMzJiY2ExMDg0EgsSBxDlzMCI8hwYAZIBIwoKcHJvamVjdF9pZBIVQhM3NDI3NzA4MDQxMTkzNjAwMzA3&filename=&opi=89354086")
