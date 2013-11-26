<div id="content">
  <header>
      <section class="nav-bar">
        {{view App.SelectOffice content=offices
                                optionLabelPath="content.name"
                                optionValuePath="content.id"
                                selection=selectedOffice
                                data-test="offices"
                                class="white-button office-select"}}
        {{view App.NavView}}
      </section>
  </header>

  <div class="legend">
    <div class="overhead indicator"></div>
    <h3>Overhead</h3>
    <div class="unavailable indicator"></div>
    <h3>Unavailable</h3>
    <div class="non-billing indicator"></div>
    <h3>Non-Billing</h3>
    <div class="billing indicator"></div>
    <h3>Billing</h3>
    <div class="utilization indicator"></div>
    <h3>Daily Utilization (Billing / Available)</h3>
  </div>
  {{outlet utilizationChart}}
  <div class="container">
    <div class="office-header">
      <h1>{{name}}</h1>
      <section id="calendarBar">
        <div class="calendar-date-selector">
          <i {{action 'decrementDate'}}><span class="arrow-left">&#59237;</span></i>
          {{edit-date class="datepicker" action="confirmDate" value=formattedSnapDate escape-press="confirmDate"}}
          <i {{action 'incrementDate'}}><span class="arrow-right">&#59238;</span></i>
        </div>
      </section>
    </div>
    <div class="staff-lists">
    {{outlet snapshot}}
      <div class="office-by-office">
        {{outlet officeByOffice}}
      </div>
    </div>
  </div>
</div>


