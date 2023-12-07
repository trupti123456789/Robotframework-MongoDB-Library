from pymongo import MongoClient
from robot.api import logger

class MongoDBLibrary(object):

    def __init__(self, connection_string):
        self.client = MongoClient(connection_string)
        self.db = None

    def connect_to_database(self, db_name):
        self.db = self.client[db_name]
        logger.info(f"Connected to MongoDB database: {db_name}")

    def insert_document(self, collection_name, document):
        collection = self.db[collection_name]
        result = collection.insert_one(document)
        logger.info(f"Inserted document with id: {result.inserted_id}")
        return str(result.inserted_id)

    def find_document(self, collection_name, query):
        collection = self.db[collection_name]
        document = collection.find_one(query)
        logger.info(f"Found document: {document}")
        return document

    # Add more methods as needed for your testing purposes