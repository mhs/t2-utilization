<div class="container">
  <h2>Team Neo</h2>
    <div class="dateToggle">
      <i class="viewDayBefore">&#58541;</i>
      <input class="dateInput" name="viewDate" type="text" value=""/>
      <i class="viewDayAfter">&#58542;</i>
    </div>
</div>

<!--         {{#each arrangedContent}}
          <li>{{#linkTo 'snapshot' this}}{{ date snapDate }} - {{ utilization }}%{{/linkTo}} </li>
        {{/each}}
      </ul>
    </div>
  </div>
</div> -->
<!--
<section id="calendarBar">
  <div class="calendar-date-selector">
    {{#if isEditingDate}}
      {{edit-date class="datepicker" action="confirmDate" escape-press="confirmDate"}}
    {{else}}
      <span {{action "editDate" on="click"}}>{{firstDate}}</span>
    {{/if}}
  </div> -->

  <ul class="calendar">
    {{#each date in dateRange}}
      <li class="week">{{date}}</li>
    {{/each}}
  </ul>
</section>

{{ outlet }}
