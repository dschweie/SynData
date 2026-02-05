import pandas as pd
import random
import pathlib

class Person(object):
    CLASS_PATH = pathlib.Path(__file__).parent.resolve()

    @staticmethod 
    def get_name(item_data: dict):
        first_name = Person.get_first_name(item_data)
        last_name = Person.get_last_name(item_data)
        return f"{first_name} {last_name}"

    @staticmethod
    def get_first_name(item_data: dict):
        data = pd.read_csv(f"{Person.CLASS_PATH}/data/first_names.csv", sep=',', header=0, index_col="idx")
        match item_data.get("sex"):
            case "f":
                data = data.query('sex == "female"')
            case "m":
                data = data.query('sex == "male"')
        # According to internet research, around 35% to 40% of people in Germany 
        # have two first names. The first names are usually separated by a 
        # space, and only a small proportion use a hyphen.
        marker = random.randrange(0, 100)
        if(marker < 8):
            # In 8% of cases, two first names are connected with a hyphen. 
            first_first_name = data.iat[random.randrange(0, data.shape[0]), 0]
            second_first_name = data.iat[random.randrange(0, data.shape[0]), 0]
            return f"{first_first_name}-{second_first_name}"
        elif(marker < 35):
            # In 23% of cases, two first names are used without a hyphen. 
            # The lower percentage was deliberately chosen, as often only one 
            # first name is used as a given name.
            first_first_name = data.iat[random.randrange(0, data.shape[0]), 0]
            second_first_name = data.iat[random.randrange(0, data.shape[0]), 0]
            return f"{first_first_name} {second_first_name}"
        else: 
            return data.iat[random.randrange(0, data.shape[0]), 0]
    
    @staticmethod 
    def get_last_name(item_data: dict):
        data = pd.read_csv(f"{Person.CLASS_PATH}/data/last_names.csv", sep=',', header=0, index_col="idx")
        # According to internet research, 7% of women and 2% of men in Germany 
        # have a double surname. A double surname consists of two surnames 
        # separated by a hyphen. Under new family law, children as well as 
        # spouses can take double surnames.
        #
        # For reasons of simplification, double surnames are formed in 4% of 
        # cases.
        marker = random.randrange(0, 100)
        if(marker < 4):
            first_last_name = data.iat[random.randrange(0, data.shape[0]), 0]
            while (-1 < first_last_name.find(" ")):
                first_last_name = data.iat[random.randrange(0, data.shape[0]), 0]
            second_last_name = data.iat[random.randrange(0, data.shape[0]), 0]
            while (-1 < second_last_name.find(" ")):
                second_last_name = data.iat[random.randrange(0, data.shape[0]), 0]
            return f"{first_last_name}-{second_last_name}"
        else: 
            return data.iat[random.randrange(0, data.shape[0]), 0]
