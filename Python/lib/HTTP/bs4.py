from bs4 import BeautifulSoup

soup = BeautifulSoup(html, 'html.parser')
div = soup.find('div', attrs = {'class':'people_list'})
divs = soup.find_all('div', attrs = {'class':'people_list'})

