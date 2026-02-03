# import random
import datetime
import time

from robot.api.deco import keyword, library, not_keyword
from robot.libraries.BuiltIn import BuiltIn

from item_builder_engine import ItemBuilderEngine

@library(version='0.0.2')
class SynData:
    ROBOT_AUTO_KEYWORDS = False

    MODE_DEF = 0
    MODE_REP = 1

    GLOBAL      = "global"
    TEST_SUITE  = "suite"
    TEST_CASE   = "test"

    """ Hier findet sich die Dokumentation dieser Bibliothek"""

    @not_keyword
    def __init__(self, localization="en_US", logging=True, logfile=None):
        self.mode = SynData.MODE_DEF
        self.context = None
        self.data = {}
        self.default_localization = localization
        self.ibe = ItemBuilderEngine()
        self.logging = (True == logging)
        if (self.logging):
            path = BuiltIn().get_variable_value("${OUTPUT DIR}")
            if (None == logfile):
                file_name = datetime.datetime.now().strftime("SynData-%Y%m%d-%H%M%S")
                self.logfile = f"{path}/{file_name}.log"
            else:
                if (-1 == logfile.find(".")):
                    self.logfile = f"{path}/{logfile}.log"
                else:
                    self.logfile = f"{path}/{logfile}"

    @keyword
    def Set_Context(self, context, localization="en_US" ):
        if (None == self.data.get(context)):
            self.data[context] = {}
            self.data[context].update({"meta":{"localization" : localization}})
        self.context = context

    
    @keyword
    def Release_Context(self):
        self.context = None


    @keyword
    def Get_Context(self):
        return self.context
    

    @keyword
    def Get_Name(self, sex="*"):
        if ( None == self.Get_Context() ):
            localization = self.default_localization
        else:
            localization = self.data[self.Get_Context()]["meta"]["localization"]
        return self.ibe.execute(self, localization, "Get Name", "person.name", {"sex":sex})
    
    
    @keyword
    def Get_First_Name(self, sex="*"):
        if ( None == self.Get_Context() ):
            localization = self.default_localization
        else:
            localization = self.data[self.Get_Context()]["meta"]["localization"]
        return self.ibe.execute(self, localization, "Get First Name", "person.first_name", {"sex":sex})
    
    
    @keyword
    def Get_Last_Name(self, sex="*"):
        if ( None == self.Get_Context() ):
            localization = self.default_localization
        else:
            localization = self.data[self.Get_Context()]["meta"]["localization"]
        return self.ibe.execute(self, localization, "Get Last Name", "person.last_name", {"sex":sex})


    @not_keyword
    def get_mode(self):
        return self.mode
    
    @not_keyword
    def get_item(self, item):
        if ( None == self.context ):
            return None
        else: 
            return self.data[self.context].get(item)


    @not_keyword
    def add_item(self, item, value):
        if( None != self.context ):
            self.data[self.context].update({item: value})


    def add_log_entry(self, keyword, item, value):
        if ((self.logging) and (None != self.logfile)):
            ts = datetime.datetime.now().strftime("%Y-%m-%d %X") + ("-" if time.timezone > 0 else "+") + time.strftime("%H:%M", time.gmtime(abs(time.timezone)))
            suite = BuiltIn().get_variable_value("${SUITE NAME}")
            test_case = BuiltIn().get_variable_value("${TEST NAME}")
            file = open(self.logfile, "a")
            file.write(f"{ts},{suite},{test_case},{keyword},{item},{value}\n")
            file.close()


    # @not_keyword
    # def Hello_World(self):
    #     """ Bei diesem Schlüsselwort ist der Name verdächtig. ;-) Es ist das erste Schlüsselwort und
    #         kann nicht einmal "Hallo" sagen."""
    #     pass

    # @not_keyword
    # def Create_Person(self, gender="any", forenames=1, forename_hyphen=False, compound_name=False, birth_name=False):
    #     """Lorem ipsum dolor it."""
    #     person_data = {}
    #     person_data.update({"meta":{"type":"physical person", "mode":"synthetic", "category":"person"}})
    #     if (self.is_male(gender)):
    #         person_data.update({"forename" : self.get_random_male_forename(forenames, forename_hyphen)})
    #         person_data.update({"gender": "male"})
    #     elif (self.is_female(gender)):
    #         person_data.update({"forename" : self.get_random_female_forename(forenames, forename_hyphen)})
    #         person_data.update({"gender": "female"})
    #     elif (self.is_third_gender(gender)):
    #         if(0 == random.randrange(1, 1000) % 2):
    #             person_data.update({"forename": self.get_random_male_forename(forenames, forename_hyphen)})
    #         else:
    #             person_data.update({"forename": self.get_random_female_forename(forenames, forename_hyphen)})
    #         person_data.update({"gender" : "third sex"})
    #     else:
    #         if(0 == random.randrange(1, 1000) % 2):
    #             person_data.update({"forename": self.get_random_male_forename(forenames, forename_hyphen)})
    #             person_data.update({"gender": "male"})
    #         else:
    #             person_data.update({"forename": self.get_random_female_forename(forenames, forename_hyphen)})
    #             person_data.update({"gender": "female"})
    #     person_data.update({"surname" : self.get_random_surname(compound_name)})
    #     if (birth_name):
    #         if (compound_name) :
    #             person_data.update({"birthname": person_data.get("surname").split("-",1)[0]})
    #         else:
    #             person_data.update({"birthname": self.get_random_surname(False)})
    #     return person_data

    # @not_keyword
    # def Add_Address(self, person_data, country="de", postcode_min="01000", postcode_max="99999", housenumber=0, housenumber_max=99 ):
    #     """Lorem ipsum dolor it."""
    #     if self.de_locations == None:
    #         self.de_locations = utils.support_de.MailingAddressGermany()
    #     person_data = self.de_locations.add_location(person_data)
    #     return person_data

    # @not_keyword
    # def Add_Address_By_Filter(self, person_data, filter, address_attribute="address"):
    #     """Lorem ipsum dolor it."""
    #     if self.de_locations == None:
    #         self.de_locations = utils.support_de.MailingAddressGermany()
    #     retval=person_data
    #     country=str(filter.get("country", {}).get("value", "de")).lower()
    #     if (country in ["de", "germany", "deutschland"]):
    #         retval=self.de_locations.add_filtered_location(person_data, filter, address_attribute)
    #     return retval

    # @not_keyword
    # def Get_Filtered_Locations(self, filter={}):
    #     """Lorem ipsum dolor it."""
    #     if self.de_locations == None:
    #         self.de_locations = utils.support_de.MailingAddressGermany()
    #     return self.de_locations.get_locations_filtered_by_postcode(self.de_locations.cities, filter)

    # @not_keyword
    # def Add_Cellphone_Number(self, item, filter={}, information_path="communication.cellphone"):
    #     """Lorem ipsum dolor it."""
    #     if self.de_communication == None:
    #         self.de_communication = utils.support_de.TelecommunicationGermany()
    #     return self.de_communication.add_cellphone_number(item, filter, information_path)


    # @not_keyword
    # def Add_Landline_Number(self, item, filter={}, information_path="communication.landline"):
    #     """Lorem ipsum dolor it."""
    #     if self.de_communication == None:
    #         self.de_communication = utils.support_de.TelecommunicationGermany()
    #     return self.de_communication.add_landline_number(item, filter, information_path)

    # @not_keyword
    # def is_male(self, gender):
    #     """Lorem ipsum dolor it."""
    #     return gender.lower() in ["m", "mr", "male", "männlich"]

    # @not_keyword
    # def is_female(self, gender):
    #     """Lorem ipsum dolor it."""
    #     return gender.lower() in ["w", "mrs", "f", "female", "weiblich"]

    # @not_keyword
    # def is_third_gender(self, gender):
    #     """Lorem ipsum dolor it."""
    #     return gender.lower() in ["d", "mx", "third sex", "third gender", "divers"]

    # @not_keyword
    # def get_random_male_forename(self, forenames, hyphen):
    #     """Lorem ipsum dolor it."""
    #     retval = self.forenames_male[random.randrange(0,len(self.forenames_male))]
    #     for i in range(1, forenames):
    #         if (hyphen):
    #             if (i > retval.count("-")):
    #                 retval = retval + "-" + self.forenames_male[random.randrange(0,len(self.forenames_male))]
    #         else:
    #             retval = retval + " " + self.forenames_male[random.randrange(0, len(self.forenames_male))]
    #     return retval

    # @not_keyword
    # def get_random_female_forename(self, forenames, hyphen):
    #     """Lorem ipsum dolor it."""
    #     retval = self.forenames_female[random.randrange(0,len(self.forenames_female))]
    #     for i in range(1, forenames):
    #         if (hyphen):
    #             if (i > retval.count("-")):
    #                 item = self.forenames_female[random.randrange(0,len(self.forenames_female))]
    #                 while 0 != item.count("-"):
    #                     item = self.forenames_female[random.randrange(0,len(self.forenames_female))]
    #                 retval = retval + "-" + item
    #         else:
    #             retval = retval + " " + self.forenames_female[random.randrange(0,len(self.forenames_female))]
    #     return retval

    # @not_keyword
    # def get_random_surname(self, compound_name):
    #     """Lorem ipsum dolor it."""
    #     retval = self.surnames[random.randrange(0,len(self.surnames))]
    #     if (compound_name):
    #         retval = retval + "-" + self.surnames[random.randrange(0,len(self.surnames))]
    #     return retval

    # #de_locations = utils.support_de.MailingAddressGermany()
    # #de_communication = utils.support_de.TelecommunicationGermany()

    # de_locations = None
    # de_communication = None

