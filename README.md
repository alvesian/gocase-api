## About

I want to thank Gocase for the opportunity to take this test. It was a test with a lot of learning and I delivered what I can do best.

## Additional Stuff - Answers


- A security layer, to prevent script kiddies from messing up our Orders and putting on *YouTube*. | - A permission layer, that way we can be sure that each user is only working with their stuff.
    - To guarantee security in the application and that each user only works on what he is allowed to, a possible solution that solves both the security layer and the permission layer is the combination of "Devise" and "cancancan" gems. The "Devise" gem adds authentication capability to the system, and the "cancancan" gem determines access rules for each page or template. This way, the access data will be passed through the request header, being correctly stored in the database, and access will be allowed only to registered users according to their functions.
    
- Sometimes people confuses Moto G5 with Moto G5S and we need a way to modify Orders in production.
    - It is possible to add a function to the order controller to implement the modification of an order in production, however, it is important to alert the production team and the operation team that this item has been modified. This alert can appear in the Backoffice or arrive as an automated message integrated into the Slack application (business communication application). That way teams remain aligned according to what are expected with the order.

- A web UI to control everything directly, without the need of going thought the API.
    - The GUI that controls the entire system can be built by adding views (create, edit, delete), "_forms" and action buttons. An example of an action button could be: 'Send batch to production'. Clicking this button triggers a POST request, running the function of sending the queue to production. The graphical interface makes the system more accessible to those who do not have skill of API consumption. An example of using this implementation can be seen in [this link](https://bx-pokecoin-prod.herokuapp.com/ ), which was created at another time, and I believe it is also applicable in this case. This system has a graphical interface along the lines mentioned above, in addition to API consumption and CRUD functions.

## Documentation

Here you can find the [documentation](https://documenter.getpostman.com/view/18604903/2s7YYva2x4) for test requests and endpoints: https://documenter.getpostman.com/view/18604903/2s7YYva2x4




