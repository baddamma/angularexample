<h1>{{country.name}}</h1>
<ul>
  <li>Flag: <img ng-src="{{country.flagURL}}" width="100"></li>
  <li>Population: {{country.population | number }}</li>
  <li>Capital: {{country.capital}}</li>
  <li>GDP: {{country.gdp | currency }}</li>
</ul>

<a href="#/">Get Back</a>