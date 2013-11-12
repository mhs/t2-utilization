<div class="container">
  <h2>Team Neo</h2>
    <div class="dateToggle">
      <i class="viewDayBefore">&#58541;</i>
      <input class="dateInput" name="viewDate" type="text" />
      <i class="viewDayAfter">&#58542;</i>
    </div>
</div>

  <ul>
    {{#each snapshots}}
      <li>{{#linkTo 'snapshot' this}}{{ date snapDate }} - {{ utilization }}%{{/linkTo}} </li>
    {{/each}}
  </ul>

{{ outlet }}
