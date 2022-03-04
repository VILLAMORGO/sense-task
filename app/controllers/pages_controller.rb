class PagesController < ApplicationController

    def home
        @tasks_overdue = current_account.tasks.where(status: ["Not started", "In progress"]).where.not(date: [Date.today.all_day, nil]).order("created_at DESC")
        @tasks_today = current_account.tasks.where(date: Date.today.all_day).order("created_at DESC")
        @tasks_completed = current_account.tasks.where(status: ["Completed"]).where.not(date: [nil]).order("created_at DESC")
        @tasks_undated = current_account.tasks.where(date: [nil, ""]).order("created_at DESC")
    end

end