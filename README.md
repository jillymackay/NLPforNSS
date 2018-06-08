# Natural Language Processing for National Student Survey Data
A workflow for dealing with UK National Student Survey free text data, based off presentation given at University of Edinburgh Learning and Teaching Conference 2018

## About
At the [University of Edinburgh Learning and Teaching Conference 2018](https://www.ed.ac.uk/institute-academic-development/learning-teaching/cpd/workshops/learning-teaching-conference) our team gave a presentation called 'What Do Edinburgh Students Want? A mixed methods approach to NSS free text data'. 

This repository has some examples of how I use NLP to explore a sensitive but important dataset like the National Student Survey

# Ethics
*It is extremely important that you do not share your institute's NSS data!*
NSS data is provided to institutions -  but you do not own that data. A copy of the NSS privacy statement is below, but the most important part for this workflow is here:

> ### How will the information I provide be used?
>Your responses to the NSS will be used solely for research purposes, which includes providing information to allow the UK HE funding bodies to fulfil their statutory roles. The results of this research will be anonymous and provided in the form of statistical information only. We can assure you that you will NOT be identifiable in any published results.

> Your participation in this research, together with your individual responses to the questions, will be kept strictly confidential in line with information security requirements and standards as agreed between Ipsos MORI and HEFCE. We can also assure you that any information you provide during this research will NOT be used for marketing, nor will we sell your information to any third parties. If you have any questions about the NSS, please contact the research team at thestudentsurvey@ipsos.com.

Institutions may *not* use NSS free text data to identify students, and that data must not be shared on repositories such as this. 





















# NSS Privacy Statement
## This Was sourced from:


## Privacy Statement
### Who carries out the National Student Survey and why?
The National Student Survey (NSS) is being carried out by Ipsos MORI, an independent research agency, on behalf of the Higher Education Funding Council for England (HEFCE). HEFCE is a non-departmental government body, which exercises certain statutory functions under the Further & Higher Education Act 1992 (FHE Act 1992). The NSS forms part of HEFCE's legal requirement under this Act to ensure the quality of higher education in the institutions it funds.

HEFCE has also appointed a data dissemination provider, currently Texuna Technologies Ltd, to disseminate the results of the survey to participating institutions and students' unions.

HEFCE has also commissioned the survey on behalf of the Higher Education Funding Council for Wales (HEFCW), the Department for Economy Northern Ireland (DELNI), Health Education England (HEE), the Scottish Funding Council (SFC) and participating private higher education providers. These bodies are responsible for funding the survey. HEFCE may share student information, or parts of it, with these bodies who also use the survey results in the exercise of their statutory functions.

HEFCE, HEFCW, DELNI and SFC have a statutory role in ensuring the quality of teaching in higher education is assessed, and HEFCE and its partners believe that students' views should form an important part of the assessment. We will not disclose your information to any other organisation outside of those listed here.
On 1st April 2018, HEFCE will be replaced by the Office for Students (OfS), a new public body, established in law by the Higher Education and Research Act 2017. From this date forward, all HEFCE duties relating to this survey will be transferred to the OfS.

### What is the purpose of the NSS?
The higher education funding bodies and the government have agreed that there should be a regular national survey of students to obtain their views on the quality of the teaching, assessment, and support experienced. The NSS is an annual survey that gives students the opportunity to provide feedback on their learning experience.

The NSS also aims to assist future generations of higher education students in their choices of what and where to study, by allowing them to see anonymous feedback on subjects and institutions. It surveys students at higher education institutions in England, Wales, Northern Ireland and Scotland and students studying higher education courses in directly-funded further education colleges in England, Northern Ireland and Wales. Results are publicly available each year via the Unistats website.

### Who sees my personal information and how are my contact details obtained?
HEFCE may, from time to time, engage other non-statutory bodies or agents to carry out functions on their behalf. HEFCE has appointed Ipsos MORI to carry out this survey (NSS). Student information is initially collected by the Higher Education Statistics Agency (HESA) and the Education and Skills Funding Agency (ESFA) and supplied to HEFCE. HEFCE then requests student contact details from Higher Education Institutions, Further Education Colleges and Alternative Providers to be passed to Ipsos MORI in order to be able to conduct this survey. HEFCE, the statutory authority, will retain control of any personal data transferred under contract with non-statutory bodies.

For the purposes of the NSS, Ipsos MORI is acting as survey agent on behalf of HEFCE. HEFCE has a data protection agreement in place with Ipsos MORI, which provides the necessary protection under the law to safeguard students' information. For example, they are forbidden under contract with HEFCE from using the NSS data they have for any other purpose.

HEFCE also has a data protection agreement in place with Texuna Technologies Ltd, the organisation that currently disseminates the results of the survey and who receives parts of your survey data in a non-identifiable form. The agreement provides the necessary protection under the law to safeguard students' information.

HEFCE is committed to protecting your personal information and being clear about what information we hold about you and how we use it. HEFCE is the "data controller" of any personal information collated and transferred under contract with these survey agents. Your personal information will be kept strictly confidential by all parties involved, will be stored securely within the European Economic Area and will not be transferred outside that territory.

### What personal information do you collect about me?
The personal information we will collect and use as part of this survey is set out below:

* Names
* Date of birth
* Gender
* Contact details
* Course details
* Unique identifiers
* Ethnicity
* Religion (if applicable)
* Disability (if applicable)
* Survey responses
* Language preference (Welsh)
We can assure you that you will NOT be identifiable in any published results.
We also collect meta-data such as screen resolution, method of participation and time taken to complete the survey. This information is used only for survey development and evaluation purposes.

### How long will my personal information be held for?
Your personal data will be used for the purposes of the NSS only. All student contact details will be destroyed soon after the survey is complete, and Ipsos MORI will securely remove all other student data from their computer systems and transfer it to HEFCE. All data held by Texuna Technologies Ltd will be securely deleted at the end of the contract period. Responses to the NSS will be retained indefinitely by HEFCE for use in producing statistical analysis and research into quality and student experience, and trends in higher education. The information will not be used to make any decisions about individuals and any reports we publish will not include individualised data.

### How will the information I provide be used?
Your responses to the NSS will be used solely for research purposes, which includes providing information to allow the UK HE funding bodies to fulfil their statutory roles. The results of this research will be anonymous and provided in the form of statistical information only. We can assure you that you will NOT be identifiable in any published results.

Your participation in this research, together with your individual responses to the questions, will be kept strictly confidential in line with information security requirements and standards as agreed between Ipsos MORI and HEFCE. We can also assure you that any information you provide during this research will NOT be used for marketing, nor will we sell your information to any third parties. If you have any questions about the NSS, please contact the research team at thestudentsurvey@ipsos.com.

### Do I have to take part in this survey?
Participation in this research is voluntary; you do not have to take part. You can also ask Ipsos MORI to remove your details from the contact list being used for this survey, but Ipsos MORI will ask you to confirm your details to ensure that the correct records are removed from the database. It is important that students verify their identity so the NSS provides robust data for potential students and their advisors to make informed choices. If a student opts out at any stage, all personal information (contact details, date of birth, etc.) will be securely and permanently deleted from the contact list used for this survey and they will not be contacted by Ipsos MORI or HEFCE again.

In exceptional circumstances, it may be necessary for HEFCE to analyse student-level data relating to refusals or opt-outs. In this case, Ipsos MORI will securely transfer data to HEFCE about students who have actively opted out of the survey.
For further information, please contact the research team at thestudentsurvey@ipsos.com.

### How will the results of the survey be used?
HEFCE and the above bodies will use the results of the survey for the following purposes:
To publish aggregated and anonymised results of the survey in the following ways:

* Published 'in context' on the websites of institutions via a 'widget'. This is a small web application that displays information from the Unistats website for the course which the user is viewing.
* Published on the Unistats website that enables users to search and compare information about courses and institutions.
 + Data are also envisaged to be available via the UCAS course search tool (Course Finder), which will incorporate the Key Information Sets (KIS) data so users can view the data at the same time as viewing the courses to which they are interested in applying.
* For analysis. This may result in the UK funding bodies undertaking research or the release of data, including any open comments that you may make, to HEFCE approved users (on behalf of the other funding councils), such as academic researchers and sector organisations for the purpose of conducting analysis or research to enhance quality within Higher Education. HEFCE will retain control of the data under contract with such users or if that user is subcontracting, we will require they have the same controls. Reports will only present anonymised and aggregated data.
* To provide summary feedback to individual institutions. These data will be provided to institutions to help them identify where their strengths lie and also how they can make improvements. This summary feedback will be aggregated and anonymised, ensuring no individual student can be identified. These results may include the text of any comments that students provide at the end of the questionnaire. This text will not be attributed to individuals and students are advised to avoid making comments that: could enable them to be individually identified; name individuals; or make references that could identify an individual. Although names are removed from the NSS feedback, it may still be possible for those working at an institution to identify themselves and colleagues. Therefore, such information may be personal data and institutions are asked to bear this in mind when processing the data.

### Optional questions
Some institutions will ask their students optional or institution-specific questions. These questions are asked via the online survey only and provide additional confidential feedback to institutions. HEFCE and the above bodies use the information for the following purposes:

* To provide summary feedback to individual institutions. These data will be provided to institutions to help them identify where their strengths lie and how they can make improvements.
*	For statistical analysis. This may result in the release of data to other approved users, which may include academic researchers. HEFCE will retain control of the data under contract with such users or if that user is subcontracting, we will require they have the same controls. Reports will only present anonymised and aggregated data.
*	These data will not be published on the Unistats website.
*	Institutions may use the results of their own optional questions (this includes any institution-specific questions and questions from the optional bank of questions) publicly, should they wish, in marketing and publicity materials. However, the following principles must apply:
+	If results are to be used in this way, the publication thresholds of both 10 respondents and 50% response rate per cohort must be adhered to;
+	Free text comments should not be used in publicly available materials in order to preserve the anonymity of students; and
+	Institutions should not attribute these results to the NSS.
Although names are removed from the NSS feedback, it may still be possible for those working at an institution to identify themselves and colleagues. Therefore, such information may be personal data and institutions are asked to bear this in mind when processing the data.

### Can I provide feedback on the NSS?
Yes. Ipsos MORI, HEFCE and the above bodies are committed to continuously improving the NSS. Should you have a question, comment and/or complaint about this research, please contact Ipsos MORI by email sent to thestudentsurvey@ipsos.com.
Or by letter sent to: National Student Survey, Ipsos MORI, Kings House, Kymberley Road, Harrow, HA1 1PT

### How can I exercise my rights under the data protection legislation?
All information is used in compliance with the Data Protection Act 1998, and from 25 May 2018 with the General Data Protection Regulation (GDPR). Once your personal information has been collected, you have certain rights in relation to that personal information that may be exercised. You have the right to:

*	Ask for a copy of your personal information, for a small fee
*	Correct inaccurate personal information held about you
*	Ask for your personal information to be deleted (within certain limits)
*	Restrict processing of your personal information

You can find out more information about your rights under the GDPR at https://ico.org.uk.

If you have any concerns about the use of data for these purposes or would like to exercise one of your rights above, please contact HEFCE by emailing foi@hefce.ac.uk, by visiting http://www.hefce.ac.uk/contact/inforequest/dpa/, or by writing to the Data Protection Officer, Nicholson House, Lime Kiln Close, Stoke Gifford, BRISTOL, BS34 8SR.

If we are not able to resolve the issue to your satisfaction, you can also make a complaint to the data protection supervisory authority. In the UK, this is the Information Commissioner's Office (ICO) and they can be contacted at:
Information Commissioner's Office
Wycliffe House
Water Lane
Wilmslow
Cheshire
SK9 5AF
Tel: 0303 123 1113
Email: casework@ico.org.uk

### How can I obtain further details about this privacy statement or our compliance with it?
If you have any questions or require further information about this privacy statement, Ipsos MORI's compliance with data protection laws or the information held about you for this research; please contact HEFCE using the details above or Ipsos MORI's Compliance Department. They can be contacted by email sent to: compliance@ipsos.com with 17-056916-01 NSS 2018 as the subject or by letter sent to: Ref: 17-056916-01 NSS 2018, Compliance Department, Ipsos MORI UK Ltd, 3 Thomas More Square, London, E1W 1YW.

### How do HEFCE and Ipsos MORI ensure your personal information is held securely?
HEFCE and Ipsos MORI take responsibilities to keep your personal information secure very seriously. As such, we take every reasonable precaution to ensure your information is protected from loss, theft or misuse. These precautions include appropriate physical security of our offices, controlled access to computer systems and use of secure, encrypted internet connections when collecting personal information. 

Ipsos MORI has regular internal and external audits of its information security, and is registered to the International Standard for Information Security, ISO 27001. Ipsos MORI is a member of the Market Research Society, which means we sign up to carrying out market research in an ethical and compliant way.


