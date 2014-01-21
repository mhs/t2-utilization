<div class="utilization-header">
  <ul>
    {{#each model}}
      {{list-tab item=this enter="highlight" leave="clearHighlight" select="select"}}
    {{/each}}
  </ul>
</div>

{{utilization-list property=list showPercentages=selected.showPercentages title=selected.displayName}}

