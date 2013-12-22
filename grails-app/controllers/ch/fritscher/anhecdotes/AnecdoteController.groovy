package ch.fritscher.anhecdotes

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class AnecdoteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [anecdoteInstanceList: Anecdote.list(params), anecdoteInstanceTotal: Anecdote.count()]
    }

    def create = {
        def anecdoteInstance = new Anecdote()
        anecdoteInstance.properties = params
        return [anecdoteInstance: anecdoteInstance]
    }

    def save = {
        def anecdoteInstance = new Anecdote(params)
        if (anecdoteInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'anecdote.label', default: 'Anecdote'), anecdoteInstance.id])}"
            redirect(action: "show", id: anecdoteInstance.id)
        }
        else {
            render(view: "create", model: [anecdoteInstance: anecdoteInstance])
        }
    }

    def show = {
        def anecdoteInstance = Anecdote.get(params.id)
        if (!anecdoteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anecdote.label', default: 'Anecdote'), params.id])}"
            redirect(action: "list")
        }
        else {
            [anecdoteInstance: anecdoteInstance]
        }
    }

    def edit = {
        def anecdoteInstance = Anecdote.get(params.id)
        if (!anecdoteInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anecdote.label', default: 'Anecdote'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [anecdoteInstance: anecdoteInstance]
        }
    }

    def update = {
        def anecdoteInstance = Anecdote.get(params.id)
        if (anecdoteInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (anecdoteInstance.version > version) {
                    
                    anecdoteInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'anecdote.label', default: 'Anecdote')] as Object[], "Another user has updated this Anecdote while you were editing")
                    render(view: "edit", model: [anecdoteInstance: anecdoteInstance])
                    return
                }
            }
            anecdoteInstance.properties = params
            if (!anecdoteInstance.hasErrors() && anecdoteInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'anecdote.label', default: 'Anecdote'), anecdoteInstance.id])}"
                redirect(action: "show", id: anecdoteInstance.id)
            }
            else {
                render(view: "edit", model: [anecdoteInstance: anecdoteInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anecdote.label', default: 'Anecdote'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def anecdoteInstance = Anecdote.get(params.id)
        if (anecdoteInstance) {
            try {
                anecdoteInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'anecdote.label', default: 'Anecdote'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'anecdote.label', default: 'Anecdote'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'anecdote.label', default: 'Anecdote'), params.id])}"
            redirect(action: "list")
        }
    }
}
