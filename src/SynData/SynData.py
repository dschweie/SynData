# import random
import datetime
import time

from robot.api.deco import keyword, not_keyword, library
from robot.libraries.BuiltIn import BuiltIn

from item_builder_engine import ItemBuilderEngine

@library(scope='GLOBAL', version='0.0.2', doc_format='reST')
class SynData:
    ROBOT_AUTO_KEYWORDS = False

    MODE_DEF = 0
    MODE_REP = 1

    INSTANCE = None

    """ Hier findet sich die Dokumentation dieser Bibliothek"""

    #def get_keyword_names(self):
    #    return ["Set Context", "Release Context", "Get Context", "Get Name", "Get First Name", "Get Last Name"]

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
        SynData.INSTANCE = self

    def get_keyword_names(self):
        # Get all attributes and their values from the library.
        attributes = [(name, getattr(self, name)) for name in dir(self)]
        # Filter out attributes that do not have 'robot_name' set.
        keywords = [(name, value) for name, value in attributes
                    if hasattr(value, 'robot_name')]
        # Return value of 'robot_name', if given, or the original 'name'.
        return [value.robot_name or name for name, value in keywords]

    @staticmethod
    @keyword
    def Set_Context(context, localization='en_US', focus='global'):
        print(context)
        print(localization)
        match focus.lower():
            case "global":
                context_id=f"global.{context}"
            case "suite":
                context_id=f"{SynData.INSTANCE._get_current_test_suite()}.{context}"
            case "test":
                context_id=f"{SynData.INSTANCE._get_current_test_suite()}.{SynData.INSTANCE._get_current_test_case()}.{context}"
            case _:
                context_id=f"global.{context}"
                focus = "global"
        # if (None == self.data.get(context_id)):
        if (not (context_id in SynData.INSTANCE.data.keys())):
            SynData.INSTANCE.data[context_id] = {}
            SynData.INSTANCE.data[context_id].update({"meta":{"localization" : localization, "name" : context, "focus" : focus.lower()}})
        SynData.INSTANCE.context = context_id
        print(SynData.INSTANCE.data)

    
    @staticmethod
    @keyword
    def Release_Context():
        SynData.INSTANCE.context = None


    @staticmethod
    @keyword
    def Get_Context():
        if(None == SynData.INSTANCE.context):
            # In this case, no context is set and therefore None is returned.
            return None
        # return self.context
        if (None != SynData.INSTANCE.context):
            context_name = SynData.INSTANCE.data.get(SynData.INSTANCE.context).get("meta").get("name")
            context_focus = SynData.INSTANCE.data.get(SynData.INSTANCE.context).get("meta").get("focus")
            if(       (f"{SynData.INSTANCE._get_current_test_suite()}.{SynData.INSTANCE._get_current_test_case()}.{context_name}" == SynData.INSTANCE.context)
                  and ("test" == context_focus)):
                # In this case, a context was detected that exactly matches the test case currently being executed.
                return context_name
            elif(     (f"{SynData.INSTANCE._get_current_test_suite()}.{context_name}" == SynData.INSTANCE.context)
                  and ("suite" == context_focus)):
                # In this case, a context was detected that exactly matches the test suite currently being executed.
                return context_name
            elif(     (f"global.{context_name}" == SynData.INSTANCE.context)
                  and ("global" == context_focus)):
                # In this case, a context with a global focus was detected.
                return context_name
            else:
                # In this case, a context is set, but the context has a focus 
                # that does not match either the test case or the test suite.
                # Consequently, the value None is returned.
                return None
        else: 
            # In this case, no context is set and therefore None is returned.
            return None

    
    @staticmethod
    @keyword
    def Get_Name(sex="*"):
        if ( None == SynData.Get_Context() ):
            localization = SynData.INSTANCE.default_localization
        else:
            localization = SynData.INSTANCE.data.get(SynData.INSTANCE.context).get("meta").get("localization")
        return SynData.INSTANCE.ibe.execute(SynData.INSTANCE, localization, "Get Name", "person.name", {"sex":sex})
    

    @staticmethod    
    @keyword
    def Get_First_Name(sex="*"):
        if ( None == SynData.Get_Context() ):
            localization = SynData.INSTANCE.default_localization
        else:
            localization = SynData.INSTANCE.data.get(SynData.INSTANCE.context).get("meta").get("localization")
        return SynData.INSTANCE.ibe.execute(SynData.INSTANCE, localization, "Get First Name", "person.first_name", {"sex":sex})
    
    @staticmethod
    @keyword
    def Get_Last_Name(sex="*"):
        if ( None == SynData.Get_Context() ):
            localization = SynData.INSTANCE.default_localization
        else:
            localization = SynData.INSTANCE.data.get(SynData.INSTANCE.context).get("meta").get("localization")
        return SynData.INSTANCE.ibe.execute(SynData.INSTANCE, localization, "Get Last Name", "person.last_name", {"sex":sex})

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

    @not_keyword
    def add_log_entry(self, keyword, item, value):
        if ((self.logging) and (None != self.logfile)):
            ts = datetime.datetime.now().strftime("%Y-%m-%d %X") + ("-" if time.timezone > 0 else "+") + time.strftime("%H:%M", time.gmtime(abs(time.timezone)))
            suite = BuiltIn().get_variable_value("${SUITE NAME}")
            test_case = BuiltIn().get_variable_value("${TEST NAME}")
            file = open(self.logfile, "a")
            file.write(f"{ts},{suite},{test_case},{keyword},{item},{value}\n")
            file.close()

    @not_keyword
    def _get_current_test_suite(self):
        return BuiltIn().get_variable_value("${SUITE NAME}")

    @not_keyword
    def _get_current_test_case(self):    
        return BuiltIn().get_variable_value("${TEST NAME}")

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

