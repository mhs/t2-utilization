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
  <section id="calendarBar"> <div class="calendar-date-selector">
      {{#if isEditingDate}}
        {{edit-date class="datepicker" action="confirmDate" value=snapDate escape-press="confirmDate"}}
      {{else}}
        <span {{action "editDate" on="click"}}>{{snapDate}}</span>
      {{/if}}
    </div>

    <ul class="calendar">
      {{#each date in dateRange}}
        <li class="week">{{date}}</li>
      {{/each}}
    </ul>
  </section>
  <div class="staff-lists">
  {{outlet snapshot}}
    <div class="office-by-office">
      {{outlet officeByOffice}}
    </div>
  </div>
</div>

