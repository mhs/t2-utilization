<div class="row">
  <div class="col-lg-3">
    <div class="bs-sidebar affix-top">
      <h3>Snapshots</h3>
      <ul class="nav bs-sidenav">
        {{#each arrangedContent}}
          <li>{{#linkTo 'snapshot' this}}{{ date snapDate }}{{/linkTo}} </li>
        {{/each}}
      </ul>
    </div>
  </div>
  {{ outlet }}
</div>
