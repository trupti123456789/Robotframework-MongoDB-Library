#my_yaml_reader.py
import yaml

class MyYAMLReader:
    def __init__(self, file_path):
        with open(file_path, 'r') as file:
            self.config = yaml.safe_load(file)

    def get_config_value(self, section, key):
        return self.config[section][key]