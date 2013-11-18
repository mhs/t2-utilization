<div id="utilizationOverview">
  <div class="office-title">
    Office by Office
  </div>
  {{#each officeInfo}}
    <div class="officeInfo">
      <div class="office-percentage">
        {{percent utilization}}
      </div>
      <div class="office-location">
        {{name}}
      </div>
    </div>
  {{/each}}
</div>
