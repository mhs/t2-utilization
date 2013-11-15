  <div class = "utilization-sidebar">
    <ul>
      {{#each staffTypes }}
      <li {{bind-attr class="active" data-filter-name=name}}>{{title}}</li>
      {{/each}}
    </ul>
  </div>
<div class="container">
  <div id="utilizationTable">
    {{utilization-list property=filteredList title="Selected People"}}
  </div>
</div>

