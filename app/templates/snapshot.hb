<div class = "utilization-header">
  <ul>
    {{#each staffTypes }}
      <li {{bind-attr class="active" data-filter-name=name}}>{{title}}</li>
    {{/each}}
  </ul>
</div>
{{utilization-list property=filteredList title=currentStaffType}}

