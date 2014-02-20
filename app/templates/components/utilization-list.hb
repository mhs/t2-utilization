{{#with this as container}}
  <div class="staffList">
    <div class="number-container">
      <span class="numbers">{{property.length}}</span>
    </div>
  {{title}}
  <p class="subtitle">{{explanation}}</p>
  </div>
  <ul>
    {{#each person in list}}
      <li>{{person.name}}
      {{#if container.showPercentages}}
        <div class="percent-bar">
          <div class="percentage">{{person.percentage}}%</div>
          <div {{bind-attr style="person.width"}} {{bind-attr class=":indicator person.overallocated"}} ></div>
        </div>
      {{/if}}
      </li>
    {{/each}}
  </ul>
{{/with}}
