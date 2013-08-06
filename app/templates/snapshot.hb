<div class="col-lg-9">
  <h2>Daily Utilization for {{date snapDate}}</h2>
  <p>
  On {{date snapDate}} we had {{staff.length}} people on staff.  Of these, {{billable.length}} were billable and {{overhead.length}} were not.<br/>
  Of the {{billable.length}} billable, {{assignable.length}} were assignable and {{unassignable.length}} were not.<br/>
  Of the {{assignable.length}} assignable employees, {{billing.length}} were billing that day.
  </p>
  <p>
    Daily utilization is billing as a percentage of assignable
    That is, non-billable people and those out on vacation are omitted from the calculation
  </p>
  <p>
    For {{date snapDate}}, that was {{billing.length}} / {{assignable.length}} = {{utilization}}%
  </p>


  <h3>Staff</h3>
  <ul>
    {{#each staff}}
      <li>{{name}}</li>
    {{/each}}
  </ul>

  <h3>Overhead</h3>
  <ul>
    {{#each overhead}}
      <li>{{name}}</li>
    {{/each}}
  </ul>

  <h3>Billable</h3>
  <ul>
    {{#each billable}}
      <li>{{name}}</li>
    {{/each}}
  </ul>

  <h3>Unassignable</h3>
  <ul>
    {{#each unassignable}}
      <li>{{name}}</li>
    {{/each}}
  </ul>

  <h3>Assignable</h3>
  <ul>
    {{#each assignable}}
      <li>{{name}}</li>
    {{/each}}
  </ul>

  <h3>Billing</h3>
  <ul>
    {{#each billing}}
      <li>{{name}}</li>
    {{/each}}
  </ul>

  <h3>Non-Billing</h3>
  <ul>
    {{#each non_billing}}
      <li>{{name}}</li>
    {{/each}}
  </ul>
</div>
