<div id="content-wrapper">
    <header>
        <div class="container">
          <h1>Neo Utilization</h1>
          <div id="utilizationToggle">
              <button class="snapshot-forecast-button">Snapshots</button>
              <button class="snapshot-forecast-button">Forecast</button>
          </div>
        </div>
    </header>
    <nav>
      <div class="container">
        <button>Overview</button>
        <button>Montevideo</button>
        <button>San Francisco</button>
        <button>Singapore</button>
        <button>Edinburgh</button>
        <button>Columbus</button>
        <button>Cincinnati</button>
        <button>New York</button>
      </div>
    </nav>
    <div class="graph">
      <canvas id="utilizationGraph" width="900px" height="300px">
      <div class="graphVerticals">
        <div class="verticalRule"></div>
        <div class="verticalRule"></div>
        <div class="verticalRule"></div>
        <div class="verticalRule"></div>
        <div class="verticalRule"></div>
        <div class="verticalRule"></div>
      </div>
      <div class="averageUtilization">
        <div class="averagePercentage">
          80<span>%</span>
        </div>
        <div class="averageLabel">
          Avg. Utilization<span>&#59140</span>
        </div>
        <div class="averageLabelHelp">
        </div>
      </div>
      </canvas>
    </div>
    <div class="container">
      <h2>Team Neo</h2>
      <div class="dateToggle">
        <i class="viewDayBefore">&#58541;</i>
        <input class="dateInput" name="viewDate" type="text" value="September 27, 2013" />
        <i class="viewDayAfter">&#58542;</i>
      </div>
    </div>
    <div class="container">
      <div id="utilizationTable">
        <ul class="staffList">
          <li><span class="singleDigit numbers">4</span>Support Staff</li>
          <li>Firstname Lastname</li>
          <li>Firstname Lastname</li>
          <li>Firstname Lastname</li>
          <li>Firstname Lastname</li>
        </ul>
        <ul class="staffList">
          <li data-tab="billing"><span class="doubleDigit numbers billing">14</span>Billing</li>
          <ul>
            {{#each billing}}
            <li>{{name}}</li>
            {{/each}}
        </ul>
        </ul>
        <ul class="staffList">
          <li><span class="doubleDigit numbers available">14</span>Available</li>
          <li>Firstname Lastname</li>
          <li>Firstname Lastname</li>
          <li>Firstname Lastname</li>
          <li>Firstname Lastname</li>
        </ul>
        <ul class="staffList"><li><span class="doubleDigit numbers unavailable">14</span>Unavailable</li>
          <li>Firstname Lastname</li>
          <li>Firstname Lastname</li>
          <li>Firstname Lastname</li>
          <li>Firstname Lastname</li>
        </ul>
      </div>
    </div>
  <div id="utilizationOverview">
    <div class="office-by-office">Office by Office</div>
    <div class="officeInfo">
      <div class="officePercentage">72%</div>
      <div class="officeLocation">Montevideo</div>
    </div>
    <div class="officeInfo">
      <div class="officePercentage">72%
      </div>
      <div class="officeLocation">San Francisco</div>
    </div>
    <div class="officeInfo">
      <div class="officePercentage">72%
      </div>
      <div class="officeLocation">Singapore
      </div>
    </div>
    <div class="officeInfo">
      <div class="officePercentage">72%
      </div>
      <div class="officeLocation">Edinburgh
      </div>
    </div>
    <div class="officeInfo">
      <div class="officePercentage">72%
      </div>
      <div class="officeLocation">Columbus
      </div>
    </div>
    <div class="officeInfo">
      <div class="officePercentage">72%
      </div>
      <div class="officeLocation">Cincinnati
      </div>
    </div>
    <div class="officeInfo">
      <div class="officePercentage">72%
      </div>
      <div class="officeLocation">New York
      </div>
    </div>
  </div>
  {{outlet}}
</div>