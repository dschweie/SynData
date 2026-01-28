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
                #data = data[data["sex"] == 'female']
                data = data.query('sex == "female"')
            case "m":
                #data = data[data["sex"] == 'female']
                data = data.query('sex == "male"')
        return data.iat[random.randrange(0, data.shape[0]), 0]
    
    @staticmethod 
    def get_last_name(item_data: dict):
        data = pd.read_csv(f"{Person.CLASS_PATH}/data/last_names.csv", sep=',', header=0, index_col="idx")
        return data.iat[random.randrange(0, data.shape[0]), 0]
