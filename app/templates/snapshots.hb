<div class="snapshot-list">
  <h3>Snapshots</h3>
    <ul>
      {{#each arrangedContent}}
        <li>{{#linkTo 'snapshot' this}}{{ date snapDate }} - {{ utilization }}%{{/linkTo}} </li>
      {{/each}}
    </ul>
  {{ outlet }}
</div>
