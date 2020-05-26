import csv
import json

class country(object):

	def __init__(self, _dict):
		self.name = _dict['countriesAndTerritories']
		self.geoId = _dict['geoId']
		self.countryterritoryCode = _dict['countryterritoryCode']
		self.popData2018 = _dict['popData2018']
		self.records = [{'dateRep':  _dict['dateRep'],'day': _dict['day'], 'month': _dict['month'], 
						'year': _dict['year'], 'cases': _dict['cases'], 'deaths': _dict['deaths']}]

	def add_record(self, _dict):
		self.records.append({'dateRep':  _dict['dateRep'],'day': _dict['day'], 'month': _dict['month'], 
							'year': _dict['year'], 'cases': _dict['cases'], 'deaths': _dict['deaths']})

	def to_dict(self):
		return dict({'geoId': self.geoId, 'countryterritoryCode': self.countryterritoryCode,
							'popData2018': self.popData2018,'records': self.records})


class covid19_geography(object):

	def __init__(self, path):
		self.continents = {}
		with open(path, 'r') as csvfile:
			reader = csv.DictReader(csvfile)
			self.sort_by_continent(reader)

	def sort_by_continent(self, dict_reader):
		for _dict in dict_reader:
			continent = _dict['continentExp']
			_country = _dict['countriesAndTerritories']
			if continent in self.continents:
				if _country in self.continents[continent]:
					self.continents[continent][_country].add_record(_dict)
				else:
					self.continents[continent][_country] = country(_dict)
			else:
				self.continents[continent] = {_country: country(_dict)}

	def to_json(self, filename = 'covidout.json'):
		covid19_json = self.continents
		for continent in covid19_json:
			for _country in covid19_json[continent]:
				covid19_json[continent][_country] = covid19_json[continent][_country].to_dict()	
		with open(filename, 'w') as outfile:
			json.dump(self.continents, outfile, indent = 4)

covid19_geography = covid19_geography('covid-19.csv')
covid19_geography.to_json()