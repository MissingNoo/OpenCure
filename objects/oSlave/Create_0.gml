socket = 0;
var selfsocket = socket;
var selfid = id;
with (oSlave)
{
    if(socket == selfsocket and id != selfid){
        instance_destroy();
    }
}