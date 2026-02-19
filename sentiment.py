import os
import csv
import re


from nltk.sentiment.vader import SentimentIntensityAnalyzer

# Load in documents
base_path = r"../Data_SM_Analysis"

kind = ["/Comments", "/Submissions"]

subreddits = ["/R_christianity", "/R_politics", "/R_worldnews"]

keyword = ["/Latter_Day_Saints", "/Mormons"]


sentiment = {}


def get_permalink(post):
    link = "¦".join(post)
    for i in po:
        if i.startswith("https://www.reddit.com/r/"):
            link = i
    return link

for k in kind:
    path = base_path + k
    for s in subreddits:
        path_2 = path + s
        for word in keyword:
            path_3 = path_2 + word
            print(path_3)

            for filename in os.listdir(path_3):
                f = os.path.join(path_3, filename)
                if os.path.isfile(f) and not "_filtered-out_matches" in f:
                    match = re.search(r'_(.*?)\.', filename)
                    month = match.group(1)
                    with open (f, "r", encoding = "utf-8") as csv_file:
                        posts = csv.reader(csv_file, delimiter = ";")

                        #print(type(posts))



                        print(posts)
                        #print(row)

                        # make BACCCCCCCCCKK
                        #for piep in posts:
                            #print(piep)
                        #csv_file.seek(0)

                        row_count = sum(1 for row in posts)
                        print(row_count)
                        if row_count < 2:
                            sentiment[f"{k}, {s}, {word}, {month}"] = "No posts available"
                            print(sentiment)


                        else:

                            csv_file.seek(0)
                            next(posts, None)
                            sent_obj = SentimentIntensityAnalyzer()
                            sent_list = []
                            print(type(posts))

                            exist = []
                            # go through posts and also check if there are doubles with timestamp
                            for po in posts:

                                print(po)
                                text = po[0]

                                pattern = re.compile(r'[^,]')
                                if bool(pattern.search(text)):
                                    link = get_permalink(po)
                                    if link not in exist:
                                        exist.append(link)
                                        sent_dic = sent_obj.polarity_scores(text)
                                        sent_list.append(sent_dic["compound"])
                                    #exist.append(po[7])
                            avg_sent_month = sum(sent_list) / len(sent_list)
                            sentiment[f"{k}, {s}, {word}, {month}, {len(sent_list)}"] = avg_sent_month
                            print(sentiment)




                        #print(len(posts))
                        #for row in posts:
                            #print(row)
                    #----
                        #lines = lines.remove(line) for line in lines if csv treade

                    # sentiment add
                    # kind : {}
print(sentiment)
