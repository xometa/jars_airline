/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {



    /*********************************VALIDACIÓN DEL INICIO DE SESION************************************/
    $('#form-login').bootstrapValidator({

        message: 'Este valor no es valido',

        fields: {

            usuario: {
                validators: {
                    notEmpty: {
                        message: 'Ingrese el nombre de usuario'
                    }, stringLength: {
                        max: 30,
                        message: 'El usuario debe contener maximo 50 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z0-9\s\ñ\Ñ]*$/,
                        message: 'Caracter invalido'

                    }
                }
            },

            contra: {
                validators: {
                    notEmpty: {
                        message: 'Ingrese contraseña'
                    }
                }
            }
        }
    });
    /*********************************VALIDACIÓN DEL INICIO DE SESION************************************/




    /*********************************VALIDACIÓN DEL FORMULARIO EMPRESA************************************/
    $('#form-empresa').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {

            valid: 'glyphicon glyphicon-ok',

            invalid: 'glyphicon glyphicon-remove',

            validating: 'glyphicon glyphicon-refresh'

        },
        fields: {

            nombreempresas: {
                validators: {
                    notEmpty: {
                        message: 'El nombre de la empresa es requerido'
                    }, stringLength: {
                        min: 5,
                        max: 30,
                        message: 'El nombre debe contener entre 5 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },
            ruc: {
                validators: {
                    notEmpty: {
                        message: 'El RUC de la empresa es requerido'
                    },
                    stringLength: {
                        min: 11,
                        max: 13,
                        message: 'El RUC debe contener entre 11 y 13 caracteres'
                    }
                }
            },
            telefono: {
                validators: {
                    notEmpty: {
                        message: 'El teléfono de la empresa es requerido'
                    },
                    stringLength: {
                        min: 14,
                        message: 'El número ingresado es invalido'
                    }

                }
            }
        }
    });
    /*********************************FIN VALIDACIÓN DEL FORMULARIO EMPRESA************************************/

    /************************************--------------------------------------------**********************************/

    /*********************************VALIDACIÓN DEL FORMULARIO AVIÓN************************************/
    $('#form-aviones').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            nombre: {
                validators: {
                    notEmpty: {
                        message: 'El nombre de el avión es requerido'
                    }, stringLength: {
                        min: 5,
                        max: 25,
                        message: 'El nombre debe contener entre 5 y 25 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z0-9\s\-\ñ\Ñ]*$/,
                        message: 'Expresión no valida'

                    }
                }
            },

            modelo: {
                validators: {
                    notEmpty: {
                        message: 'El modelo de el avión es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 10,
                        message: 'El modelo del avión debe contener entre 3 y 10 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z0-9\s\ñ\Ñ\-]*$/,
                        message: 'No admitido'

                    }
                }
            },
            serie: {
                validators: {
                    notEmpty: {
                        message: 'La serie de el avión es requerida'
                    },
                    stringLength: {
                        min: 1,
                        max: 5,
                        message: 'La serie del avión debe contener entre 1 y 5 caracteres'
                    },
                    regexp: {
                        regexp: /^[0-9\-]*$/,
                        message: 'N° de serie incorrecto'

                    }
                }
            },
            capacidad: {
                validators: {
                    notEmpty: {
                        message: 'La capacidad de el avión es requerida'
                    },
                    stringLength: {
                        min: 3,
                        max: 3,
                        message: 'La capacidad minima del avión debe ser 300 y maxima 800 '
                    },
                    regexp: {
                        regexp: /^[0-9]*$/,
                        message: 'Ingrese solo numeros'
                    }
                }
            },
            estado: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione el estado del avíon'
                    }
                }
            },
            aerolinea: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione la empresa a la que se le compro el avión'
                    }
                }
            }
        }
    });
    /*********************************VALIDACIÓN DE LA MODAL AEROLINEAS************************************/
    $('#modal-form-aerolinea').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            nombreaerolinea: {
                validators: {
                    notEmpty: {
                        message: 'El nombre de la empresa es requerido'
                    }, stringLength: {
                        min: 5,
                        max: 30,
                        message: 'El nombre debe contener entre 5 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },
            ruc: {
                validators: {
                    notEmpty: {
                        message: 'El RUC de la empresa es requerido'
                    },
                    stringLength: {
                        min: 11,
                        max: 13,
                        message: 'El RUC debe contener entre 11 y 13 caracteres'
                    }
                }
            },
            telefono: {
                validators: {
                    notEmpty: {
                        message: 'El teléfono de la empresa es requerido'
                    },
                    stringLength: {
                        min: 14,
                        message: 'El número ingresado es invalido'
                    }

                }
            }
        }
    });
    /*********************************FIN VALIDACIÓN DE LA MODAL AEROLINEAS************************************/
    /*********************************FIN VALIDACIÓN DEL FORMULARIO AVIÓN************************************/


    /*********************************VALIDACIÓN DEL ORIGEN************************************/
    $('#form-origen').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            nombreaeropuerto: {
                validators: {
                    notEmpty: {
                        message: 'El nombre de el aeropuerto es requerido'
                    }, stringLength: {
                        min: 5,
                        max: 30,
                        message: 'El nombre debe contener entre 5 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            pais: {
                validators: {
                    notEmpty: {
                        message: 'El país es requerido'
                    }
                }
            },
            ciudad: {
                validators: {
                    notEmpty: {
                        message: 'La ciudad es requerida'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'La ciudad debe contener entre 3 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            }

        }
    });
    /*********************************FIN VALIDACIÓN DEL ORIGEN************************************/

    /*********************************VALIDACIÓN DEL DESTINO************************************/
    $('#form-destino').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            nombreaeropuerto: {
                validators: {
                    notEmpty: {
                        message: 'El nombre de el aeropuerto es requerido'
                    }, stringLength: {
                        min: 5,
                        max: 30,
                        message: 'El nombre debe contener entre 5 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            pais: {
                validators: {
                    notEmpty: {
                        message: 'El paìs es requerido'
                    }
                }
            },
            ciudad: {
                validators: {
                    notEmpty: {
                        message: 'La ciudad es requerida'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'La ciudad debe contener entre 3 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            }

        }
    });
    /*********************************FIN VALIDACIÓN DEL DESTINO************************************/

    /*********************************VALIDACIÓN DEE TARGETA************************************/
    $('#form-targetas').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            nombredeltitular: {
                validators: {
                    notEmpty: {
                        message: 'El nombre de el titular es requerido'
                    }, stringLength: {
                        min: 5,
                        max: 50,
                        message: 'El nombre debe contener entre 5 y 50 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            fechadecaducidad: {
                validators: {
                    notEmpty: {
                        message: 'La fecha es requerida'
                    }
                }
            },
            codseguridad: {
                validators: {
                    notEmpty: {
                        message: 'El código es requerido'
                    },
                    stringLength: {
                        min: 1,
                        max: 5,
                        message: 'El código debe contener entre 1 y 5 caracteres'
                    },
                    regexp: {
                        regexp: /^[0-9\-]*$/,
                        message: 'Ingrese solo numeros'

                    }
                }
            }

        }
    });
    /*********************************FIN VALIDACIÓN DE TARGETA************************************/

    /*********************************VALIDACIÓN DEL FORMULARIO USUARIOS************************************/
    $('#form-usuarios').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            nombre: {
                validators: {
                    notEmpty: {
                        message: 'Los nombres de el usuario es requerido'
                    }, stringLength: {
                        min: 5,
                        max: 50,
                        message: 'El nombre debe contener entre 5 y 50 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            apellido: {
                validators: {
                    notEmpty: {
                        message: 'Los apellidos de el usuario es requerido'
                    }, stringLength: {
                        min: 5,
                        max: 50,
                        message: 'El nombre debe contener entre 5 y 50 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            sexo: {
                validators: {
                    notEmpty: {
                        message: 'El sexo del usuario es requerido'
                    }
                }
            },

            nombreusuario: {
                validators: {
                    notEmpty: {
                        message: 'El usuario es requerido'
                    }, stringLength: {
                        min: 5,
                        message: 'El nombre de usuario debe contener como minimo 5 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z0-9\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras o numeros (o combinados)'

                    }
                }
            },

            contrasenia: {
                validators: {
                    notEmpty: {
                        message: 'La contraseña es requerido'
                    }, stringLength: {
                        min: 8,
                        message: 'La contraseña debe contener como minímo 8 caracteres'
                    }
                }
            },

            tipo: {
                validators: {
                    notEmpty: {
                        message: 'El tipo de usuario es requerido'
                    }
                }
            }
        }
    });
    /*********************************FIN VALIDACIÓN DEL FORMULARIO USUARIOS************************************/

    /*********************************VALIDACIÓN DEE ASIENTOS************************************/
    $('#form-asientos').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            fila: {
                validators: {
                    notEmpty: {
                        message: 'La fila para el asiento es requerida'
                    }, stringLength: {
                        min: 1,
                        max: 3,
                        message: 'La fila debe ir del 1 al 100'
                    },
                    regexp: {
                        regexp: /^[0-9]*$/,
                        message: 'Ingrese solo numeros'

                    }
                }
            },

            columna: {
                validators: {
                    notEmpty: {
                        message: 'La columna para el asiento es requerida'
                    }, stringLength: {
                        min: 1,
                        max: 1,
                        message: 'La columa puede ir de la A a la Z'
                    },
                    regexp: {
                        regexp: /^[A-Z]*$/,
                        message: 'Ingrese solo letras Mayusculas'

                    }
                }
            }

        }
    });
    /*********************************FIN VALIDACIÓN DE ASIENTOS************************************/
    
    /*********************************VALIDACIÓN DE VUELOS************************************/
    $('#form-vuelos').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            fechasalida: {
                validators: {
                    notEmpty: {
                        message: 'La fecha de salida del vuelo es requerida'
                    }
                }
            },

            fechallegada: {
                validators: {
                    notEmpty: {
                        message: 'La fecha de llegada del vuelo es requerida'
                    }
                }
            },
            horasalida: {
                validators: {
                    notEmpty: {
                        message: 'La hora de salida del vuelo es requerida'
                    }
                }
            },
            horallegada: {
                validators: {
                    notEmpty: {
                        message: 'La hora de llegada del vuelo es requerida'
                    }
                }
            },

            idavion: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione un avión'
                    }
                }
            },

            idorigen: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione el país de origen'
                    }
                }
            },

            iddestino: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione el país de destino'
                    }
                }
            },
            costo: {
                validators: {
                    notEmpty: {
                        message: 'El costo del vuelo es requerido'
                    },
                    
                    regexp: {
                        regexp: /^[0-9\.]*$/,
                        message: 'Ingrese solo numeros'

                    }
                }
            }

        }
    });
    /*********************************FIN VALIDACIÓN DE PAGOS************************************/
    
    /*********************************VALIDACIÓN DE VUELOS************************************/
    $('#form-pagos').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            formapago: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione una forma de pago'
                    }
                }
            },

            titular: {
                validators: {
                    notEmpty: {
                        message: 'Agregue el titular a realizar el pago'
                    }
                }
            },

            reserva: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione la reserva a pagar'
                    }
                }
            },
            costo: {
                validators: {
                    notEmpty: {
                        message: 'El costo de la reserva es requerida'
                    },
                    
                    regexp: {
                        regexp: /^[0-9\.]*$/,
                        message: 'Ingrese solo numeros'

                    }
                }
            }

        }
    });
    /*********************************FIN VALIDACIÓN DE PAGOS************************************/
    
     /*********************************VALIDACIÓN DEL FORMULARIO PASAJERO************************************/
    $('#form-pasajeros').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            nombre: {
                validators: {
                    notEmpty: {
                        message: 'Los nombres del pasajero son requerido'
                    }, stringLength: {
                        min: 5,
                        max: 50,
                        message: 'El nombre debe contener entre 5 y 50 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            apellido: {
                validators: {
                    notEmpty: {
                        message: 'Los apellidos del pasajero son requerido'
                    }, stringLength: {
                        min: 5,
                        max: 50,
                        message: 'El nombre debe contener entre 5 y 50 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            sexo: {
                validators: {
                    notEmpty: {
                        message: 'El sexo del pasajero es requerido'
                    }
                }
            },

            edad: {
                validators: {
                    notEmpty: {
                        message: 'Ingresa una edad'
                    }, stringLength: {
                        min: 0,
                        message: 'Ingrese una edad valida'
                    },
                    regexp: {
                        regexp: /^[0-9]*$/,
                        message: 'Ingrese solo numeros'

                    }
                }
            },

            direccion: {
                validators: {
                    notEmpty: {
                        message: 'Ingrese una dirección'
                    }, stringLength: {
                        min: 0,
                        max: 50,
                        message: 'La dirección ingresada es incorrecta'
                    }
                }
            },
            telefono: {
                validators: {
                    notEmpty: {
                        message: 'El teléfono es requerido'
                    },
                    stringLength: {
                        min: 15,
                        message: 'El número ingresado es invalido'
                    }

                }
            },

            tipodocumento: {
                validators: {
                    notEmpty: {
                        message: 'El tipo de documento del pasajero es requerido'
                    }
                }
            },

            numerodocumento: {
                validators: {
                    notEmpty: {
                        message: 'El número de documento es obligatorio'
                    }
                }
            },

            fechavencimiento: {
                validators: {
                    notEmpty: {
                        message: 'La fecha de vencimiento del tipo de documento seleccionado es requerida'
                    }
                }
            },

            nacionalidad: {
                validators: {
                    notEmpty: {
                        message: 'Ingrese una nacionalidad'
                    }, stringLength: {
                        min: 4,
                        max: 25,
                        message: 'El nombre del país es incorrecto'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            correo: {
                validators: {
                    notEmpty: {
                        message: 'Ingrese un correo'
                    },
                    regexp: {
                        regexp: /^[A-Za-z0-9\@\ñ\Ñ\.\_]*$/,
                        message: 'Ingrese un correo valido'

                    }
                }
            }
        }
    });
    /*********************************FIN VALIDACIÓN DEL FORMULARIO PASAJERO************************************/
    
     /*********************************VALIDACIÓN DEL FORMULARIO USUARIOS************************************/
    $('#form-reserva').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            idpasajero: {
                validators: {
                    notEmpty: {
                        message: 'El pasajero es requerido'
                    }
                }
            },
            clase: {
                validators: {
                    notEmpty: {
                        message: 'Sleccione una clase'
                    }
                }
            },
            idasiento: {
                validators: {
                    notEmpty: {
                        message: 'Sleccione un asiento'
                    }
                }
            },
            idvuelo: {
                validators: {
                    notEmpty: {
                        message: 'Sleccione un vuelo'
                    }
                }
            },
            fecharegreso: {
                validators: {
                    notEmpty: {
                        message: 'La fecha de regreso es requerida'
                    }
                }
            },

            estadopago: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione el estado de pago de la reserva'
                    }
                }
            },

            estadoreserva: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione el estado de la reserva'
                    }
                }
            }
        }
    });
    /*********************************FIN VALIDACIÓN DEL FORMULARIO RESERVAS************************************/
    
    /*********************************VALIDACIÓN DEL MODAL AVIÓN************************************/
    $('#form-aviones-modal').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            nombre: {
                validators: {
                    notEmpty: {
                        message: 'El nombre de el avión es requerido'
                    }, stringLength: {
                        min: 5,
                        max: 25,
                        message: 'El nombre debe contener entre 5 y 25 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z0-9\s\-\ñ\Ñ]*$/,
                        message: 'Expresión no valida'

                    }
                }
            },

            modelo: {
                validators: {
                    notEmpty: {
                        message: 'El modelo de el avión es requerido'
                    },
                    stringLength: {
                        min: 3,
                        max: 10,
                        message: 'El modelo del avión debe contener entre 3 y 10 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z0-9\s\ñ\Ñ\-]*$/,
                        message: 'No admitido'

                    }
                }
            },
            serie: {
                validators: {
                    notEmpty: {
                        message: 'La serie de el avión es requerida'
                    },
                    stringLength: {
                        min: 1,
                        max: 5,
                        message: 'La serie del avión debe contener entre 1 y 5 caracteres'
                    },
                    regexp: {
                        regexp: /^[0-9\-]*$/,
                        message: 'N° de serie incorrecto'

                    }
                }
            },
            capacidad: {
                validators: {
                    notEmpty: {
                        message: 'La capacidad de el avión es requerida'
                    },
                    stringLength: {
                        min: 3,
                        max: 3,
                        message: 'La capacidad minima del avión debe ser 300 y maxima 800 '
                    },
                    regexp: {
                        regexp: /^[0-9]*$/,
                        message: 'Ingrese solo numeros'
                    }
                }
            },
            estado: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione el estado del avíon'
                    }
                }
            },
            aerolinea: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione la empresa a la que se le compro el avión'
                    }
                }
            }
        }
    });
    /*********************************VALIDACIÓN DEL MODAL AVIÓN************************************/
    
     /*********************************VALIDACIÓN DEL MODAL ORIGEN************************************/
    $('#form-origen-modal').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            nombreaeropuerto: {
                validators: {
                    notEmpty: {
                        message: 'El nombre de el aeropuerto es requerido'
                    }, stringLength: {
                        min: 5,
                        max: 30,
                        message: 'El nombre debe contener entre 5 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            pais: {
                validators: {
                    notEmpty: {
                        message: 'El país es requerido'
                    }
                }
            },
            ciudad: {
                validators: {
                    notEmpty: {
                        message: 'La ciudad es requerida'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'La ciudad debe contener entre 3 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            }

        }
    });
    /*********************************FIN VALIDACIÓN DEL MODAL ORIGEN************************************/

    /*********************************VALIDACIÓN DEL MODAL DESTINO************************************/
    $('#form-destino-modal').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            nombreaeropuerto: {
                validators: {
                    notEmpty: {
                        message: 'El nombre de el aeropuerto es requerido'
                    }, stringLength: {
                        min: 5,
                        max: 30,
                        message: 'El nombre debe contener entre 5 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            pais: {
                validators: {
                    notEmpty: {
                        message: 'El paìs es requerido'
                    }
                }
            },
            ciudad: {
                validators: {
                    notEmpty: {
                        message: 'La ciudad es requerida'
                    },
                    stringLength: {
                        min: 3,
                        max: 30,
                        message: 'La ciudad debe contener entre 3 y 30 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            }

        }
    });
    /*********************************FIN VALIDACIÓN DEL MODAL DESTINO************************************/
    
     /*********************************VALIDACIÓN DEL MODAL PASAJERO************************************/
    $('#form-pasajeros-modal').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            nombre: {
                validators: {
                    notEmpty: {
                        message: 'Los nombres del pasajero son requerido'
                    }, stringLength: {
                        min: 5,
                        max: 50,
                        message: 'El nombre debe contener entre 5 y 50 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            apellido: {
                validators: {
                    notEmpty: {
                        message: 'Los apellidos del pasajero son requerido'
                    }, stringLength: {
                        min: 5,
                        max: 50,
                        message: 'El nombre debe contener entre 5 y 50 caracteres'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            sexo: {
                validators: {
                    notEmpty: {
                        message: 'El sexo del pasajero es requerido'
                    }
                }
            },

            edad: {
                validators: {
                    notEmpty: {
                        message: 'Ingresa una edad'
                    }, stringLength: {
                        min: 0,
                        message: 'Ingrese una edad valida'
                    },
                    regexp: {
                        regexp: /^[0-9]*$/,
                        message: 'Ingrese solo numeros'

                    }
                }
            },

            direccion: {
                validators: {
                    notEmpty: {
                        message: 'Ingrese una dirección'
                    }, stringLength: {
                        min: 0,
                        max: 50,
                        message: 'La dirección ingresada es incorrecta'
                    }
                }
            },
            telefono: {
                validators: {
                    notEmpty: {
                        message: 'El teléfono es requerido'
                    },
                    stringLength: {
                        min: 15,
                        message: 'El número ingresado es invalido'
                    }

                }
            },

            tipodocumento: {
                validators: {
                    notEmpty: {
                        message: 'El tipo de documento del pasajero es requerido'
                    }
                }
            },

            numerodocumento: {
                validators: {
                    notEmpty: {
                        message: 'El número de documento es obligatorio'
                    }
                }
            },

            fechavencimiento: {
                validators: {
                    notEmpty: {
                        message: 'La fecha de vencimiento del tipo de documento seleccionado es requerida'
                    }
                }
            },

            nacionalidad: {
                validators: {
                    notEmpty: {
                        message: 'Ingrese una nacionalidad'
                    }, stringLength: {
                        min: 4,
                        max: 25,
                        message: 'El nombre del país es incorrecto'
                    },
                    regexp: {
                        regexp: /^[A-Za-z\s\ñ\Ñ]*$/,
                        message: 'Ingrese solo letras'

                    }
                }
            },

            correo: {
                validators: {
                    notEmpty: {
                        message: 'Ingrese un correo'
                    },
                    regexp: {
                        regexp: /^[A-Za-z0-9\@\ñ\Ñ\.\_]*$/,
                        message: 'Ingrese un correo valido'

                    }
                }
            }
        }
    });
    /*********************************FIN VALIDACIÓN DEL MODAL PASAJERO************************************/
    
    /*********************************VALIDACIÓN MODAL ASIENTOS************************************/
    $('#form-asientos-modal').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            fila: {
                validators: {
                    notEmpty: {
                        message: 'La fila para el asiento es requerida'
                    }, stringLength: {
                        min: 1,
                        max: 3,
                        message: 'La fila debe ir del 1 al 100'
                    },
                    regexp: {
                        regexp: /^[0-9]*$/,
                        message: 'Ingrese solo numeros'

                    }
                }
            },

            columna: {
                validators: {
                    notEmpty: {
                        message: 'La columna para el asiento es requerida'
                    }, stringLength: {
                        min: 1,
                        max: 1,
                        message: 'La columa puede ir de la A a la Z'
                    },
                    regexp: {
                        regexp: /^[A-Z]*$/,
                        message: 'Ingrese solo letras Mayusculas'

                    }
                }
            }

        }
    });
    /*********************************FIN VALIDACIÓN MODAL ASIENTOS************************************/
    
    /*********************************VALIDACIÓN MODAL VUELOS************************************/
    $('#form-vuelos-modal').bootstrapValidator({

        message: 'Este valor no es valido',

        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {

            fechasalida: {
                validators: {
                    notEmpty: {
                        message: 'La fecha de salida del vuelo es requerida'
                    }
                }
            },

            fechallegada: {
                validators: {
                    notEmpty: {
                        message: 'La fecha de llegada del vuelo es requerida'
                    }
                }
            },
            horasalida: {
                validators: {
                    notEmpty: {
                        message: 'La hora de salida del vuelo es requerida'
                    }
                }
            },
            horallegada: {
                validators: {
                    notEmpty: {
                        message: 'La hora de llegada del vuelo es requerida'
                    }
                }
            },

            idavion: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione un avión'
                    }
                }
            },

            idorigen: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione el país de origen'
                    }
                }
            },

            iddestino: {
                validators: {
                    notEmpty: {
                        message: 'Seleccione el país de destino'
                    }
                }
            },
            costo: {
                validators: {
                    notEmpty: {
                        message: 'El costo del vuelo es requerido'
                    },
                    
                    regexp: {
                        regexp: /^[0-9\.]*$/,
                        message: 'Ingrese solo numeros'

                    }
                }
            }

        }
    });
    /*********************************FIN VALIDACIÓN MODAL PAGOS************************************/
});

    