using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Api.Core;
using Application;
using Application.Commands;
using Application.Email;
using Application.Queries;
using DataAccess;
using Implementation.Commands;
using Implementation.Email;
using Implementation.Logging;
using Implementation.Queries;
using Implementation.Validators;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using AutoMapper;
using Implementation.Extensions;

namespace Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            services.AddScoped<DixotekaDbContext>();
            services.AddUsesCases();
            services.AddJwt();
            services.AddApplicationActor();
            services.AddValidators();
            services.AddSwagger();
            services.AddHttpContextAccessor();
            //services.AddTransient<IAppActor, FakeActor>();
            //da nije mozda zato sto nema allowed use cases ovaj moj iz baze?
            
            
            services.AddAutoMapper(typeof(QueryableExtensions).Assembly);//sta?
            //services.AddAutoMapper(this.GetType().Assembly);//sta?
            //JWT

            //vue

            //services.AddCors(options =>
            //{
            //    options.AddPolicy("VueCorsPolicy", builder =>
            //    {
            //        builder
            //        .AllowAnyOrigin()
            //        .AllowAnyHeader()
            //        .AllowAnyMethod()
            //        .AllowCredentials();
            //    });
            //});

            //SVEGER


        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseCors(x =>
            {
                x.AllowAnyOrigin();
                x.AllowAnyMethod();
                x.AllowAnyHeader();
            });

            app.UseRouting();

            app.UseMiddleware<GlobalExceptionHandler>();

            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger");
            });


            app.UseAuthentication();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
