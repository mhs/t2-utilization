<div id="utilizationOverview">
  <div class="office-by-office">
    Office by Office
  </div>
  {{#each officeInfo}}
    <div class="officeInfo">
      <div class="officePercentage">
        {{percent utilization}}
      </div>
      <div class="officeLocation">
        {{name}}
      </div>
    </div>
  {{/each}}
</div>
