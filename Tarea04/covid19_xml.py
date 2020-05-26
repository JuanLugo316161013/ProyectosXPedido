import json
import xml.etree.ElementTree as ET
import pprint

def indent(elem, level=0):
    i = "\n" + level*"  "
    j = "\n" + (level-1)*"  "
    if len(elem):
        if not elem.text or not elem.text.strip():
            elem.text = i + "  "
        if not elem.tail or not elem.tail.strip():
            elem.tail = i
        for subelem in elem:
            indent(subelem, level+1)
        if not elem.tail or not elem.tail.strip():
            elem.tail = j
    else:
        if level and (not elem.tail or not elem.tail.strip()):
            elem.tail = j
    return elem      

def xml_continents(root, data):
	continents_branches = {}
	for continent in data:
		continents_branches[ET.SubElement(root,continent)] = data[continent]
	return continents_branches

def xml_countries(continents_branches):
	countries_branches = {}
	for branch, data in continents_branches.items():
		for country in data:
			_country = ET.SubElement(branch,country)
			countries_branches[_country] = data[country]
			ET.SubElement(_country,'geoId').text = data[country]['geoId']
			ET.SubElement(_country,'countryterritoryCode').text = data[country]['countryterritoryCode']
			ET.SubElement(_country,'popData2018').text = data[country]['popData2018']
	return countries_branches

def xml_records(countries_branches):
	for branch, data in countries_branches.items():
		records_branch = ET.SubElement(branch, 'records')
		records = data['records']
		for record in records:
			record_branch = ET.SubElement(records_branch, 'record')
			ET.SubElement(record_branch,'dateRep').text = record['dateRep']
			ET.SubElement(record_branch,'day').text = record['day']
			ET.SubElement(record_branch,'month').text = record['month']
			ET.SubElement(record_branch,'year').text = record['year']
			ET.SubElement(record_branch,'cases').text = record['cases']
			ET.SubElement(record_branch,'dateRep').text = record['deaths']


if __name__ == '__main__':
	with open('covidout.json', 'r') as jfile:
		data = json.load(jfile)
		pprint.pprint(jfile)
		root = ET.Element('continents')
		continents_branches = xml_continents(root, data)
		countries_branches = xml_countries(continents_branches)
		xml_records(countries_branches)
		root = indent(root)
		tree = ET.ElementTree(root)
		tree.write('covid19.xml', encoding = 'unicode', xml_declaration = True)
