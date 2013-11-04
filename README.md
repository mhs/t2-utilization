# t2-utilization

The t2-utilization project is one of a series of clients that makes use of the [T2 API](https://github.com/neo/t2-api) to
show information we need to manage our business.  In particular, this app presents daily utilization data that
is capture inside T2 in snapshot form.  The leadership of the company uses utilization metrics to understand how
healthy we are as a business.

### What is Utilization Anyway?

Over time, the company has calculated utilization metrics in a few different ways. After much debate, we have
arrived at a definition we are comfortable with.  To understand this definition, you need to understand how
people and their time in the company are viewed:

- **Staff** - Everyone employed by the company is considered to be on staff.  The staff is broken down into two primary buckets...
- **Overhead** - People (e.g. the CEO) who don't do direct billable work are in a bucket of overhead time.  The other component of staff is...
- **Billable** - This is the set of people/time which we make available for client work.  But, not all of it can be employed at once because...
- **Unassignable** - Some people are out on vacation, out sick, out speaking at a conference, etc.  The rest are...
- **Assignable** - People who we expect to be working on client projects and are in the office.  Of these, we have...
- **Billing** - People who are working on a billable project in a billable way and...
- **Available** - People who could be billing but don't have work at the moment.

Utilization is defined as *Billing* as a percentage of *Assignable*.  That is, people who are either overhead or who are out of
the office (vacation, etc.) are not factored into the utilizatin equations.

## Contributing

This is an [ember.js](http://emberjs.com) application that uses [lineman.js](https://github.com/testdouble/lineman) as a build tool.
And as mentioned above, it uses the [T2 API](https://github.com/neo/t2-api).  So, there's a bit to do to get going with a local build.

### Get the API up and running

The first thing to do is to clone the T2 API project locally and get it up and running.  Details for how to do
that are in the [README for that project](https://github.com/neo/t2-api) and outside the scope of this README.  Note that you need
both the API (usually started via foreman and running on port 5000) and the t2-utilization app (run via lineman on port 8000) to
execute the project locally.

### Install node, npm, and lineman

You'll need to have a reasonably modern version of [node.js](http://nodejs.org/) and lineman installed.

```bash
brew install node
npm install -g lineman
npm install
```

### Fire it up

```
lineman run
```

And then visit the page at [localhost:8000](http://localhost:8000) to verify that it works.


## Deployment

This app is deployed to http://t2-utilization.herokuapp.com using the lineman buildpack.
