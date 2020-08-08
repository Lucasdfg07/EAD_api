class Api::TeacherClassesController < ApplicationController
    before_action :set_class, only: [:destroy, :show]
    
    def index
        if params[:week_day].blank? || params[:subject].blank? || params[:time].blank?
            render json: {status: 500, message: 'Não foi possível listar os dados.'}
        else
            time = format_time(params[:time])

            render json: TeacherClass.joins(:user)
                                     .joins(:class_schedule)
                                     .select("teacher_classes.*, users.*, class_schedules.*")
                                     .where(subject: params[:subject])
                                     .select { |teacher| teacher if time >= teacher.from && time < teacher.to }

        end
    end

    def create
        ActiveRecord::Base.transaction do
            create_user

            create_class

            create_class_schedule

            render json: {status: 200, message: 'Agendamento realizado com sucesso!'}
        end
        rescue
            render json: {status: 500, message: 'Não foi possível completar o Agendamento!'}
    end

    private

    def create_user
        @user = User.new(user_params)

        if !@user.save!
            render json: {status: 500, message: 'Não foi possível criar usuário!'}
        end
    end

    def create_class
        @class = TeacherClass.new(class_params)
        @class.user_id = @user.id

        if !@class.save!
            render json: {status: 500, message: 'Não foi possível criar classe de aula!'}
        end
    end

    def create_class_schedule
        params[:schedule].each do |schedule|
            from = format_time(schedule[:from])
            to = format_time(schedule[:to])

            @schedule = ClassSchedule.new(from: from, to: to, week_day: schedule[:week_day])
            @schedule.teacher_class_id = @class.id
            
            if !@schedule.save!
                render json: {status: 500, message: 'Não foi possível fazer o agendamento!'}
            end
        end
    end

    def format_time(time_to_format)
        TimeFormatter.new(time_to_format).call
    end

    def set_class
        @class = TeacherClass.find(params[:id])
    end

    def user_params
        params.permit(:name, :avatar, :bio, :whatsapp)
    end

    def class_params
        params.permit(:subject, :cost)
    end
end
