using Application.Dto;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Profiles
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<User, UserDto>();
            //ForMember(x => x.AllowedUseCases, opt => opt.MapFrom(user => user.UserUserCases.Select(uuc => new List<int> { uuc.UseCaseId })));//ne radi
            CreateMap<UserDto, User>().ForMember(x => x.UserUserCases, opt => opt.Ignore());
            //.ForMember(x => x.UserUserCases.Select(u => u.UseCaseId), opt => opt.MapFrom(dto => dto.AllowedUseCases))//ni ovo
        }
    }
}
