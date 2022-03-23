<style>
    #uni_modal .modal-footer{
        display:none;
    }
</style>

<div class="container-fluid">
    <div class="alert alert-success">
        <p>Su solicitud de cita ha sido enviada. La gerencia se comunicará con usted tan pronto como vean su solicitud. Su código de cita es <b><?= ucwords($_GET['code']) ?></b>. ¡Gracias!</p>
    </div>

    <div class="form-group text-right">
        <button class="btn btn-sm btn-dark btn-flat" type="button" data-dismiss="modal"><i class="fa fa-close"></i> Cerrar</button>
    </div>
</div>
<script>
    $(function(){
        $('#uni_modal').on('hide.bs.modal',function(){
            location.reload()
        })
    })
</script>