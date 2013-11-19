<div class="office-nav">
  {{#each officeButtons}}
    <a {{bind-attr href=linkPath class=":button selectedOffice"}}>{{name}}
    </a>
  {{/each}}
</div>
{{outlet utilizationChart}}
<div class="container">
  <div class="staff-lists">
  {{outlet snapshot}}
    <div class="office-by-office">
      {{outlet officeByOffice}}
    </div>
  </div>
</div>

