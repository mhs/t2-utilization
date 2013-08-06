<div class="col-lg-9">
  <h2>Daily Utilization for {{date snapDate}}</h2>
  <p>
  On {{date snapDate}} we had {{staff.length}} people on staff.  Of these, {{billable.length}} were billable and {{overhead.length}} were not.<br/>
  Of the {{billable.length}} billable, {{assignable.length}} were assignable and {{unassignable.length}} were not.<br/>
  Of the {{assignable.length}} assignable employees, {{billing.length}} were billing that day.
  </p>
  <p>
    Daily utilization is billing as a percentage of assignable
    That is, non-billable people and those out on vacation are omitted from the calculation
  </p>
  <p>
    For {{date snapDate}}, that was {{billing.length}} / {{assignable.length}} = {{utilization}}%
  </p>


  <ul class="nav nav-tabs">
    <li><a href="#" data-tab="staff" {{action selectTab "staff"}}>Staff</a></li>
    <li><a href="#" data-tab="overhead" {{action selectTab "overhead"}}>Overhead</a></li>
    <li><a href="#" data-tab="billable" {{action selectTab "billable"}}>Billable</a></li>
    <li><a href="#" data-tab="unassignable" {{action selectTab "unassignable"}}>Unassignable</a></li>
    <li><a href="#" data-tab="assignable" {{action selectTab "assignable"}}>Assignable</a></li>
    <li><a href="#" data-tab="billing" {{action selectTab "billing"}}>Billing</a></li>
    <li><a href="#" data-tab="non_billing" {{action selectTab "non_billing"}}>Non-Billing</a></li>
  </ul>

  {{outlet tab}}
</div>
