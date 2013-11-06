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
        {{partial 'assignable'}}
        {{partial 'billable'}}
        {{partial 'billing'}}
        {{partial 'overhead'}}
        {{partial 'unassignable'}}
        {{partial 'staff'}}
        {{partial 'non_billing'}}
      </div>
    </div>
