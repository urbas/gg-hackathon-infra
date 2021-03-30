# Quick start

You should get a link like this from us: `http://<YOUR IP>:8280/?token=91532df0b01f5a4f9d13ab8497307f65848ddea419722034`

Remember `<YOUR IP>`! This will be useful later.

This page is called Jupyter Notebook. We'll just call it notebook. You can write and execute Python code in it, but you can also just take notes in it.

Alright, let's get started!

Can you spot the "New" button near the top-right? Click on it. A drop-down list will appear. Select "Python 3" from the list of choices.

Now you can already start writing Python code! Try typing in this:

```python
print("Hello World!")
```

Then press `Ctrl+Enter` and observe the magic!

This is it. You're ready to hack-a-ton!

# The Challenge!

In the mythical land of Hackathon there lives a fella called Serveros.

Serveros likes chilling on the Githubs. However, deep inside, Serveros knows he was not made for chilling but for one purpose only. And that purpose is to challenge brave Algonauts.

If you're an Algonaut and you happen upon Serveros, he'll immediately spam you with questions and start impatiently assigning points to you with an algorithmic precision and insistence.

Unfortunately, Serveros only knows how to ask questions in the HTTP language&mdash;an ancient language of the Nerdfolk.

You, Algonauts, heroes of Hackathon, have had the (mis-) fortune to stumble on the humble Serveros and it is your codely duty to answer his questions. If you prevail and place yourself above all other Algonauts, Serveros will bestow you with gifts of glory!

We wish you the best of luck and may the source be with you!

## How to start talking to Serveros?

Navigate to http://34.244.71.153/ (this is Serveros' address). Click on "I want to play!" (in the top-left corner).

Serveros will ask you for your team's name and an URL.

What's that URL? This is your address. This is where Serveros will address all questions. Serveros will send questions over to you in the HTTP language. To receive his questions, you have to create an HTTP server.

Go to your Jupyter Notebook and an type in this:
```python
from flask import Flask, request
app = Flask(__name__)

@app.route("/")
def answer():
    question = request.args.get("q", "")
    print(f"Question: {question}")
    answer = input()
    return answer

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8280)
```

This will create an HTTP server on `http://<YOUR IP>:8280`. You can give this address to Serveros and press `Submit`.

Immediately after you press `Submit`, Serveros will start sending questions to your HTTP server. Here's an example of a question sent by Serveros:
```
GET /?q=080bb5c0:%20which%20of%20the%20following%20numbers%20is%20the%20largest:%20851,%2036,%2046,%20538 HTTP/1.1
```
This translates to English: "080bb5c0: which of the following numbers is the largest: 851, 36, 46, 538"

# Pro tips

In your notebook you can press the `p` key (whenever you're not actively editing text in the notebook). This will bring up a searchable list of all available commands in Jupyter Notebook.