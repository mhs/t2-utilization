<div class="office-nav">
  {{#each officeButtons}}
    <a {{bind-attr href=linkPath class=":button selectedOffice"}}>{{name}}
    </a>
  {{/each}}
</div>
{{outlet utilizationChart}}
<div class="container">
  <div class="office-header">
    <h1>{{name}}</h1>
  </div>
  <section id="calendarBar">
    <div class="calendar-date-selector">
      <i {{action 'decrementDate'}} class="viewDayBefore">&#58541;</i>
      {{edit-date class="datepicker" action="confirmDate" value=formattedSnapDate escape-press="confirmDate"}}
      <i {{action 'incrementDate'}} class="viewDayAfter">&#58542;</i>
    </div>
  </section>
  <div class="staff-lists">
  {{outlet snapshot}}
    <div class="office-by-office">
      {{outlet officeByOffice}}
    </div>
  </div>
</div>

