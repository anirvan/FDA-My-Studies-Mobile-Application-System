<!-- 
  Copyright � 2017-2018 Harvard Pilgrim Health Care Institute (HPHCI) and its Contributors.
  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
  associated documentation files (the "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
  of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
  following conditions:
 
  The above copyright notice and this permission notice shall be included in all copies or substantial
  portions of the Software.
 
  Funding Source: Food and Drug Administration ("Funding Agency") effective 18 September 2014 as Contract no.
  HHSF22320140030I/HHSF22301006T (the "Prime Contract").
 
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
  OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  OTHER DEALINGS IN THE SOFTWARE. 
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<jsp:useBean id="date" class="java.util.Date" />
<c:set var="tz" value="America/Los_Angeles"/>
<style>
.time-opts .addBtnDis{
	display: none;
}
.time-opts:last-child .addBtnDis{
	display: inline-block;
}
.manually-option .addBtnDis{
	display: none;
}
.manually-option:last-child .addBtnDis{
	display: inline-block;
}
/* .time-opts .remBtnDis{
	display: initial;
} */
</style>
<!-- <div id="schedule" class="tab-pane fade in active mt-xlg"> -->
	<div class="gray-xs-f mb-sm">Active Task Frequency</div>
	<div class="pb-lg b-bor">
	   <span class="radio radio-info radio-inline p-40">
	   <input type="radio" id="oneTimeRadio1" class="schedule" frequencytype="oneTime" value="One time" name="frequency" ${empty activeTaskBo.frequency  || activeTaskBo.frequency=='One time' ?'checked':''} ${(activeTaskBo.isDuplicate > 0)?'disabled' : ''} >
	   <label for="oneTimeRadio1">One time</label> 
	   </span>
	   <span class="radio radio-inline p-40">
	   <input type="radio" id="dailyRadio2" class="schedule" frequencytype="daily" value="Daily" name="frequency" ${activeTaskBo.frequency=='Daily' ?'checked':''} ${(activeTaskBo.isDuplicate > 0) ?'disabled' : ''}>
	   <label for="dailyRadio2">Daily</label>
	   </span>
	   <span class="radio radio-inline p-40">
	   <input type="radio" id="weeklyRadio3" class="schedule" frequencytype="week" value="Weekly" name="frequency" ${activeTaskBo.frequency=='Weekly' ?'checked':''} ${(activeTaskBo.isDuplicate > 0) ?'disabled' : ''}>
	   <label for="weeklyRadio3">Weekly</label>
	   </span>
	   <span class="radio radio-inline p-40">
	   <input type="radio" id="monthlyRadio4" class="schedule" frequencytype="month" value="Monthly" name="frequency" ${activeTaskBo.frequency=='Monthly' ?'checked':''} ${(activeTaskBo.isDuplicate > 0) ?'disabled' : ''}>
	   <label for="monthlyRadio4">Monthly</label>
	   </span>
	   <span class="radio radio-inline p-40">
	   <input type="radio" id="manuallyRadio5" class="schedule" frequencytype="manually" value="Manually Schedule" name="frequency" ${activeTaskBo.frequency=='Manually Schedule' ?'checked':''} ${(activeTaskBo.isDuplicate > 0)?'disabled' : ''}>
	   <label for="manuallyRadio5">Custom Schedule</label>
	   </span>
	</div>
	<!-- One time Section-->    
	<form:form action="/fdahpStudyDesigner/adminStudies/saveOrUpdateActiveTaskSchedule.do?_S=${param._S}" name="oneTimeFormId" id="oneTimeFormId" method="post" role="form">
	 <input type="hidden" name="frequency" id="frequencyId" value="${activeTaskBo.frequency}">
	 <input type="hidden" name="previousFrequency" id="previousFrequency" value="${activeTaskBo.frequency}">
	 <input type="hidden" name="id" id="activeTaskId" class="activeTaskIdClass" value="${activeTaskBo.id}">
	 <input type="hidden" name="type" id="type" value="schedule">
	 <input type="hidden" name="studyId" id="studyId" value="${not empty activeTaskBo.studyId ? activeTaskBo.studyId : studyBo.id}">
	 <div class="oneTime all mt-lg">
	    <div class="gray-xs-f mb-sm">Date/Time of launch (pick one)<span class="requiredStar"> * </span></div>
	    <div class="mt-sm">
	       <span class="checkbox checkbox-inline">
	       <input type="hidden" name="activeTaskFrequenciesBo.id" id="oneTimeFreId" value="${activeTaskBo.activeTaskFrequenciesBo.id}">
	       <input type="checkbox" id="isLaunchStudy"  name="activeTaskFrequenciesBo.isLaunchStudy" value="true" ${activeTaskBo.activeTaskFrequenciesBo.isLaunchStudy ?'checked':''} ${(activeTaskBo.isDuplicate > 0)?'disabled' : ''}>
	       <label for="isLaunchStudy"> Launch with study</label>
	       </span>
	       <div class="mt-md form-group">
	          <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	          <input id="chooseDate" type="text" class="form-control calendar ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" name="activeTaskFrequenciesBo.frequencyDate" placeholder="Choose Date" value="${activeTaskBo.activeTaskFrequenciesBo.frequencyDate}" required <c:if test="${activeTaskBo.activeTaskFrequenciesBo.isLaunchStudy}"> disabled </c:if> />
	           <span class='help-block with-errors red-txt'></span>
	          </span>
	          <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	          <input id="selectTime" type="text" class="form-control clock ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}"  name="activeTaskFrequenciesBo.frequencyTime"  value="${activeTaskBo.activeTaskFrequenciesBo.frequencyTime}" required <c:if test="${activeTaskBo.activeTaskFrequenciesBo.isLaunchStudy}"> disabled </c:if>  placeholder="Select Time"  />
	          <span class='help-block with-errors red-txt'></span>
	          </span>
	       </div>
	    </div>
	    <div class="gray-xs-f mb-sm mt-md">Lifetime of the run and of the task (pick one)<span class="requiredStar"> * </span></div>
	    <div class="mt-sm">
	       <span class="checkbox checkbox-inline">
	       <input type="checkbox" id="isStudyLifeTime" class="" name="activeTaskFrequenciesBo.isStudyLifeTime" value="true" ${activeTaskBo.activeTaskFrequenciesBo.isStudyLifeTime ?'checked':''} required="required" ${(activeTaskBo.isDuplicate > 0)?'disabled' : ''}>
	       <label for="isStudyLifeTime"> Study Lifetime</label>
	       </span>
	       <div class="mt-md form-group">
	          <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	          <c:choose>
	          	<c:when test="${activeTaskBo.activeTaskFrequenciesBo.isStudyLifeTime}"><input id="chooseEndDate" type="text" class="form-control calendar ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" name="activeTaskLifetimeEnd" placeholder="Choose End Date" required <c:if test="${activeTaskBo.activeTaskFrequenciesBo.isStudyLifeTime }"> disabled </c:if> value=""/></c:when>
	          	<c:otherwise><input id="chooseEndDate" type="text" class="form-control calendar ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" name="activeTaskLifetimeEnd" placeholder="Choose End Date" required <c:if test="${activeTaskBo.activeTaskFrequenciesBo.isStudyLifeTime }"> disabled </c:if> value="${activeTaskBo.activeTaskLifetimeEnd}"/></c:otherwise>
	          </c:choose>
	          <span class='help-block with-errors red-txt'></span>
	          </span>                            
	       </div>
	    </div>
	 </div>
	</form:form>
	<!-- Daily Section-->    
	<form:form action="/fdahpStudyDesigner/adminStudies/saveOrUpdateActiveTaskSchedule.do?_S=${param._S}" name="dailyFormId" id="dailyFormId" method="post" role="form">
		 <input type="hidden" name="frequency" id="dailyFrequencyId" value="${activeTaskBo.frequency}">
		 <input type="hidden" name="previousFrequency" id="previousFrequency" value="${activeTaskBo.frequency}">
	  <input type="hidden" name="id" id="id" value="${activeTaskBo.id}">
	  <input type="hidden" name="studyId" id="studyId" value="${not empty activeTaskBo.studyId ? activeTaskBo.studyId : studyBo.id}">
	  <input type="hidden" name="type" id="type" value="schedule">
	  <input type="hidden" name="fetalCickDuration" value=""> 
	  <input type="hidden" name="id" class="activeTaskIdClass" value="${activeTaskBo.id}">
	 <div class="daily all mt-lg dis-none">
	    <div class="gray-xs-f mb-sm">Time(s) of the day for daily occurrence<span class="requiredStar"> *</span></div>
	    <div class="dailyContainer">
	    <c:if test="${fn:length(activeTaskBo.activeTaskFrequenciesList) eq 0}">
	     <div class="time-opts mt-md dailyTimeDiv" id="0">
	        <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	        <input id="time0" type="text" name="activeTaskFrequenciesList[0].frequencyTime" required class="form-control clock dailyClock ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" placeholder="Time" onclick ='timep(this.id);'/>
	        <span class='help-block with-errors red-txt'></span>
	        </span> 
	        <span class="addBtnDis addbtn mr-sm align-span-center ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" onclick='addTime();'>+</span>
	        <span class="delete vertical-align-middle remBtnDis hide pl-md align-span-center" onclick='removeTime(this);'></span>
	     </div>
	    </c:if>
	    <c:if test="${fn:length(activeTaskBo.activeTaskFrequenciesList) gt 0}">
	      <c:forEach items="${activeTaskBo.activeTaskFrequenciesList}" var="activeTasksFrequencies" varStatus="frequeincesVar">
	       <div class="time-opts mt-md dailyTimeDiv" id="${frequeincesVar.index}">
	       <input type="hidden" name="activeTaskFrequenciesList[${frequeincesVar.index}].id" value="${activeTasksFrequencies.id}">
	         <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	         <input id="time${frequeincesVar.index}" type="text" name="activeTaskFrequenciesList[${frequeincesVar.index}].frequencyTime" required class="form-control clock dailyClock ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" placeholder="Time" onclick ='timep(this.id);' value="${activeTasksFrequencies.frequencyTime}"/>
	         <span class='help-block with-errors red-txt'></span>
	         </span> 
	         <span class="addBtnDis addbtn mr-sm align-span-center ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" onclick='addTime();'>+</span>
	         <span class="delete vertical-align-middle remBtnDis hide pl-md align-span-center ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" onclick='removeTime(this);'></span>
	      </div>
	      </c:forEach>
	    </c:if>
	    </div>
	    <div class="mt-md">                        
	       <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	       <span class="gray-xs-f">Start date (pick a date)<span class="requiredStar"> * </span></span><br/>                          
	       <input id="startDate" type="text" class="form-control mt-sm calendar ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" placeholder="Choose Date" required name="activeTaskLifetimeStart" value="${activeTaskBo.activeTaskLifetimeStart}"/>
	       <span class='help-block with-errors red-txt'></span>
	       </span>
	       <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	       <span class="gray-xs-f">Number of times to repeat the task<span class="requiredStar"> * </span></span><br/>
	       <input id="days" type="text" class="form-control mt-sm numChk ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" name="repeatActiveTask" placeholder="No of Times"required value="${activeTaskBo.repeatActiveTask}" onkeypress="return isNumber(event, this)" pattern="^(0{0,2}[1-9]|0?[1-9][0-9]|[1-9][0-9][0-9])$" data-pattern-error="Please enter valid number." maxlength="3"/>
	        <span class='help-block with-errors red-txt'></span>
	       </span>
	    </div>
	    <div class="mt-md">
	       <div class="gray-xs-f mb-xs">End Date </div>
	       <div class="black-xs-f" id="endDateId">${not empty activeTaskBo.activeTaskLifetimeEnd ? activeTaskBo.activeTaskLifetimeEnd :'NA'}</div>
	       <input type="hidden" name="activeTaskLifetimeEnd" id="studyDailyLifetimeEnd" value="${activeTaskBo.activeTaskLifetimeEnd}">
	    </div>
	    <div class="mt-lg">
	       <div class="gray-xs-f mb-xs">Lifetime of each run</div>
	       <div class="black-xs-f">Until the next run comes up</div>
	    </div>
	    <div class="mt-lg">
	       <div class="gray-xs-f mb-xs">Lifetime of the task </div>
	       <div class="black-xs-f" id="lifeTimeId">${activeTaskBo.activeTaskLifetimeStart}  -  ${activeTaskBo.activeTaskLifetimeEnd}</div>
	    </div>
	 </div> 
	</form:form>
	<!-- Weekly Section-->    
	<form:form action="/fdahpStudyDesigner/adminStudies/saveOrUpdateActiveTaskSchedule.do?_S=${param._S}" name="weeklyFormId" id="weeklyFormId" method="post" role="form">
	  <input type="hidden" name="frequency" id="weeklyfrequencyId">
	  <input type="hidden" name="previousFrequency" id="previousFrequency" value="${activeTaskBo.frequency}">
	  <input type="hidden" name="id" id="id" class="activeTaskIdClass" value="${activeTaskBo.id}">
	  <input type="hidden" name="studyId" id="studyId" value="${not empty activeTaskBo.studyId ? activeTaskBo.studyId : studyBo.id}">
	  <input type="hidden" name="activeTaskFrequenciesBo.id" id="weeklyFreId" value="${activeTaskBo.activeTaskFrequenciesBo.id}">
	  <input type="hidden" name="type" id="type" value="schedule">
	 <div class="week all mt-lg dis-none">
	    <div>                        
	       <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	       <span class="gray-xs-f">Day/Time (of the week)<span class="requiredStar"> * </span></span><br/>
	       <select id="startDateWeekly" class="form-control mt-sm ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" name="dayOfTheWeek" required>
	        <option value=''>Select</option>
	        <option value='Sunday' ${activeTaskBo.dayOfTheWeek eq 'Sunday' ? 'selected':''}>Sunday</option>
	        <option value='Monday' ${activeTaskBo.dayOfTheWeek eq 'Monday' ?'selected':''}>Monday</option>
	        <option value='Tuesday' ${activeTaskBo.dayOfTheWeek eq 'Tuesday' ?'selected':''}>Tuesday</option>
	        <option value='Wednesday' ${activeTaskBo.dayOfTheWeek eq 'Wednesday' ?'selected':''}>Wednesday</option>
	        <option value='Thursday' ${activeTaskBo.dayOfTheWeek eq 'Thursday' ?'selected':''}>Thursday</option>
	        <option value='Friday' ${activeTaskBo.dayOfTheWeek eq 'Friday' ?'selected':''}>Friday </option>
	        <option value='Saturday' ${activeTaskBo.dayOfTheWeek eq 'Saturday' ?'selected':''}>Saturday</option>
	       </select>   
	       <span class='help-block with-errors red-txt'></span>                         
	       </span>
	       <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	       <span class="gray-xs-f">&nbsp;</span><br/>
	       <input id="selectWeeklyTime" type="text" class="form-control mt-sm clock ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" required onclick="timep(this.id)" placeholder="Time" name="activeTaskFrequenciesBo.frequencyTime" value="${activeTaskBo.activeTaskFrequenciesBo.frequencyTime}"/>
	       <span class='help-block with-errors red-txt'></span>
	       </span>                        
	    </div>
	    <div class="mt-md">                        
	       <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	       <span class="gray-xs-f">Start date<span class="requiredStar"> * </span></span><br/>                           
	       <input id="startWeeklyDate" type="text" class="form-control mt-sm calendar ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" required name="activeTaskLifetimeStart"  placeholder="Choose Date" value="${activeTaskBo.activeTaskLifetimeStart}" readonly="readonly"/>
	       <span class='help-block with-errors red-txt'></span>
	       </span>
	       <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	       <span class="gray-xs-f">Number of times to repeat the task <span class="requiredStar"> * </span></span><br/>
	       <input id="weeks" type="text" class="form-control mt-sm numChk ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" name="repeatActiveTask"  placeholder="No of Times" value="${activeTaskBo.repeatActiveTask}" required onkeypress="return isNumber(event, this)" pattern="^(0{0,2}[1-9]|0?[1-9][0-9]|[1-9][0-9][0-9])$" data-pattern-error="Please enter valid number." maxlength="3"/>
	       <span class='help-block with-errors red-txt'></span>
	       </span>
	    </div>
	    <div class="mt-md">
	       <div class="gray-xs-f mb-xs">End Date </div>
	       <div class="black-xs-f" id="weekEndDate">${not empty activeTaskBo.activeTaskLifetimeEnd ? activeTaskBo.activeTaskLifetimeEnd :'NA'}</div>
	       <input type="hidden" name="activeTaskLifetimeEnd" id="studyWeeklyLifetimeEnd" value="${activeTaskBo.activeTaskLifetimeEnd}">
	    </div>
	    <div class="mt-lg">
	       <div class="gray-xs-f mb-xs">Lifetime of each run</div>
	       <div class="black-xs-f">Until the next run comes up</div>
	    </div>
	    <div class="mt-lg">
	       <div class="gray-xs-f mb-xs">Lifetime of the task </div>
	       <div class="black-xs-f" id="weekLifeTimeEnd">${activeTaskBo.activeTaskLifetimeStart}  -  ${activeTaskBo.activeTaskLifetimeEnd}</div>
	    </div>
	 </div> 
	</form:form>
	<!-- Monthly Section-->   
	<form:form action="/fdahpStudyDesigner/adminStudies/saveOrUpdateActiveTaskSchedule.do?_S=${param._S}" name="monthlyFormId" id="monthlyFormId" method="post" role="form"> 
	 <input type="hidden" name="frequency" id="monthlyfrequencyId" value="${activeTaskBo.frequency}">
	 <input type="hidden" name="previousFrequency" id="previousFrequency" value="${activeTaskBo.frequency}">
	 <input type="hidden" name="id" id="id" class="activeTaskIdClass" value="${activeTaskBo.id}">
	 <input type="hidden" name="studyId" id="studyId" value="${not empty activeTaskBo.studyId ? activeTaskBo.studyId : studyBo.id}">
	 <input type="hidden" name="activeTaskFrequenciesBo.id" id="monthFreId" value="${activeTaskBo.activeTaskFrequenciesBo.id}">
	  <input type="hidden" name="type" id="type" value="schedule">
	 <div class="month all mt-lg dis-none">
	    <div>
	       <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	       <span class="gray-xs-f">Select Date/Time (of the month)<span class="requiredStar"> * </span></span><br/>                            
	       <input id="startDateMonthly" type="text" class="form-control mt-sm calendar ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" required  placeholder="Choose Date" name="activeTaskFrequenciesBo.frequencyDate" value="${activeTaskBo.activeTaskFrequenciesBo.frequencyDate}"/>
	       <span class='help-block with-errors red-txt'></span>
	       </span>
	       <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	       <span class="gray-xs-f">&nbsp;</span><br/>
	       <input id="selectMonthlyTime" type="text" class="form-control mt-sm clock ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" required onclick="timep(this.id)"  placeholder="Time" name="activeTaskFrequenciesBo.frequencyTime" value="${activeTaskBo.activeTaskFrequenciesBo.frequencyTime}"/>
	       <span class='help-block with-errors red-txt'></span>
	       </span>
	       <div class="gray-xs-f mt-md italic-txt text-weight-light">If the selected date is not available in a month, the last day of the month will be used instead</div>
	    </div>
	    <div class="mt-xs">                        
	       <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	       <span class="gray-xs-f">Start date<span class="requiredStar"> * </span></span><br/>      
	       <input id="pickStartDate" type="text" class="form-control mt-sm calendar ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}"  placeholder="Choose Start Date" required name="activeTaskLifetimeStart" value="${activeTaskBo.activeTaskLifetimeStart}" readonly="readonly"/>
	       <span class='help-block with-errors red-txt'></span>
	       </span>
	       <span class="form-group m-none dis-inline vertical-align-middle pr-md">
	       <span class="gray-xs-f">Number of times to repeat the task <span class="requiredStar"> * </span></span><br/>
	       <input id="months" type="text" class="form-control mt-sm numChk ${(activeTaskBo.isDuplicate > 0)?'cursor-none' : ''}" name="repeatActiveTask"  placeholder="No of Times" required value="${activeTaskBo.repeatActiveTask}" onkeypress="return isNumber(event, this)" pattern="^(0{0,2}[1-9]|0?[1-9][0-9]|[1-9][0-9][0-9])$" data-pattern-error="Please enter valid number." maxlength="3"/>
	        <span class='help-block with-errors red-txt'></span>
	       </span>
	    </div>
	    <div class="mt-md">
	       <div class="gray-xs-f mb-xs">End Date </div>
	       <div class="black-xs-f" id="monthEndDate">${not empty activeTaskBo.activeTaskLifetimeEnd ? activeTaskBo.activeTaskLifetimeEnd :'NA'}</div>
	       <input type="hidden" name="activeTaskLifetimeEnd" id="studyMonthlyLifetimeEnd" value="${activeTaskBo.activeTaskLifetimeEnd}">
	    </div>
	    <div class="mt-lg">
	       <div class="gray-xs-f mb-xs">Lifetime of each run</div>
	       <div class="black-xs-f">Until the next run comes up</div>
	    </div>
	    <div class="mt-lg">
	       <div class="gray-xs-f mb-xs">Lifetime of the task </div>
	       <div class="black-xs-f" id="monthLifeTimeDate">${activeTaskBo.activeTaskLifetimeStart}  -  ${activeTaskBo.activeTaskLifetimeEnd}</div>
	    </div>
	 </div> 
	</form:form>
	<!-- Manually Section-->    
	<form:form action="/fdahpStudyDesigner/adminStudies/saveOrUpdateActiveTaskSchedule.do?_S=${param._S}" name="customFormId" id="customFormId" method="post" role="form">
	<input type="hidden" name="id" id="id" value="${activeTaskBo.id}">
	   <input type="hidden" name="studyId" id="studyId" value="${not empty activeTaskBo.studyId ? activeTaskBo.studyId : studyBo.id}">
	   <input type="hidden" name="frequency" id="customfrequencyId" value="${activeTaskBo.frequency}">
	   <input type="hidden" name="previousFrequency" id="previousFrequency" value="${activeTaskBo.frequency}">
	    <input type="hidden" name="type" id="type" value="schedule">
	<div class="manually all mt-lg dis-none">
	    <div class="gray-xs-f mb-sm">Select time period<span class="requiredStar"> * </span></div>
	    <div class="manuallyContainer">
	      <c:if test="${fn:length(activeTaskBo.activeTaskCustomScheduleBo) eq 0}">
	      	<div class="manually-option mb-md form-group" id="0" >
	      	  <input type="hidden" name="activeTaskCustomScheduleBo[0].activeTaskId" id="activeTaskId" class="activeTaskIdClass" value="${activeTaskBo.id}">
	        <span class="form-group dis-inline vertical-align-middle pr-md">
	        <input id="StartDate0" type="text" count='0' class="form-control calendar customCalnder cusStrDate" name="activeTaskCustomScheduleBo[0].frequencyStartDate" value="" placeholder="Start Date" onclick='customStartDate(this.id,0);' required/>
	        <span class='help-block with-errors red-txt'></span>
	        </span>
	        <span class="gray-xs-f mb-sm pr-md align-span-center">
	        to 
	        </span>
	        <span class="form-group dis-inline vertical-align-middle pr-md">
	        <input id="EndDate0" type="text" count='0' class="form-control calendar customCalnder cusEndDate" name="activeTaskCustomScheduleBo[0].frequencyEndDate" placeholder="End Date" onclick='customEndDate(this.id,0);' required/>
	         <span class='help-block with-errors red-txt'></span>
	        </span>
	        <span class="form-group dis-inline vertical-align-middle pr-md">
	        <input id="customTime0" type="text" count='0' class="form-control clock cusTime" name="activeTaskCustomScheduleBo[0].frequencyTime" placeholder="Time" onclick='timep(this.id);' disabled required/>
	         <span class='help-block with-errors red-txt'></span>
	        </span>
	        <span class="addbtn addBtnDis align-span-center mr-md" onclick="addDate();">+</span>
	        <span id="delete" class="sprites_icon delete vertical-align-middle remBtnDis hide align-span-center" onclick="removeDate(this);"></span>
	     </div>
	      </c:if>
	      <c:if test="${fn:length(activeTaskBo.activeTaskCustomScheduleBo) gt 0}">
	      	<c:forEach items="${activeTaskBo.activeTaskCustomScheduleBo}" var="activeTaskCustomScheduleBo" varStatus="customVar">
	        <div class="manually-option mb-md form-group" id="${customVar.index}" >
	        	  <input type="hidden" name="activeTaskCustomScheduleBo[${customVar.index}].id" id="id" value="${activeTaskCustomScheduleBo.id}">
	        	  <input type="hidden" name="activeTaskCustomScheduleBo[${customVar.index}].used" id="isUsed${customVar.index}" value="${activeTaskCustomScheduleBo.used}">
	      	  	  <input type="hidden" name="activeTaskCustomScheduleBo[${customVar.index}].activeTaskId" id="activeTaskId" value="${activeTaskCustomScheduleBo.activeTaskId}">
	         <span class="form-group  dis-inline vertical-align-middle pr-md">
	         <input id="StartDate${customVar.index}" type="text" count='${customVar.index}' class="form-control calendar cusStrDate ${activeTaskCustomScheduleBo.used ?'cursor-none' : ''}" name="activeTaskCustomScheduleBo[${customVar.index}].frequencyStartDate" value="${activeTaskCustomScheduleBo.frequencyStartDate}" placeholder="Start Date" onclick='customStartDate(this.id,${customVar.index});' required/>
	         <span class='help-block with-errors red-txt'></span>
	         </span>
	         <span class="gray-xs-f mb-sm pr-md align-span-center">
	         to 
	         </span>
	         <span class="form-group  dis-inline vertical-align-middle pr-md">
	         <input id="EndDate${customVar.index}" type="text" count='${customVar.index}' class="form-control calendar cusEndDate ${activeTaskCustomScheduleBo.used ?'cursor-none' : ''}" name="activeTaskCustomScheduleBo[${customVar.index}].frequencyEndDate" value="${activeTaskCustomScheduleBo.frequencyEndDate}" placeholder="End Date" onclick='customEndDate(this.id,${customVar.index});' required/>
	          <span class='help-block with-errors red-txt'></span>
	         </span>
	         <span class="form-group  dis-inline vertical-align-middle pr-md">
	         <input id="customTime${customVar.index}" type="text" count='${customVar.index}' class="form-control clock cusTime ${activeTaskCustomScheduleBo.used ?'cursor-none' : ''}" name="activeTaskCustomScheduleBo[${customVar.index}].frequencyTime" value="${activeTaskCustomScheduleBo.frequencyTime}" placeholder="Time" onclick='timep(this.id);' required/>
	          <span class='help-block with-errors red-txt'></span>
	         </span>
	         <span class="addbtn addBtnDis align-span-center mr-md " onclick="addDate();">+</span>
	         <span id="delete" class="sprites_icon delete vertical-align-middle remBtnDis hide align-span-center ${activeTaskCustomScheduleBo.used ?'cursor-none' : ''}" onclick="removeDate(this);"></span>
	      </div>
	      	</c:forEach>
	      </c:if>
	    </div>
	    <div class="mt-md">
	       <div class="gray-xs-f mb-xs">Default Lifetime of each run </div>
	       <div class="black-xs-f">As defined by the start and end times selected above</div>
	    </div>
	 </div>
	</form:form> 
<!-- </div> -->
<script type="text/javascript">
var count = 0;
var customCount = 0;
var frequencey = "${activeTaskBo.frequency}";
customCount = '${customCount}';
count = '${count}'
var isValidManuallySchedule = true;
var multiTimeVal = true;
$(document).ready(function() {
 	checkDateRange();
	$('#monthEndDate').bind('contentchanged', function() {
		chkEndDateWithDate($('#months'), $('#monthEndDate'));
	});
	$('#endDateId').bind('contentchanged', function() {
		chkEndDateWithDate($('#days'), $('#endDateId'));
	});
	$('#weekEndDate').bind('contentchanged', function() {
		chkEndDateWithDate($('#weeks'), $('#weekEndDate'));
	});
 	customStartDate('StartDate'+customCount,customCount);
 	customEndDate('EndDate'+customCount,customCount);
	if($('.time-opts').length > 1){
		$('.dailyContainer').find(".remBtnDis").removeClass("hide");
	}else{
		$('.dailyContainer').find(".remBtnDis").addClass("hide");
	}
	if($('.manually-option').length > 1){
		$('.manuallyContainer').find(".remBtnDis").removeClass("hide");
	}else{
		$('.manuallyContainer').find(".remBtnDis").addClass("hide");
	}
	//var previousFrequency = $("previousFrequency").val();
	$(".schedule").change(function() {
		//alert("on change");
        $(".all").addClass("dis-none");
        var schedule_opts = $(this).attr('frequencytype');
        var val = $(this).val();
        console.log("val:"+val);
        $("." + schedule_opts).removeClass("dis-none");
        resetValidation($("#oneTimeFormId"));
        resetValidation($("#customFormId"));
        resetValidation($("#dailyFormId"));
        resetValidation($("#weeklyFormId"));
        resetValidation($("#monthlyFormId"));
        console.log("frequencey:"+frequencey);
        if((frequencey != null && frequencey != "" && typeof frequencey != 'undefined')){
        	if(frequencey != val){
        		if(val == 'One time'){
        			$("#chooseDate").val('');
        			$("#selectTime").val('');
        			$("#chooseEndDate").val('');
        			$("#oneTimeFreId").val('');
        			$("#isLaunchStudy").val('');
        			$("#isStudyLifeTime").val('');
        			var frequency_txt = "${questionnaireBo.frequency}";
            		if(frequency_txt != '' && frequency_txt != null && typeof frequency_txt != 'undefined'){
            			$("#previousFrequency").val(frequency_txt);
            		}
            	}else if(val == 'Manually Schedule'){
            		$('.manually').find('input:text').val('');    
            		isValidManuallySchedule = true;
            		$('.manually-option:not(:first)').find('.remBtnDis').click();
            		$('.manually-option').find('input').val('');
            		$('.manually-option').find('.cusTime').prop('disabled', true);
            	}else if(val == 'Daily'){
            		$("#startDate").val('');
            		$("#days").val('');
            		$("#endDateId").text('NA');
            		$("#lifeTimeId").text('-');
            		$('.dailyClock').val('');
            		$('.dailyClock:not(:first)').parent().parent().remove();
            		multiTimeVal = true;
            	}else if(val == 'Weekly'){
            		$("#startDateWeekly").val('');
            		$("#weeklyFreId").val('');
            		$("#activeTaskFrequenciesBo.frequencyTime").val('');
            		$("#startWeeklyDate").val('');
            		$("#weeks").val('');
            		$("#weekEndDate").text('NA');
            		$("#weekLifeTimeEnd").text('-');
            		$("#selectWeeklyTime").val('');
            	}else if(val == 'Monthly'){
            		$("#monthFreId").val('');
            		$("#selectMonthlyTime").val('');
            		$("#pickStartDate").val('');
            		$("#months").val('');
            		$("#monthEndDate").text('NA');
            		$("#monthLifeTimeDate").text('-');
            	}
        	}
        }else{
    		$('.oneTime').find('input:text').val(''); 
    		$(".daily").find('input:text').val('');    
    		$(".week").find('input:text').val('');    
    		$("#startDateWeekly").val('');
    		$(".month").find('input:text').val('');    
    		$('.manually').find('input:text').val('');    
    		$("#isLaunchStudy").val('');
			$("#isStudyLifeTime").val('');
			$("#monthEndDate").text('NA');
    		$("#monthLifeTimeDate").text('-');
    		$("#weekEndDate").text('NA');
    		$("#weekLifeTimeEnd").text('-');
    		$("#endDateId").text('NA');
    		$("#lifeTimeId").text('-');
    		$('.manually-option:not(:first)').find('.remBtnDis').click();
         	$('.manually-option').find('input').val('');
         	$('.dailyClock').val('');
            $('.dailyClock:not(:first)').parent().parent().remove();
            $('.manually-option').find('.cusTime').prop('disabled', true);
        }
        var flag = 'schedule';
        setFrequencyVal(flag);
    });
    if(frequencey != null && frequencey != "" && typeof frequencey != 'undefined'){
    	$(".all").addClass("dis-none");
    	if(frequencey == 'One time'){
    		$(".oneTime").removeClass("dis-none");
    	}else if(frequencey == 'Manually Schedule'){
    		$(".manually").removeClass("dis-none");
    	}else if(frequencey == 'Daily'){
    		$(".daily").removeClass("dis-none");
    	}else if(frequencey == 'Weekly'){
    		$(".week").removeClass("dis-none");
    	}else if(frequencey == 'Monthly'){
    		$(".month").removeClass("dis-none");
    	}
    }
    
    $('#chooseDate').not('.cursor-none, :disabled').datetimepicker({
        format: 'MM/DD/YYYY',
        minDate: serverDate(),
        useCurrent :false
    })
   	.on("dp.change", function (e) {
   		if(e.date._d) 
			$("#chooseEndDate").data("DateTimePicker").clear().minDate(new Date(e.date._d));
		else 
			$("#chooseEndDate").data("DateTimePicker").minDate(serverDate());
    });
    
    $(document).on('change dp.change ', '.dailyClock', function() {
   		
		$('.dailyContainer').find('.dailyTimeDiv').each(function() {
			var chkVal = true;
			var thisDailyTimeDiv = $(this);
			var thisAttr = $(this).find('.dailyClock');
			$('.dailyContainer').find('.dailyTimeDiv').each(function() {
				if(!thisDailyTimeDiv.is($(this)) && $(this).find('.dailyClock').val()) {
					if($(this).find('.dailyClock').val() == thisAttr.val()) {
						if(chkVal)
							chkVal = false;
					}
				}
			});
			if(!chkVal) {
			thisAttr.parents('.dailyTimeDiv').find('.dailyClock').parent().find(".help-block").html('<ul class="list-unstyled"><li>Please select a time that has not yet added.</li></ul>');
			} else {
				thisAttr.parents('.dailyTimeDiv').find('.dailyClock').parent().find(".help-block").html('');
			}
		});
		var a = 0;
		$('.dailyContainer').find('.dailyTimeDiv').each(function() {
			if($(this).find('.dailyClock').parent().find('.help-block.with-errors').children().length > 0) {
				a++;
			}
		});
		multiTimeVal = !(a > 0);
	});
	
    $('#chooseEndDate').not('.cursor-none, :disabled').datetimepicker({
        format: 'MM/DD/YYYY',
        minDate: serverDate(),
        useCurrent :false,
    });
    
    
    $('#startDate').not('.cursor-none, :disabled').datetimepicker({
        format: 'MM/DD/YYYY',
       // minDate: new Date(),
       useCurrent :false,
    }).on("dp.change", function (e) {
    	var startDate = $("#startDate").val();
    	var days = $("#days").val();
    	var endDate = ''
    	if(startDate && days && days > 0){
    		var dt = new Date(startDate);
            dt.setDate(dt.getDate() + Number(days) - 1);	
            endDate = formatDate(dt);
    	} else {
    		 startDate = '';
    		 endDate = '';
    	}
    	$("#studyDailyLifetimeEnd").val(endDate);
        $("#lifeTimeId").text(startDate+' - '+endDate);
        $("#endDateId").text(endDate);
    }).on("dp.show", function (e) {
        $('#startDate').data("DateTimePicker").minDate(serverDate());
    });
    $('#startDateMonthly').not('.cursor-none, :disabled').datetimepicker({
        format: 'MM/DD/YYYY',
       // minDate: new Date(),
       useCurrent :false,
    }).on("dp.show", function (e) {
        $('#startDateMonthly').data("DateTimePicker").minDate(serverDate());
    }).on("dp.change",function(e){
    	//$('#pickStartDate').data("DateTimePicker").minDate(e.date);
    	if(e.date._d != $('#pickStartDate').data("DateTimePicker").date()) {
    		$('#pickStartDate').val('');
    	}
    	var dateArr = []; 
	    for(var i = new Date(e.date._d).getFullYear(); i < 2108 ; i++) {
	    	for(var j= 0; j < 12 ; j++) {
	    		var allowedDate = new Date(i, j ,new Date(e.date._d).getDate());
	    		if(allowedDate.getMonth() !== j){
	    			allowedDate = new Date(i, j+1, 0);
	    		}
	    		dateArr.push(allowedDate);
	    	}
	    }
    	 $('#pickStartDate').data("DateTimePicker").enabledDates(dateArr);
    	//$('#pickStartDate').data("DateTimePicker").enabledDates([ moment(e.date), new Date(2020, 4 - 1, 3), "4/4/2014 00:53" ]);
    });
    
    $(".clock").not('.cursor-none').datetimepicker({
     	 format: 'h:mm a',
    	 useCurrent :false,
    });
    $(document).on('dp.change', '.cusStrDate', function(e) {
    	if(e.date._d) {
    		var nxtDate = moment(new Date(e.date._d)).add(1, 'days');
    	}
    	if(!$(this).parents('.manually-option').find('.cusEndDate').data("DateTimePicker")){
    		customEndDate($(this).parents('.manually-option').find('.cusEndDate').attr('id') ,0);
    	}
    	if(nxtDate)
			$(this).parents('.manually-option').find('.cusEndDate').val('').data("DateTimePicker").minDate(nxtDate);
	});
	$(document).on('dp.change change', '.cusStrDate, .cusEndDate', function() {
		if($(this).parents('.manually-option').find('.cusStrDate').val() && $(this).parents('.manually-option').find('.cusEndDate').val()) {
			$(this).parents('.manually-option').find('.cusTime').prop('disabled', false);
		} else {
			$(this).parents('.manually-option').find('.cusTime').prop('disabled', true);
		}
		resetValidation($(this).parents('form'));
	});
    
    $('#pickStartDate').not('.cursor-none, :disabled').datetimepicker({
        format: 'MM/DD/YYYY',
        
        //minDate: new Date(),
        useCurrent :false,
        ignoreReadonly : true
    }).on("dp.change",function(e){
    	var pickStartDate = $("#pickStartDate").val();
    	var months = $("#months").val();
    	$('#pickStartDate').attr("readonly",true);
    	if((pickStartDate != null && pickStartDate != '' && typeof pickStartDate != 'undefined') && (months != null && months != '' && typeof months != 'undefined')){
    		var dt = new Date(pickStartDate);
//     		var monthCount = Number(months)*30;
//     		console.log(monthCount)
//             dt.setDate(dt.getDate() + Number(monthCount));	
//             endDate = formatDate(dt);
			endDate = moment(moment(dt).add(Number(months), 'M')).format("MM/DD/YYYY");
            $("#studyMonthlyLifetimeEnd").val(endDate);
            $("#monthEndDate").text(endDate);
            $("#monthLifeTimeDate").text(pickStartDate+' - '+endDate);
    	}
    }).on("click", function (e) {
        $('#pickStartDate').data("DateTimePicker").minDate(serverDate());
    });
    $('#startWeeklyDate').not('.cursor-none, :disabled').datetimepicker({
        format: 'MM/DD/YYYY',
       // minDate: new Date(),
       useCurrent :false,
       ignoreReadonly : true
    }).on("dp.change", function (e) {
    	var weeklyDate = $("#startWeeklyDate").val();
    	var weeks = $("#weeks").val();
    	console.log("weeklyDate:"+weeklyDate);
    	console.log("weeks:"+weeks);
    	$('#startWeeklyDate').attr("readonly",true);
    	if((weeklyDate != null && weeklyDate != '' && typeof weeklyDate != 'undefined') && (weeks != null && weeks != '' && typeof weeks != 'undefined')){
    		var dt = new Date(weeklyDate);
    		var weekcount = Number(weeks)*7;
    		console.log(weekcount)
            dt.setDate(dt.getDate() + Number(weekcount));	
            endDate = formatDate(dt);
            $("#studyWeeklyLifetimeEnd").val(endDate);
            $("#weekEndDate").text(endDate);
            $("#weekLifeTimeEnd").text(weeklyDate+' - '+endDate);
    	}
    }).on("click", function (e) {
        $('#startWeeklyDate').data("DateTimePicker").minDate(serverDate());
    });
    $('.customCalnder').not('.cursor-none, :disabled').datetimepicker({
        format: 'MM/DD/YYYY',
        minDate: serverDate(),
        useCurrent :false,
    }); 
    var daysOfWeek = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'];
    $("#startDateWeekly").on('change', function(){
    	var weekDay = $("#startDateWeekly").val();
    	var weeks=[];
    	for(var i=0;i<daysOfWeek.length;i++){
    		if(weekDay != daysOfWeek[i]){
    			weeks.push(i);		
        	}    		
    	}
    	$('#startWeeklyDate').data("DateTimePicker").destroy();
    	$('#startWeeklyDate').not('.cursor-none, :disabled').datetimepicker({
            format: 'MM/DD/YYYY',
            minDate: serverDate(),
            daysOfWeekDisabled: weeks,
            useCurrent :false,
            ignoreReadonly : true
        }).on("dp.change", function (e) {
        	var weeklyDate = $("#startWeeklyDate").val();
        	var weeks = $("#weeks").val();
        	if((weeklyDate != null && weeklyDate != '' && typeof weeklyDate != 'undefined') && (weeks != null && weeks != '' && typeof weeks != 'undefined')){
        		var dt = new Date(weeklyDate);
        		var weekcount = Number(weeks)*7;
        		console.log(weekcount)
                dt.setDate(dt.getDate() + Number(weekcount));	
                endDate = formatDate(dt);
                $("#studyWeeklyLifetimeEnd").val(endDate);
                $("#weekEndDate").text(endDate);
                $("#weekLifeTimeEnd").text(weeklyDate+' - '+endDate);
        	}
        });
    	$('#startWeeklyDate').val('');
    });
   
    $("#days").on('change',function(){
    	console.log("change");
    	var startDate = $("#startDate").val();
    	var days = $("#days").val();
    	var endDate = ''
    	if(startDate && days && days > 0){
    		var dt = new Date(startDate);
            dt.setDate(dt.getDate() + Number(days) - 1);	
            endDate = formatDate(dt);
    	} else {
    		startDate = '';
   		 endDate = '';
    	}
    	$("#studyDailyLifetimeEnd").val(endDate).trigger('contentchanged');
        $("#lifeTimeId").text(startDate+' - '+endDate);
        $("#endDateId").text(endDate);
    })
    
    $("#weeks").on('change',function(){
    	var weeklyDate = $("#startWeeklyDate").val();
    	var weeks = $("#weeks").val();
    	console.log("weeklyDate:"+weeklyDate);
    	console.log("weeks:"+weeks);
    	if((weeklyDate != null && weeklyDate != '' && typeof weeklyDate != 'undefined') && (weeks != null && weeks != '' && typeof weeks != 'undefined')){
    		var dt = new Date(weeklyDate);
    		var weekcount = Number(weeks)*7;
    		console.log(weekcount)
            dt.setDate(dt.getDate() + Number(weekcount));	
            endDate = formatDate(dt);
            $("#studyWeeklyLifetimeEnd").val(endDate);
            $("#weekEndDate").text(endDate).trigger('contentchanged');
            $("#weekLifeTimeEnd").text(weeklyDate+' - '+endDate);
    	}
    });
    $("#months").on('change',function(){
    	var pickStartDate = $("#pickStartDate").val();
    	var months = $("#months").val();
    	if((pickStartDate != null && pickStartDate != '' && typeof pickStartDate != 'undefined') && (months != null && months != '' && typeof months != 'undefined')){
    		var dt = new Date(pickStartDate);
    		var monthCount = Number(months)*30;
//     		console.log(monthCount)
//             dt.setDate(dt.getDate() + Number(monthCount));	
//             endDate = formatDate(dt);
			endDate = moment(moment(dt).add(Number(months), 'M')).format("MM/DD/YYYY");
            $("#studyMonthlyLifetimeEnd").val(endDate);
            $("#monthEndDate").text(endDate).trigger('contentchanged');
            $("#monthLifeTimeDate").text(pickStartDate+' - '+endDate);
    	}
    });
    $("#isLaunchStudy").change(function(){
    	if(!$("#isLaunchStudy").is(':checked')){
    		$("#chooseDate").attr("disabled",false);
    		$("#selectTime").attr("disabled",false);
    		$("#chooseDate").required = false;
    		$("#selectTime").required = false;
    		$('#chooseDate').datetimepicker({
    	        format: 'MM/DD/YYYY',
    	        minDate: serverDate(),
    	        useCurrent :false
    	    })
    	   	.on("dp.change", function (e) {
    	   		if(e.date._d) 
    				$("#chooseEndDate").data("DateTimePicker").clear().minDate(new Date(e.date._d));
    			else 
    				$("#chooseEndDate").data("DateTimePicker").minDate(serverDate());
    	    });
    	}else{
    		$("#chooseDate").val('').attr("disabled",true);
    		$("#selectTime").val('').attr("disabled",true);
    		$("#chooseDate").required = true;
    		$("#selectTime").required = true;
    	}
    	resetValidation($(this).parents('form'));
    });
    $("#isStudyLifeTime").change(function(){
    	if(!$("#isStudyLifeTime").is(':checked')){
    		$("#chooseEndDate").attr("disabled",false);
    		$("#chooseEndDate").required = false;
    		$('#chooseEndDate').datetimepicker({
    	        format: 'MM/DD/YYYY',
    	        minDate: serverDate(),
    	        useCurrent :false
    	    });
    		$("#chooseEndDate").val('');
    	}else{
    		$("#chooseEndDate").val('').attr("disabled",true);
    		$("#chooseEndDate").required = true;
    	}
    	resetValidation($(this).parents('form'));
    });
    disablePastTime('#selectWeeklyTime', '#startWeeklyDate');
    disablePastTime('#selectMonthlyTime', '#startDateMonthly');
    disablePastTime('#selectTime', '#chooseDate');
	
    $(document).on('click change dp.change', '.cusStrDate, .cusTime', function(e) {
		if($(this).is('.cusTime') && !$(this).prop('disabled')) {
			disablePastTime('#'+$(this).attr('id'), '#'+$(this).parents('.manually-option').find('.cusStrDate').attr('id'));
		}
		if($(this).is('.cusStrDate') && !$(this).parents('.manually-option').find('.cusTime').prop('disabled')) {
			disablePastTime('#'+$(this).parents('.manually-option').find('.cusTime').attr('id'), '#'+$(this).attr('id'));
		}
	});
	$(document).on('click change dp.change', '.dailyClock, #startDate', function(e) {
		var dt = $('#startDate').val();
	   	var date = new Date();
	   	var day = date.getDate() >= 10 ? date.getDate() : ('0' + date.getDate());
	   	var month = (date.getMonth()+1) >= 10 ? (date.getMonth()+1) : ('0' + (date.getMonth()+1));
	   	var today = moment(serverDate()).format("MM/DD/YYYY");// month + '/' +  day + '/' + date.getFullYear();
// 	   	if($(this).is('#startDate')) {
// 			$(document).find('.dailyClock').val('');
// 		}
		$('.time-opts').each(function(){
			var id = $(this).attr("id");
			var timeId = '#time'+id;
			$(timeId).data("DateTimePicker").minDate(false);
			if(dt){
				if(dt != today){
		    		$(timeId).data("DateTimePicker").minDate(false); 
			   	}  else{
			    	$(timeId).data("DateTimePicker").minDate(serverDateTime());
			   }
				if($(timeId).val() && dt == today && moment($(timeId).val(), 'h:mm a').toDate() < serverDateTime()) {
					$(timeId).val('');
				}
			} else {
		   		$(timeId).data("DateTimePicker").minDate(false); 
		   	}
		});
	});
// 	updateLogoutCsrf();
});
function disablePastTime(timeId, dateId) {
	$(document).on('click change dp.change', timeId+', '+dateId, function() {
		var dt = $(dateId).val();
	   	var date = new Date();
	   	var day = date.getDate() >= 10 ? date.getDate() : ('0' + date.getDate());
	   	var month = (date.getMonth()+1) >= 10 ? (date.getMonth()+1) : ('0' + (date.getMonth()+1));
	   	var today = moment(serverDate()).format("MM/DD/YYYY");
	   	if(dt) {
	   		if(dt != today){
		    	$(timeId).data("DateTimePicker").minDate(false); 
		   	} else {
		    	$(timeId).data("DateTimePicker").minDate(serverDateTime());
		   }
	   		if($(timeId).val() && dt == today && moment($(timeId).val(), 'h:mm a').toDate() <  serverDateTime()) {
				$(timeId).val('');
			}
	   	} else {
	   		$(timeId).data("DateTimePicker").minDate(false); 
	   	}
	});
}
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [month, day, year].join('/');
}
function addTime(){
	count = count +1;
	var newTime = "<div class='time-opts mt-md dailyTimeDiv' id="+count+">"+
				  "  <span class='form-group m-none dis-inline vertical-align-middle pr-md'>"+
				  "  <input id='time"+count+"' type='text' required name='activeTaskFrequenciesList["+count+"].frequencyTime' placeholder='Time' class='form-control clock dailyClock' placeholder='00:00' onclick='timep(this.id);'/>"+
				  "<span class='help-block with-errors red-txt'></span>"+
				  " </span>"+ 
				  "  <span class='addBtnDis addbtn mr-sm align-span-center' onclick='addTime();'>+</span>"+
				  " <span class='delete vertical-align-middle remBtnDis hide pl-md align-span-center' onclick='removeTime(this);'></span>"+
				 "</div>";
	$(".time-opts:last").after(newTime);
	$(".time-opts").parents("form").validator("destroy");
    $(".time-opts").parents("form").validator();
	if($('.time-opts').length > 1){
		$(".remBtnDis").removeClass("hide");
	}else{
		$(".remBtnDis").addClass("hide");
	}
	timep('time'+count);
	$('#time'+count).val("");
	var flag = 'schedule';
	setFrequencyVal(flag);
	$('#'+count).find('input:first').focus();
}
function removeTime(param){
    $(param).parents(".time-opts").remove();
    $(".time-opts").parents("form").validator("destroy");
		$(".time-opts").parents("form").validator();
		if($('.time-opts').length > 1){
			$(".remBtnDis").removeClass("hide");
		}else{
			$(".remBtnDis").addClass("hide");
		}
	$(document).find('.dailyClock').trigger('dp.change');
	var flag = 'schedule';
    setFrequencyVal(flag);
}
function addDate(){
	customCount = customCount +1;
	var newDateCon = "<div class='manually-option mb-md form-group' id='"+customCount+"'>"
				  +"  <span class='form-group dis-inline vertical-align-middle pr-md'>"
				  +"  <input id='StartDate"+customCount+"' type='text' count='"+customCount+"' required name='activeTaskCustomScheduleBo["+customCount+"].frequencyStartDate' class='form-control calendar customCalnder cusStrDate' placeholder='Start Date' onclick='customStartDate(this.id,"+customCount+");'/>"
				  +"	<span class='help-block with-errors red-txt'></span>"
				  +"  </span>"
				  +"  <span class='gray-xs-f mb-sm pr-md align-span-center'>"
				  +"  to "
				  +"  </span>"
				  +"  <span class='form-group dis-inline vertical-align-middle pr-md'>"
				  +"  <input id='EndDate"+customCount+"' type='text' count='"+customCount+"' required name='activeTaskCustomScheduleBo["+customCount+"].frequencyEndDate' class='form-control calendar customCalnder cusEndDate' placeholder='End Date' onclick='customEndDate(this.id,"+customCount+");'/>"
				  +"<span class='help-block with-errors red-txt'></span>"
				  +"  </span>"
				  +"  <span class='form-group dis-inline vertical-align-middle pr-md'>"
				  +"  <input id='customTime"+customCount+"' type='text' count='"+customCount+"' required name='activeTaskCustomScheduleBo["+customCount+"].frequencyTime' class='form-control clock customTime cusTime' placeholder='Time' onclick='timep(this.id);' disabled/>"
				  +"<span class='help-block with-errors red-txt'></span>"
				  +"  </span>"
				  +"  <span class='addbtn addBtnDis align-span-center mr-md' onclick='addDate();'>+</span>"
				  +"  <span id='delete' class='sprites_icon delete vertical-align-middle remBtnDis hide align-span-center' onclick='removeDate(this);'></span>"
				  +"</div>";
				  
	$(".manually-option:last").after(newDateCon);
	$(".manually-option").parents("form").validator("destroy");
    $(".manually-option").parents("form").validator();
	if($('.manually-option').length > 1){
		$('.manuallyContainer').find(".remBtnDis").removeClass("hide");
	}else{
		$('.manuallyContainer').find(".remBtnDis").addClass("hide");
	}
	customStartDate('StartDate'+customCount,customCount);
	customEndDate('EndDate'+customCount,customCount);
	timep('customTime'+customCount);
	$('#customTime'+customCount).val("");
	$('#'+customCount).find('input:first').focus();
}
function removeDate(param){
    $(param).parents(".manually-option").remove();
    $(".manually-option").parents("form").validator("destroy");
		$(".manually-option").parents("form").validator();
		if($('.manually-option').length > 1){
			$('.manuallyContainer').find(".remBtnDis").removeClass("hide");
		}else{
			$('.manuallyContainer').find(".remBtnDis").addClass("hide");
		}
		$(document).find('.cusTime').trigger('dp.change');
}
function timep(item) {
    $('#'+item).not('.cursor-none').datetimepicker({
     	 format: 'h:mm a',
    	 useCurrent :false,
    });
}
function customStartDate(id,count){
	$('.cusStrDate').not('.cursor-none, :disabled').datetimepicker({
		format: 'MM/DD/YYYY',
        minDate: serverDate(),
        useCurrent :false,
    }).on("dp.change", function (e) {
    	$("#"+id).parent().removeClass("has-danger").removeClass("has-error");
        $("#"+id).parent().find(".help-block").html("");
        $("#EndDate"+count).parent().removeClass("has-danger").removeClass("has-error");
        $("#EndDate"+count).parent().find(".help-block").html("");
        var startDate = $("#"+id).val();
        var endDate = $("#EndDate"+count).val();
        if(startDate !='' && endDate!='' && toJSDate(startDate) > toJSDate(endDate)){
            $("#"+id).parent().addClass("has-danger").addClass("has-error");
       	   $("#"+id).parent().find(".help-block").html('<ul class="list-unstyled"><li>Start Date and Time Should not be greater than End Date and Time</li></ul>');
        }else{
     	   $("#activeTaskId").parent().removeClass("has-danger").removeClass("has-error");
            $("#activeTaskId").parent().find(".help-block").html("");
            $("#EndDate"+count).parent().removeClass("has-danger").removeClass("has-error");
            $("#EndDate"+count).parent().find(".help-block").html("");
            
        }
 });
}
function customEndDate(id,count){
	$('.cusEndDate').not('.cursor-none, :disabled').datetimepicker({
		format: 'MM/DD/YYYY',
        minDate: serverDate(),
        useCurrent :false,
    }).on("dp.change", function (e) {
    	$('#'+id).parent().removeClass("has-danger").removeClass("has-error");
        $('#'+id).parent().find(".help-block").html("");
        $("#StartDate"+count).parent().removeClass("has-danger").removeClass("has-error");
        $("#StartDate"+count).parent().find(".help-block").html("");
    	var startDate = $("#StartDate"+count).val();
        var endDate = $('#'+id).val();
        if(startDate!='' && endDate!='' && toJSDate(startDate) > toJSDate(endDate)){
        	$('#'+id).parent().addClass("has-danger").addClass("has-error");
       	    $('#'+id).parent().find(".help-block").html('<ul class="list-unstyled"><li>End Date and Time Should not be less than Start Date and Time</li></ul>');
        }else{
        	$('#'+id).parent().removeClass("has-danger").removeClass("has-error");
            $('#'+id).parent().find(".help-block").html("");
            $("#StartDate"+count).parent().removeClass("has-danger").removeClass("has-error");
            $("#StartDate"+count).parent().find(".help-block").html("");
        }
    });
}
function toJSDate( dateTime ) {
	if(dateTime != null && dateTime !='' && typeof dateTime != 'undefined'){
		var date = dateTime.split("/");
		return new Date(date[2], (date[0]-1), date[1]);
	}
}
function isNumber(evt, thisAttr) {
	evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if ((charCode < 48 && charCode > 57) || (charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122)){
    	 return false;
    }
    if((!$(thisAttr).val()) && charCode == 48) {
    	return false;
    }
    return true;
}
function saveActiveTask(item, actType, callback){
	var id = $("#activeTaskId").val();
	var study_id= $("#studyId").val();
	var title_text = $("#title").val();
	var frequency_text = $('input[name="frequency"]:checked').val();
	var previous_frequency = $("#previousFrequency").val();
	var isFormValid = true;
	
	var study_lifetime_end = '';
	var study_lifetime_start = ''
	var repeat_active_task = ''
	var type_text = $("#type").val();
	
	var activeTask = new Object();
	if(id != null && id != '' && typeof id != 'undefined'){
		activeTask.id=id;
	}
	if(frequency_text != null && frequency_text != '' && typeof frequency_text != 'undefined'){
		activeTask.frequency=frequency_text;
	}
	if(study_id != null && study_id != '' && typeof study_id != 'undefined'){
		activeTask.studyId=study_id;
	}
	if(title_text != null && title_text != '' && typeof title_text != 'undefined'){
		activeTask.title=title_text;
	}
	if(previous_frequency != null && previous_frequency != '' && typeof previous_frequency != 'undefined'){
		activeTask.previousFrequency=previous_frequency;
	}else{
		activeTask.previousFrequency=frequency_text;
	}
	if(type_text != null && type_text != '' && typeof type_text != 'undefined'){
		activeTask.type=type_text;
	}
	
	var activeTaskFrequencey = new Object();
	
	if(frequency_text == 'One time'){
		
		var frequence_id = $("#oneTimeFreId").val();
		var frequency_date = $("#chooseDate").val();
		var freQuence_time = $("#selectTime").val();
		if($('#isLaunchStudy').is(':checked')){
			var isLaunch_study = true;
		}
		if($('#isStudyLifeTime').is(':checked')){
			var isStudy_lifeTime = true;
		}
		
		study_lifetime_end = $("#chooseEndDate").val();
		if(study_lifetime_end != null && study_lifetime_end != '' && typeof study_lifetime_end != 'undefined'){
			activeTask.activeTaskLifetimeEnd=study_lifetime_end;
		}
		if(frequence_id != null && frequence_id != '' && typeof frequence_id != 'undefined'){
			activeTaskFrequencey.id=frequence_id;
		}
		if(frequency_date != null && frequency_date != '' && typeof frequency_date != 'undefined'){
			activeTaskFrequencey.frequencyDate=frequency_date;
			activeTask.activeTaskLifetimeStart=frequency_date;
		}
		if(freQuence_time != null && freQuence_time != '' && typeof freQuence_time != 'undefined'){
			activeTaskFrequencey.frequencyTime=freQuence_time;
		}
		if(isLaunch_study != null && isLaunch_study != '' && typeof isLaunch_study != 'undefined'){
			activeTaskFrequencey.isLaunchStudy=isLaunch_study;
		}
		if(isStudy_lifeTime != null && isStudy_lifeTime != '' && typeof isStudy_lifeTime != 'undefined'){
			activeTaskFrequencey.isStudyLifeTime=isStudy_lifeTime;
		}
		if(id != null && id != '' && typeof id != 'undefined'){
			activeTaskFrequencey.activeTaskId = id;
		}
		activeTask.activeTaskFrequenciesBo=activeTaskFrequencey;
		isFormValid = validateTime($("#chooseDate").not('.cursor-none, :disabled'), $("#selectTime").not('.cursor-none, :disabled'));
	}else if(frequency_text == 'Manually Schedule'){
		var customArray  = new Array();
		isFormValid = isValidManuallySchedule;
		$('.manually-option').each(function(){
			var activeTaskCustomFrequencey = new Object();
			activeTaskCustomFrequencey.activeTaskId = id;
			var id = $(this).attr("id");
			var startdate = $("#StartDate"+id).val();
			var enddate = $("#EndDate"+id).val();
			var time = $("#customTime"+id).val();
			var isUsed = $("#isUsed"+id).val();
			if(startdate != null && startdate != '' && typeof startdate != 'undefined'){
				activeTaskCustomFrequencey.frequencyStartDate=startdate;
			}
			if(enddate != null && enddate != '' && typeof enddate != 'undefined'){
				activeTaskCustomFrequencey.frequencyEndDate=enddate;
			}
			if(time != null && time != '' && typeof time != 'undefined'){
				activeTaskCustomFrequencey.frequencyTime=time;
			}
			if(isUsed) {
				activeTaskCustomFrequencey.used = isUsed;
			}
			customArray.push(activeTaskCustomFrequencey)
		})  
		activeTask.activeTaskCustomScheduleBo=customArray;
		if(isValidManuallySchedule) {
			$(document).find('.manually-option').each( function(){
				var returnFlag = validateTime($(this).find(".cusStrDate").not('.cursor-none, :disabled'), $(this).find(".cusTime").not('.cursor-none, :disabled'));
				if(isFormValid) {
					isFormValid = returnFlag;
				}
			});
		}
	}else if(frequency_text == 'Daily'){
		isFormValid = multiTimeVal;
		var frequenceArray = new Array();
		study_lifetime_start = $("#startDate").val();
		repeat_active_task = $("#days").val();
		study_lifetime_end = $("#endDateId").text();
		
// 		var fetalCickDuration = $('#inputClockId').val();
// 		if(fetalCickDuration){
// 			activeTask.fetalCickDuration = fetalCickDuration;
// 		}
		
		$('.time-opts').each(function(){
			var activeTaskFrequencey = new Object();
			var id = $(this).attr("id");
			var frequence_time = $('#time'+id).val();
			if(frequence_time != null && frequence_time != '' && typeof frequence_time != 'undefined'){
				activeTaskFrequencey.frequencyTime=frequence_time;
			}
			frequenceArray.push(activeTaskFrequencey);
		});
		activeTask.activeTaskFrequenciesList=frequenceArray;
		if(study_lifetime_start != null && study_lifetime_start != '' && typeof study_lifetime_start != 'undefined'){
			activeTask.activeTaskLifetimeStart=study_lifetime_start;
		}
		if(study_lifetime_end != null && study_lifetime_end != '' && typeof study_lifetime_end != 'undefined'){
			activeTask.activeTaskLifetimeEnd=study_lifetime_end;
		}
		if(repeat_active_task != null && repeat_active_task != '' && typeof repeat_active_task != 'undefined'){
			activeTask.repeatActiveTask=repeat_active_task;
		}
		activeTask.activeTaskFrequenciesBo=activeTaskFrequencey;
		  
		if(multiTimeVal && $('#dailyFormId').find('.numChk').val() && $('#dailyFormId').find('.numChk').val() == 0 || !validateTime($(document).find("#startDate").not('.cursor-none, :disabled'), $(document).find(".dailyClock").not('.cursor-none, :disabled'))){
			isFormValid = false;
		}
	}else if(frequency_text == 'Weekly'){
		
		var frequence_id = $("#weeklyFreId").val();
		study_lifetime_start = $("#startWeeklyDate").val();
		var frequence_time = $("#selectWeeklyTime").val();
		var dayOftheweek = $("#startDateWeekly").val();
		repeat_active_task = $("#weeks").val();
		study_lifetime_end = $("#weekEndDate").text();
		
		if(dayOftheweek != null && dayOftheweek != '' && typeof dayOftheweek != 'undefined'){
			activeTask.dayOfTheWeek=dayOftheweek;
		}
		if(study_lifetime_start != null && study_lifetime_start != '' && typeof study_lifetime_start != 'undefined'){
			activeTask.activeTaskLifetimeStart=study_lifetime_start;
		}
		if(study_lifetime_end != null && study_lifetime_end != '' && typeof study_lifetime_end != 'undefined'){
			activeTask.activeTaskLifetimeEnd=study_lifetime_end;
		}
		if(repeat_active_task != null && repeat_active_task != '' && typeof repeat_active_task != 'undefined'){
			activeTask.repeatActiveTask=repeat_active_task;
		}
		if(id != null && id != '' && typeof id != 'undefined'){
			activeTaskFrequencey.activeTaskId = id;
		}
		if(frequence_id != null && frequence_id != '' && typeof frequence_id != 'undefined'){
			activeTaskFrequencey.id=frequence_id;
		}
		if(frequence_time != null && frequence_time != '' && typeof frequence_time != 'undefined'){
			activeTaskFrequencey.frequencyTime=frequence_time;
		}
		activeTask.activeTaskFrequenciesBo=activeTaskFrequencey;
		if($('#weeklyFormId').find('.numChk').val() && $('#weeklyFormId').find('.numChk').val() == 0 || !validateTime($(document).find("#startWeeklyDate").not('.cursor-none, :disabled'), $(document).find("#selectWeeklyTime").not('.cursor-none, :disabled'))){
			isFormValid = false;
		}
	}else if(frequency_text == 'Monthly'){
		
		var frequence_id = $("#monthFreId").val();
		var frequencydate = $("#startDateMonthly").val();
		var frequencetime = $("#selectMonthlyTime").val();
		study_lifetime_start = $("#pickStartDate").val();
		repeat_active_task = $("#months").val();
		study_lifetime_end = $("#monthEndDate").text();
		
		if(study_lifetime_start != null && study_lifetime_start != '' && typeof study_lifetime_start != 'undefined'){
			activeTask.activeTaskLifetimeStart=study_lifetime_start;
		}
		if(study_lifetime_end != null && study_lifetime_end != '' && typeof study_lifetime_end != 'undefined'){
			activeTask.activeTaskLifetimeEnd=study_lifetime_end;
		}
		if(repeat_active_task != null && repeat_active_task != '' && typeof repeat_active_task != 'undefined'){
			activeTask.repeatActiveTask=repeat_active_task;
		}
		if(id != null && id != '' && typeof id != 'undefined'){
			activeTaskFrequencey.activeTaskId = id;
		}
		if(frequence_id != null && frequence_id != '' && typeof frequence_id != 'undefined'){
			activeTaskFrequencey.id=frequence_id;
		}
		if(frequencydate != null && frequencydate != '' && typeof frequencydate != 'undefined'){
			activeTaskFrequencey.frequencyDate=frequencydate;
		}
		if(frequencetime != null && frequencetime != '' && typeof frequencetime != 'undefined'){
			activeTaskFrequencey.frequencyTime=frequencetime;
		}
		activeTask.activeTaskFrequenciesBo=activeTaskFrequencey;
		if($('#monthlyFormId').find('.numChk').val() && $('#monthlyFormId').find('.numChk').val() == 0  || !validateTime($(document).find("#startDateMonthly").not('.cursor-none, :disabled'), $(document).find("#selectMonthlyTime").not('.cursor-none, :disabled'))){
			isFormValid = false;
		}
	}
	console.log("activeTask:"+JSON.stringify(activeTask));
	var data = JSON.stringify(activeTask);
	$(item).prop('disabled', true);
	if(study_id && isFormValid){
		if(actType !=='save'){
			console.log("inside schedule");
			var activetaskType = $('#targetOptionId').val();
			console.log("activetaskType::"+activetaskType);
// 			if((activetaskType && parseInt(activetaskType) == 1) && (frequency_text == 'One time' || frequency_text == 'Daily' || frequency_text == 'Manually Schedule')){
// 				if(frequency_text == 'One time')
// 		    		messageText = "Are you sure the activity lifetime has been set to be longer than the fetal kick record duration time?";
// 		    	if(frequency_text == 'Daily' || frequency_text == 'Manually Schedule')
// 		    		messageText = "Are you sure the lifetime of each run has been set to be longer than the fetal kick record duration time?";
// 		    	bootbox.confirm({
// 					closeButton: false,
// 					message : messageText,	
// 				    buttons: {
// 				        'cancel': {
// 				            label: 'No',
// 				        },
// 				        'confirm': {
// 				            label: 'Yes',
// 				        },
// 				    },
// 				    callback: function(result) {
// 				        if (result) {
// 				        	$("body").addClass("loading");
// 				    		$.ajax({ 
// 				    	        url: "/fdahpStudyDesigner/adminStudies/saveActiveTaskSchedule.do?_S=${param._S}",
// 				    	        type: "POST",
// 				    	        datatype: "json",
// 				    	        data: {activeTaskScheduleInfo:data},
// 				    	        beforeSend: function(xhr, settings){
// 				    	            xhr.setRequestHeader("X-CSRF-TOKEN", "${_csrf.token}");
// 				    	        },
// 				    	        success:function(data){
// 				    	      	var jsonobject = eval(data);			                       
// 				    				var message = jsonobject.message;
// 				    				if(message == "SUCCESS"){
// 				    					var activeTaskId = jsonobject.activeTaskId;
// 				    					var activeTaskFrequenceId = jsonobject.activeTaskFrequenceId;
// 				    					$("#activeTaskId, #taskId,#taskContentId,.activeTaskIdClass").val(activeTaskId);
// 				    					$("#previousFrequency").val(frequency_text);
// 				    					if(frequency_text == 'One time'){
// 				    						$("#oneTimeFreId").val(activeTaskFrequenceId);
// 				    					}else if(frequency_text == 'Weekly'){
// 				    						$("#weeklyFreId").val(activeTaskFrequenceId);
// 				    					}else if(frequency_text == 'Monthly'){
// 				    						$("#monthFreId").val(activeTaskFrequenceId);
// 				    					}
// 				    					frequencey = frequency_text;
// 				    				 	if (callback)
// 				    						callback(true);
// 				    				}else{
// 				    					if (callback)
// 				      						callback(false);
// 				    				}
// 				    	        },
// 				    				error: function(xhr, status, error) {
// 				    					$("body").removeClass("loading");
// 				    					if (callback)
// 				    						callback(false);
// 				    			  },
// 				    			complete : function() {
// 				    				$(item).prop('disabled', false);
// 				    			},
// 				    			global : false
// 				    	 	});
// 				        }else{
// 				        	$("#doneId").attr("disabled",false);
// 				        }
// 				    }
// 			   });
// 			}else{
				$("body").addClass("loading");
				$.ajax({ 
			        url: "/fdahpStudyDesigner/adminStudies/saveActiveTaskSchedule.do?_S=${param._S}",
			        type: "POST",
			        datatype: "json",
			        data: {activeTaskScheduleInfo:data},
			        beforeSend: function(xhr, settings){
			            xhr.setRequestHeader("X-CSRF-TOKEN", "${_csrf.token}");
			        },
			        success:function(data){
			      	var jsonobject = eval(data);			                       
						var message = jsonobject.message;
						//var errorMessage = jsonobject.errorMessage;
						if(message == "SUCCESS"){
							var activeTaskId = jsonobject.activeTaskId;
							var activeTaskFrequenceId = jsonobject.activeTaskFrequenceId;
							$("#activeTaskId, #taskId,#taskContentId,.activeTaskIdClass").val(activeTaskId);
							$("#previousFrequency").val(frequency_text);
							if(frequency_text == 'One time'){
								$("#oneTimeFreId").val(activeTaskFrequenceId);
							}else if(frequency_text == 'Weekly'){
								$("#weeklyFreId").val(activeTaskFrequenceId);
							}else if(frequency_text == 'Monthly'){
								$("#monthFreId").val(activeTaskFrequenceId);
							}
							frequencey = frequency_text;
							//alert("activeTaskId"+activeTaskId);
//		 					showSucMsg("Active task saved successfully");
						 	if (callback)
								callback(true);
						}else{
							//showErrMsg(errorMessage);
							if (callback)
		  						callback(false);
						}
			        },
						error: function(xhr, status, error) {
//						  	showErrMsg("Something went Wrong");
							$("body").removeClass("loading");
							if (callback)
								callback(false);
					  },
					complete : function() {
						$(item).prop('disabled', false);
					},
					global : false
			 	});	
			//}
		}else{
			$("body").addClass("loading");
			$.ajax({ 
		        url: "/fdahpStudyDesigner/adminStudies/saveActiveTaskSchedule.do?_S=${param._S}",
		        type: "POST",
		        datatype: "json",
		        data: {activeTaskScheduleInfo:data},
		        beforeSend: function(xhr, settings){
		            xhr.setRequestHeader("X-CSRF-TOKEN", "${_csrf.token}");
		        },
		        success:function(data){
		      	var jsonobject = eval(data);			                       
					var message = jsonobject.message;
					//var errorMessage = jsonobject.errorMessage;
					if(message == "SUCCESS"){
						var activeTaskId = jsonobject.activeTaskId;
						var activeTaskFrequenceId = jsonobject.activeTaskFrequenceId;
						$("#activeTaskId, #taskId,#taskContentId,.activeTaskIdClass").val(activeTaskId);
						$("#previousFrequency").val(frequency_text);
						if(frequency_text == 'One time'){
							$("#oneTimeFreId").val(activeTaskFrequenceId);
						}else if(frequency_text == 'Weekly'){
							$("#weeklyFreId").val(activeTaskFrequenceId);
						}else if(frequency_text == 'Monthly'){
							$("#monthFreId").val(activeTaskFrequenceId);
						}
						frequencey = frequency_text;
						//alert("activeTaskId"+activeTaskId);
//	 					showSucMsg("Active task saved successfully");
					 	if (callback)
							callback(true);
					}else{
						//showErrMsg(errorMessage);
						if (callback)
	  						callback(false);
					}
		        },
					error: function(xhr, status, error) {
//					  	showErrMsg("Something went Wrong");
						$("body").removeClass("loading");
						if (callback)
							callback(false);
				  },
				complete : function() {
					$(item).prop('disabled', false);
				},
				global : false
		 	});	
		}	
	}else{
		$("body").removeClass("loading");
		$(item).prop('disabled', false);
		if (callback)
			callback(false);
	}
}
function checkDateRange(){
	$(document).on('dp.change change', '.cusStrDate, .cusEndDate, .cusTime', function(e) {
		var chkVal = true;
		if($(this).parents('.manually-option').find('.cusStrDate').val() && $(this).parents('.manually-option').find('.cusEndDate').val() && $(this).parents('.manually-option').find('.cusTime').val()) {
			var thisAttr = this;
			$(this).parents('.manuallyContainer').find('.manually-option').each(function() {
				if((!$(thisAttr).parents('.manually-option').is($(this))) && $(this).find('.cusStrDate').val() && $(this).find('.cusEndDate').val() && $(this).find('.cusTime').val()) {
					var fromDate = moment($(this).find('.cusStrDate').val(), "MM/DD/YYYY").toDate();
					var cusTime =  moment($(this).find('.cusTime').val(), "HH:mm").toDate()
					fromDate.setHours(cusTime.getHours());
					fromDate.setMinutes(cusTime.getMinutes());
					var toDate = moment($(this).find('.cusEndDate').val(), "MM/DD/YYYY").toDate();
					toDate.setHours(cusTime.getHours());
					toDate.setMinutes(cusTime.getMinutes());
					var thisFromDate = moment($(thisAttr).parents('.manually-option').find('.cusStrDate').val(), "MM/DD/YYYY").toDate();
					var thisCusTime =  moment($(thisAttr).parents('.manually-option').find('.cusTime').val(), "HH:mm").toDate()
					thisFromDate.setHours(thisCusTime.getHours());
					thisFromDate.setMinutes(thisCusTime.getMinutes());
					var thisToDate = moment($(thisAttr).parents('.manually-option').find('.cusEndDate').val(), "MM/DD/YYYY").toDate();
					thisToDate.setHours(thisCusTime.getHours());
					thisToDate.setMinutes(thisCusTime.getMinutes());
					if(chkVal)
						chkVal = !((thisFromDate >= fromDate && thisFromDate <= toDate) || (thisToDate >= fromDate && thisToDate <= toDate));
				}
			});
		}
		if(!chkVal) {
			$(thisAttr).parents('.manually-option').find('.cusTime').parent().addClass('has-error has-danger').find(".help-block").removeClass('with-errors').html('<ul class="list-unstyled" style="font-size: 10px;"><li>Please ensure that the runs created do not have any overlapping time period.</li></ul>');
		} else {
			$(thisAttr).parents('.manually-option').find('.cusTime').parent().removeClass('has-error has-danger').addClass('with-errors').find(".help-block").html('');
		}	
		var a = 0;
		$('.manuallyContainer').find('.manually-option').each(function() {
			if($(this).find('.cusTime').parent().find('.help-block').children().length > 0) {
				a++;
			}
		});
		isValidManuallySchedule = !(a > 0);
	});
	return isValidManuallySchedule;
}
function doneActiveTask(item, actType, callback) {
		var frequency = $('input[name="frequency"]:checked').val();
    	console.log("frequency:"+frequency)
    	var valForm = false;
    	if(actType !=='save'){
	    	if(frequency == 'One time'){
	    		$("#frequencyId").val(frequency);
	    		if(isFromValid("#oneTimeFormId")){
	    			valForm = true;
	    		}
	    	}else if(frequency == 'Manually Schedule'){
	    		$("#customfrequencyId").val(frequency);
	    		if(isFromValid("#customFormId")){
	    			valForm = true;
	    		}
	    	}else if(frequency == 'Daily'){
	    		$("#dailyFrequencyId").val(frequency);
	    		if(isFromValid("#dailyFormId")){
	    			valForm = true;
	    		}
	    	}else if(frequency == 'Weekly'){
	    		$("#weeklyfrequencyId").val(frequency);
	    		if(isFromValid("#weeklyFormId")){
	    			valForm = true;
	    		}
	    	}else if(frequency == 'Monthly'){
	    		$("#monthlyfrequencyId").val(frequency);
	    		if(isFromValid("#monthlyFormId")){
	    			valForm = true;
	    		}
	    	}
    	} else {
    		valForm = true;
    	} 
    	if(valForm) {
			        saveActiveTask(item, actType, function(val) {
			    			if(!val){
			    				$('.scheduleTaskClass a').tab('show');
			    			}
							callback(val);
					});
    	} else {
    		showErrMsg("Please fill in all mandatory fields.");
    		$('.scheduleTaskClass a').tab('show');
    		if (callback)
    			callback(false);
    	}
}
function setFrequencyVal(flag){
	var frequencyType = $('input[name=frequency]:checked').val();
    if(frequencyType){
    	$('.activeaddToChartText').hide();
    	if(frequencyType == 'One time'){
    		$('.chartSection').hide();
    		
    		$('.addLineChartBlock_number_of_kicks_recorded_fetal').css("display","none");
   	   	    $('.addLineChartBlock_number_of_kicks_recorded_fetal').find('.requireClass').prop('required', false);
   	   	    $('#number_of_kicks_recorded_fetal_chart_id').val(false);
   	   	    $('#number_of_kicks_recorded_fetal_chart_id').prop('checked' , false);
   	   	    
   	   	    $('.addLineChartBlock_number_of_moves_tower').css("display","none");
   	   	    $('.addLineChartBlock_number_of_moves_tower').find('.requireClass').prop('required', false);
   	   	    $('#number_of_moves_tower_chart_id').val(false);
   	   	    $('#number_of_moves_tower_chart_id').prop('checked' , false);
    		
    		$('.addLineChartBlock_Score_spatial').css("display","none");
   	   	    $('.addLineChartBlock_Score_spatial').find('.requireClass').prop('required', false);
   	   	    $('#Score_spatial_chart_id').val(false);
   	   	    $('#Score_spatial_chart_id').prop('checked' , false);
   	   	    
   	   	    $('.addLineChartBlock_Number_of_Games_spatial').css("display","none");
	   	    $('.addLineChartBlock_Number_of_Games_spatial').find('.requireClass').prop('required', false);
	   	    $('#Number_of_Games_spatial_chart_id').val(false);
	   	    $('#Number_of_Games_spatial_chart_id').prop('checked' , false);
	   	    
	   	    $('.addLineChartBlock_Number_of_Failures_spatial').css("display","none");
	   	    $('.addLineChartBlock_Number_of_Failures_spatial').find('.requireClass').prop('required', false);
	   	    $('#Number_of_Failures_spatial_chart_id').val(false);
	   	    $('#Number_of_Failures_spatial_chart_id').prop('checked' , false);
    	}else{
    		$('.chartSection').show();
    		$('.addLineChartBlock_number_of_kicks_recorded_fetal').removeAttr("style");
    		$("#number_of_kicks_recorded_fetal_chart_id").prop("checked", true);
    		$('#number_of_kicks_recorded_fetal_chart_id').val(true);
    		$('.addLineChartBlock_number_of_kicks_recorded_fetal').find('.requireClass').prop('required', 'required');
    		$('#lineChartId').val('');
    		
   		    $('.addLineChartBlock_number_of_moves_tower').removeAttr("style");
   	   	    $('.addLineChartBlock_number_of_moves_tower').find('.requireClass').prop('required', 'required');
   	   	    $('#number_of_moves_tower_chart_id').val(true);
   	   	    $('#number_of_moves_tower_chart_id').prop('checked' , true);
    		
    		$('.addLineChartBlock_Score_spatial').removeAttr("style");
    		$("#Score_spatial_chart_id").prop("checked", true);
    		$('#Score_spatial_chart_id').val(true);
    		$('.addLineChartBlock_Score_spatial').find('.requireClass').prop('required', 'required');
    		
    		$('.addLineChartBlock_Number_of_Games_spatial').removeAttr("style");
    		$("#Number_of_Games_spatial_chart_id").prop("checked", true);
    		$('#Number_of_Games_spatial_chart_id').val(true);
    		$('.addLineChartBlock_Number_of_Games_spatial').find('.requireClass').prop('required', 'required');
    		$('#lineChartId1').val('');
    		
    		$('.addLineChartBlock_Number_of_Failures_spatial').removeAttr("style");
    		$("#Number_of_Failures_spatial_chart_id").prop("checked", true);
    		$('#Number_of_Failures_spatial_chart_id').val(true);
    		$('.addLineChartBlock_Number_of_Failures_spatial').find('.requireClass').prop('required', 'required');
    		$('#lineChartId2').val('');
    		
    		$('#lineChartId,lineChartId1,lineChartId2').val('');
    		
    		$("#chartId,#chartId1,#chartId2").html('');
    		$("#chartId,#chartId1,#chartId2").attr('required', 'required').prop('required', 'required');
    		$('.rollbackRadioClass').prop('checked', true);
    		$('.rollbackRadioClass').attr('checked', 'checked');
    		if(frequencyType == 'Daily'){
   	   	    	var dailyTimeLength = $('.dailyContainer').find('.dailyTimeDiv').length;
   	   	    	if(dailyTimeLength == 1){
	    			$("#chartId,#chartId1,#chartId2").append("<option value='Days of the current week'>Days of the current week</option>");
	    			$("#chartId,#chartId1,#chartId2").append("<option value='Days of the current month'>Days of the current month</option>");
   	   	    	}else{
	    			$("#chartId,#chartId1,#chartId2").append("<option value='24 hours of current day'>24 hours of current day</option>");
   	   	    	}
    		}
    		if(frequencyType == 'Weekly'){
    			$("#chartId,#chartId1,#chartId2").append("<option value='Weeks of the current month'>Weeks of the current month</option>");
    		}
    		if(frequencyType == 'Monthly'){
    			$("#chartId,#chartId1,#chartId2").append("<option value='Months of the current year'>Months of the current year</option>");
    		}
    		if(frequencyType == 'Manually Schedule'){
    			$("#chartId,#chartId1,#chartId2").append("<option value='Run-based'>Run-based</option>");
    			$('.activeaddToChartText').show();
    			$('.activeaddToChartText').html('A max of x runs will be displayed in each view of the chart.')
    		}
    	}
    	$('#chartId,#chartId1,#chartId2').selectpicker('refresh');
    }
}
function validateTime(dateRef, timeRef) {
	 var tm = $('#timepicker1').val();
	 var dt;
	 var valid = true;
	  dateRef.each(function() {
		  dt = dateRef.val();
		  if(dt) {
			  dt = moment(dt, "MM/DD/YYYY").toDate();
			  if(dt < serverDate()) {
				  $(this).parent().addClass('has-error has-danger');
// 				   .find('.help-block.with-errors').html('<ul class="list-unstyled"><li>Please select a time that has not already passed for the current date.</li></ul>');
				  $(this).data("DateTimePicker").clear();
			  } else {
				  $(this).parent().removeClass('has-error has-danger').find('.help-block.with-errors').html('');
			  }
			  timeRef.each(function() {
				  if($(this).val()){
					  thisDate = moment($(this).val(), "h:mm a").toDate();
					  dt.setHours(thisDate.getHours());
					  dt.setMinutes(thisDate.getMinutes());
					  if(dt < serverDateTime()) {
					   $(this).data("DateTimePicker").clear();
 					   $(this).parent().addClass('has-error has-danger');
// 					   .find('.help-block.with-errors').html('<ul class="list-unstyled"><li>Please select a time that has not already passed for the current date.</li></ul>');
					   if(valid)
						   valid = false;
					  } else {
// 					   $(this).parent().removeClass('has-error has-danger').find('.help-block.with-errors').html('');
					  }
				  }
			  });  
		  }
	  });
	 return valid;
	}
	
function validateCustTime(dateRef, timeRef) {
	 var dt;
	 var valid = true;
	  dateRef.each(function() {
		  dt = dateRef.val();
		  if(dt) {
			  dt = moment(dt, "MM/DD/YYYY").toDate();
			  if(dt < serverDate()) {
				  $(this).parent().addClass('has-error has-danger');
				  $(this).data("DateTimePicker").clear();
			  } else {
				  $(this).parent().removeClass('has-error has-danger').find('.help-block.with-errors').html('');
			  }
			  timeRef.each(function() {
				  if($(this).val()){
					  thisDate = moment($(this).val(), "h:mm a").toDate();
					  dt.setHours(thisDate.getHours());
					  dt.setMinutes(thisDate.getMinutes());
					  if(dt < serverDateTime()) {
					   $(this).data("DateTimePicker").clear();
					   $(this).parent().addClass('has-error has-danger');
//					   .find('.help-block.with-errors').html('<ul class="list-unstyled"><li>Please select a time that has not already passed for the current date.</li></ul>');
					   if(valid)
						   valid = false;
					  } else {
//					   $(this).parent().removeClass('has-error has-danger').find('.help-block.with-errors').html('');
					  }
				  }
			  });  
		  }
	  });
	 return valid;
	}
	var updateLogoutCsrf = function() {
		$('#logoutCsrf').val('${_csrf.token}');
		$('#logoutCsrf').prop('name', '${_csrf.parameterName}');
	}
	var chkEndDateWithDate = function(couterRef, endDateRef) {
		var dt = endDateRef.text();
		var valid = true;
		if(dt && (couterRef.val() !== 0)) {
			if(moment(dt, "MM/DD/YYYY").toDate() < serverDateTime()) {
				couterRef.parent().addClass('has-error has-danger').find('.help-block.with-errors').html('<ul class="list-unstyled"><li>Please ensure the End Date/Time is greater than current date/time.</li></ul>');
				valid = false;
			} else {
				couterRef.parent().removeClass('has-error has-danger').find('.help-block.with-errors').html('');
			}
		}
		return  valid;
	} 
//# sourceURL=filename.js
</script>