import random
import json
from datetime import datetime


class Database:
    def __init__(self, name, **data):
        self.name = name
        self.data = data

    def convert_to_json_format(self):
        dt = self.data.copy()
        for k, v in dt.items():
            dt[k] = [e.__dict__.copy() for e in v]
        return {'db': dt}

    def save(self):
        with open(f"{self.name}.json", 'w', encoding='utf-8') as f:
            json.dump(self.convert_to_json_format(), f, ensure_ascii=False, indent=4)


class User:
    def __init__(self, user_id, name, bonuses=100):
        self.user_id = user_id
        self.name = name
        self.bonuses = bonuses


class Vehicle:
    def __init__(self, vehicle_id, model, plate):
        self.vehicle_id = vehicle_id
        self.model = model
        self.plate = plate


class Driver:
    def __init__(self, driver_id, name, rating, vehicle_id):
        self.driver_id = driver_id
        self.name = name
        self.rating = rating
        self.vehicle_id = vehicle_id


class Order:
    def __init__(self, order_id, driver_id, user_id, price, date):
        self.order_id = order_id
        self.driver_id = driver_id
        self.user_id = user_id
        self.price = price
        self.date = date


# Task 1.
users = [
    User(1, "Алмаз"),
    User(2, "Расим"),
    User(3, "Айдар"),
    User(4, "Ризван")
]
drivers = [
    Driver(1, "Чонгук", rating=4.0, vehicle_id=2),
    Driver(2, "Виктор", rating=4.5, vehicle_id=3),
    Driver(3, "Грин", rating=5, vehicle_id=1)
]
vehicles = [
    Vehicle(1, "Toyota Camry", "К375АР716"),
    Vehicle(2, "Hyundai Accent", "Р384ТС116"),
    Vehicle(3, "Volkswagen Polo", "М648ХУ716")
]
orders = [Order(order_id=i, driver_id=random.randint(1, 3),
                user_id=random.randint(1, 4), price=random.randint(59, 500), date=datetime.today().strftime("%Y-%m-%d"))
          for i in range(5)]


db = Database(name='db', users=users, drivers=drivers, vehicles=vehicles, orders=orders)

db.save()
