Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B412572F4B5
	for <lists.virtualization@lfdr.de>; Wed, 14 Jun 2023 08:25:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC4DD41757;
	Wed, 14 Jun 2023 06:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC4DD41757
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Zvcm4N6S;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=QApKq3jk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NhJRV0oLYoZ9; Wed, 14 Jun 2023 06:25:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 131D9417B4;
	Wed, 14 Jun 2023 06:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 131D9417B4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19E2EC0089;
	Wed, 14 Jun 2023 06:25:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3CD5C0029
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jun 2023 06:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CBD781FAC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jun 2023 06:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CBD781FAC
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2023-03-30 header.b=Zvcm4N6S; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=QApKq3jk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y8fN7Ia6sWTo
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jun 2023 06:25:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C645881F79
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C645881F79
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jun 2023 06:25:25 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35E5ssH7028757; Wed, 14 Jun 2023 06:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=I9IYuaT9uOqGlkyot48B7vtc6EECn7XD6/+Mv7Vxl/w=;
 b=Zvcm4N6SiZmod6+8a3iK3NSeoaeZXdUcDUWpIeiJ9x5+EANMyVdSovLBgHnPh5JNCma9
 m5FfczyZI/9kCWwjaLDpAoRJtlGg4kxwYaIOQAWUXX4T/UtHNy0SqDFCQnisMaCf2pNX
 AzEUPDqey2dxWoUzMXNthcDA5LAKjYwHHzFbmAO+qggMDclq2QCX0jSlmTbq8T6m9rUj
 Fyzm2wQMjhyufsnGYMBntUL6y/UNtb8VK/8/ru+JLG/jKfLUCyIueR4DzNctUW4PNWXW
 BAGIK7Bd2MWWRQni2UhptKcw3IsJZmC/d5bDiuTpfCAuuy+ZckWk1ACgqonsJvgddwe7 iA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4g3bpvya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jun 2023 06:25:14 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 35E3haWU014211; Wed, 14 Jun 2023 06:25:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3r4fm4veav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jun 2023 06:25:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1xValaOUEDPA7GOeSsI8Wo0AhHjTpjHBdglOtyPZRWa8hiWRvHgOpUslKVNuQ5i3JFv9JGnQ/t86MG5OUnFNKufqsGvdFkcsWt3GIVGChoIZLFQ4tINmGABPYCXVELIdqVhCjAaxvu05J3+68VaZ/EPov11DHIJ8DCQt+0XBe4lo9OEK8nUayprsIbtL0dzQZo0dqh4Dtoq7tXptDdh151tUkMZ6y6p/RcpU8FSDPwz1UOT/k2p0CBmpyeooHaYuiiCJwvY41soowUI4EpNplOWf0oyF4FJQWmLrz6puPXgUQQNvgB3bBeW/1yHA6aV+cb19vl0ONsFtnG/2ZB2gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9IYuaT9uOqGlkyot48B7vtc6EECn7XD6/+Mv7Vxl/w=;
 b=AeY/NJ8ohQ7gjQ8usSxUizdyg0J4+gscJi/dT0g2y8qJ57f+3AsiL+AVqijO+jZF8+a2TfnpRTh2Sf8m1YEdzfBk/fhdnYVC1NybA46QP2EVh6uQ+OlhYa1VOGwXoiWT4PQRZVBGWv/zyZSdcrIKvDHb6CDlGMiuazuTDHFt9itj3Mvx4n+SUW/LIyV/10xITICuJYvfpiMGumGvv3WeMHvEiskK/kKY33DJvKAskt/K75VWpAuni9pkcqDt+5a4GOF6MOJbBJaLLW8/OjHJBnBhaHTaCsspF/V0tdbR2wyjUbkvBY/LdR7oIXJAb+3cOTU9d2dNlBwSH341cpxlhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9IYuaT9uOqGlkyot48B7vtc6EECn7XD6/+Mv7Vxl/w=;
 b=QApKq3jkzVvMBgVzICFH61uxucfBP+JtkqwlfPsjhaHt/BHo2mpTW6xwn8+za0s7HNBFrQon+/+wFonZM6CuD7ZFwP+54YJXgfUG9A1UwaKqt6bg8AfDo8g6/hGmIONwYBAZovBdxuacTT0dtrLsqs7y3gUfNyU45zhHz/ewc8k=
Received: from CY8PR10MB7243.namprd10.prod.outlook.com (2603:10b6:930:7c::10)
 by DS7PR10MB5151.namprd10.prod.outlook.com (2603:10b6:5:3a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 06:25:11 +0000
Received: from CY8PR10MB7243.namprd10.prod.outlook.com
 ([fe80::13d6:c3f3:2447:6559]) by CY8PR10MB7243.namprd10.prod.outlook.com
 ([fe80::13d6:c3f3:2447:6559%5]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 06:25:11 +0000
Message-ID: <f65f9809-7f52-5bb1-7e78-f22b813500c2@oracle.com>
Date: Wed, 14 Jun 2023 01:25:09 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: Can vhost translate to io_uring?
To: "Eric W. Biederman" <ebiederm@xmission.com>
References: <20230601183232.8384-1-michael.christie@oracle.com>
 <20230602192254.GD555@redhat.com>
 <87r0qt18qq.fsf_-_@email.froward.int.ebiederm.org>
 <ae250076-7d55-c407-1066-86b37014c69c@oracle.com>
 <20230605151037.GE32275@redhat.com>
 <03c07f48-8922-f563-560c-f0d4cc3e1279@oracle.com>
 <20230606121643.GD7542@redhat.com>
 <39f5913c-e658-e476-0378-62236bb4ed49@oracle.com>
 <20230606193907.GB18866@redhat.com>
 <cfbf1a0d-5d62-366f-f32f-6c63b151489e@oracle.com>
 <87mt12oa25.fsf_-_@email.froward.int.ebiederm.org>
Content-Language: en-US
From: michael.christie@oracle.com
In-Reply-To: <87mt12oa25.fsf_-_@email.froward.int.ebiederm.org>
X-ClientProxiedBy: DS7PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::34) To CY8PR10MB7243.namprd10.prod.outlook.com
 (2603:10b6:930:7c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR10MB7243:EE_|DS7PR10MB5151:EE_
X-MS-Office365-Filtering-Correlation-Id: 89154899-2bbc-4bba-03b5-08db6ca01b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L2a9OMz881ak96KneDgV4k34kJD9KBAlgtXI+S/NsA+iJt8goZ907a/djIc28HTEI32uQSHkgVmEmjYl17XYk8BOqdSL3BJfEPuyPdDOF7e4OOcEIaoQT02BESbD3H/mHURPbAXd9Kj8TDkaIHpmiFrMTumvPbZgwmV/fkWwQvduk/E+D2PWReSSaRQyUpHItN1eZXbgXm3Tx+LqhivcWue23oHKX8EotcFF0uO0XxhMeaMWDhyJyZDkydJLIhnDlH3RevgNd1lTEQwUtHGFqoNZ0Ngy6h7aW2nIothw+fJneWDnnvMl0yv5yYw5Xj0NsUgdYoED4zcYoJxOfoGdq4iCknVoKMXF3tARrNaifa/dwA48nqTyGn3KN78KRVY0gjGP5gEhesoaBT00WJRKmAuqkyfLtBMiR7xv07UnDlPVa/bMpottqySlMT1evOkQciK2coI9ZU1ysRiETmGRgXBRJx8Ym7+U7saAbJDpymsDgWO+HGdLB+Y/nSdkZW3wCPFBnKe2zKuKjpXtzOAdzYxSHdWCxnCThr3FPPy12dv1rtrBVbt981BfuICWYG2LAVa65LW3nBn2glLIZ8YCMncjsbWVrqSODXBU0vx7vFg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR10MB7243.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(2616005)(36756003)(83380400001)(31696002)(2906002)(86362001)(38100700002)(8936002)(8676002)(6486002)(316002)(966005)(41300700001)(5660300002)(478600001)(31686004)(66946007)(66476007)(66556008)(6916009)(4326008)(6506007)(6512007)(26005)(53546011)(9686003)(7416002)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0NXMi9tSTVpUWpIbWhzZnAzYlVmOVVya2tleXBVK2R3WlZwRjdUYUxhRU5E?=
 =?utf-8?B?Y1FHazhHaGNJdUppWHR4QWl4MVMyRG1TOFFzR1ZFZm5OWi9hR3g0eVVoY0lS?=
 =?utf-8?B?K0ZPQXQyVHE5K1ZCMGxiSDRXR0t5OEN0c2xyNU1Da0liY0FqeHFqSkJQTU9n?=
 =?utf-8?B?WDhMZTBUNERLc2MwMXViTWJvUUt6elQ3b29aYi9FMGhRcjVOdEd1eThLaUVZ?=
 =?utf-8?B?K09zRkV2YU9wbVdHNmd0LzdqUERyajZIVk5Ra2o1UzVSZ1ZpZVNhVnpEK2M1?=
 =?utf-8?B?ZzQzM3ZtdEEvZVFjVTlVODk2OXhVeXp3bFJTQUdBOUZLYlF0YkZxakx4VjZm?=
 =?utf-8?B?OHUyNzV1L1U4V2hVY2d1OXJqOUlyNTRab0puUEIvUTJucUh4STduZzg0eURt?=
 =?utf-8?B?WmNtdkxYeGtBL2dSenBRTFF2MTBBMlNpR1g0NHdIaHM5R0lQajBUdnR0R0sw?=
 =?utf-8?B?M0xzMkNlbG9xbHhMUThFWFRpaTA2ekQ5b2FTczd1SmlRMjJCQW9UclM0VFkx?=
 =?utf-8?B?cWRNWFBGYWRTcFFadE10c1dXcjJnaUR1ci9sUTZVK0NqL0k1K0h3NlZiYjhM?=
 =?utf-8?B?cS96dkordE9WWTBoUW5RWk5DbFFvbFVvNUxOQVdUQVhKQit1QkZ3bHdRTGVm?=
 =?utf-8?B?UGlzb1l5QVB0YVBlNXJCK2ZFR1l0NkhvZ05MVUxnYUR1L3NXNXJQMTU3N01q?=
 =?utf-8?B?aTRKYjdncmZFR1R0QnhkeDhvOTRWUmZ3bGZvbGM0K0lSOWtMalZ1QkZabEFI?=
 =?utf-8?B?Vng3djJuSHVJdmlqemJZSzZPN09wZ2xKMFJZcXRENE4rcXpqSDduRzJCZnB3?=
 =?utf-8?B?MWFuT1cvZTFaeFNOWW1jZjBaSERGRklzbHlsMUc1U2RvZDl3anBlUWhXcmRa?=
 =?utf-8?B?anhLRXJRT3FUZVUxVld3dDZ3alFGUU1lQ2prYUV3Skg0Tzhhd05xUFN6Wjh6?=
 =?utf-8?B?dHQrWUlWU2I3K2pSNGRLYk5ORjdoemtWWWNPY0YwQW5BUVVNdFhzajZRNDFj?=
 =?utf-8?B?SFkwR3hOU09Na2RkMThZaXZRanQ2emRhR1NHWGZxRVNlcElBZ0N2U1U0WE1L?=
 =?utf-8?B?a2l4Tm5YYWovK1pSVU5IV0hwT0w0S0ZvQy85cGlSTlN6RWVVQWRGcHJSYkdR?=
 =?utf-8?B?S25NVlZjWm1ia0cvbVJ4VTNKTllWaTE5Z3lQQzVkVXNHdW1XRkpveDF2a0Jt?=
 =?utf-8?B?QXR5MVpiVTRWMGRHYzNlbktpV2hEQnhOT2VMU2xxbWNyekJycy9GRGxsSTlj?=
 =?utf-8?B?Uit4UC8wZU9hdkt6dkxUNDBjMHF4aDVQc0lZQVlMWXhHV1o2NnczbklFaUdr?=
 =?utf-8?B?VEoxSHVBVmc1M1NSSXZKcUZWeFZscHU2ZjBxSGIvNWpjcnZTdTlPQW1hUGtZ?=
 =?utf-8?B?T2F2WTlFcWZ3OHk5UGk2bS94UERXNEYzT1ArZll1bDVVSjZqVGlKTzA4SUlZ?=
 =?utf-8?B?RDQyQ21jNyt5ZHovcTRNcXBqN0w4T0hWazc4N0xIRVNVU2JtTHJ0QVE3ZjFL?=
 =?utf-8?B?M0QzQUFCR1JwcGYxTVd3TzdQRjJpYUJQeU42WmowK094MmpJVVhGbElJanRv?=
 =?utf-8?B?dHg1enM1RjM5b1VEb1ZJOWZ6L2JLNjBSbGl4ZWlnR1duRnBtNlRSV1Z2RERX?=
 =?utf-8?B?ank5WnlyNHhjSnNFeVF0clppWnlmdkxycVFhNlJYOVBmVFFYRVFTQlNYR0hu?=
 =?utf-8?B?SGF6eGNQNENaMG9UcUdwMzNnd2lTbFY0bXVIODNIeFc1R2hRSHY2UDFadGlq?=
 =?utf-8?B?clR6VDM0SVhVeElPMUk2T1dDRWNsNzI2dVhWK2lLaUphWXZIemFIMFMyNTRV?=
 =?utf-8?B?QTdhQkxSaHNvcVNjSXZsMXRSY2pZNHFBYVgzL0ttbGNBOGNSb0p6ZWJyRnhI?=
 =?utf-8?B?YmlJZDJrcUVueG1qcGhITDhOaVpKcmxLeUg2SHhEUnF3eWFkNU5XUEp5YWRL?=
 =?utf-8?B?bnJBbjRtT3Z1T1ZVTlBjS1ZtVExLQ1JTc0YyYnZMejdWRzlxdld1c2pzUWFz?=
 =?utf-8?B?NUtGQW04OURFUkJxTjU2d3BtUE5QM051MU9WTzQwSEdhUzJGM2dmdDZhdzBN?=
 =?utf-8?B?QW5JMkl3dFRyU0thZjNoU2IxWmFRcmk5cS9scTZlU3VWWnY5UEcrYm93RHg1?=
 =?utf-8?B?L3A4ZkJDVHd2UlBOTFlPTkhEcE1yL04rbTR4b3VGRzlqV2JkeEM4Y2xTTTI5?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?VmtDMjI0V1hWdDR6UEw1ekcvOEM0SVdqQ3N2eUZSbTBhYndHdkVFZmJpc1hW?=
 =?utf-8?B?d0dnMkg3bjFKSDRvZUZKNjVMNjVtb2IzekNlZzE4bkxEZ0lZVmtOQk9iZkxJ?=
 =?utf-8?B?RE0rdUVNTmRRYU00bEdqV2JaN2hRR0VvbUV6QjFPUnhKT0xpVEwydStDcVR6?=
 =?utf-8?B?UkRCVkFlUjVQWldyYyt1WGpCdURBOThiWEp4MjFYdHArTUpYc0pQQ3IrbEN3?=
 =?utf-8?B?WnhDOVR5MUYzNHJuWUFKYmE2QmlqNVBQc0NOK0FVME84WnFPUkllS1dEYy9x?=
 =?utf-8?B?cE5VUlRiV2lpaXl5Y3c4dFhOTDVqRHFveldKZDZzOWNnOGQxOXIvSDVQQUo4?=
 =?utf-8?B?a3BYQ0xkRit6dkVNL3NtMFdNaVdVekY2Q1JQZkFmdG1KNDg1YWJRckk0Q29i?=
 =?utf-8?B?enJGMkpndnVjK3ExQXpYbFhnUUNENVNXMk8xV3RTM3ZqOTk3UUNOeTJ6THEr?=
 =?utf-8?B?ek5kMmFtdE40VFl5TEw4WDBqVzRVMzVxeVNJNXBHcXpSV3FMOXJTWW1GcGVv?=
 =?utf-8?B?L2pLVGpxemZmQXZZazdVQnhkUGtiRlJHK3BjTTl1Wng3NVJnTk1XaFBGekVJ?=
 =?utf-8?B?ZEhyNktBVkE2VVhOUm5sU2lQTkp5Y243UjZEWTRPanF4VlpXcDZGczFZT1RR?=
 =?utf-8?B?Tk8yejlXL3ZUbzJlZGErbmo0UE5UWUdCRi9rTnQxbDB4U1NrdjZNTXpGMVVJ?=
 =?utf-8?B?Ym5rU0wzT3Nmd3hQUXFWSXRGZHpMekJpK3ZWV25MbE8zNWg3ZFUvOWFPT25x?=
 =?utf-8?B?NkFzeGprdXBSVGFmeVlyRHQ3SFJpVHIyT2gvNmhzVmg2SmlXRG1wMkpjMkpQ?=
 =?utf-8?B?VWRUKyt4bVZtZlp2VUcyZXpWa3lDbVo3RFpOa1pxaUJaTzZJcDN1dy9vOFpx?=
 =?utf-8?B?UklSRGRqNFFLbjVPUVJrSUJhQ0V4OGVvM2JMQnNNSUMxMXh0aiswdDJ1bFY0?=
 =?utf-8?B?NzlkcE5sNmhrNmtDSS9vRFBTSzVSb1o1bUgzWk9VOUtzandYWUpCOHZkL1lX?=
 =?utf-8?B?MmdmaW9VVjFlTlNGVGxFclREdnlOMzE2Q0ZOcUNOY1gvM0xRK3d5N2pmcXBD?=
 =?utf-8?B?RjVNT0xDdzJMTStNM0tiOUJiYUdMazVXNWtrSEhnZWpScmZiYm5rVm9zWmEv?=
 =?utf-8?B?azhoWXBpM1lHMnZRYSsvZVFxbVJ1RFY1c0tEcnlscTVUUTFRc3Z2alV3d1V5?=
 =?utf-8?B?U01mbmVqamdRMitOcWgvWXpyc1JRUjZGTTZMSnptOFE4UWl4ejZhUGRVSFNx?=
 =?utf-8?B?YVpycnRJcC9FWS9qMCs0UmN3VkFCYk51WXZPSG5Ob1k0cnVpWSs3MVNUekJY?=
 =?utf-8?B?U1JhOUk0WXZiTjRRZDRhZU5HUG56YjduNW9GUFZEYzByM3AvcFl5T0ZVRXRa?=
 =?utf-8?B?MUpUWTFlMEVWbWljVFZvQTl2NThlaWtVWUdRMVNRZW9IaXdUODE4dUZmT29E?=
 =?utf-8?Q?vxdEoBxd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89154899-2bbc-4bba-03b5-08db6ca01b5f
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB7243.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 06:25:11.6137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnTL9kU3KAMAvpU4aBL52pLsRr+ad4FbeWu0HrlApEdLGeCvL4TB5erTk8uHEnL+g8QD17SvAb3CtZ+FnozeW+9sBqVYlhDCskFtMG4fxps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5151
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_03,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 mlxscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 mlxlogscore=759 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140054
X-Proofpoint-ORIG-GUID: VLr5iEHfA4Fh9r5blIL67AAV5DChCkJx
X-Proofpoint-GUID: VLr5iEHfA4Fh9r5blIL67AAV5DChCkJx
Cc: axboe@kernel.dk, brauner@kernel.org, mst@redhat.com,
 linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 stefanha@redhat.com, linux@leemhuis.info, nicolas.dichtel@6wind.com,
 virtualization@lists.linux-foundation.org, torvalds@linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 6/14/23 1:02 AM, Eric W. Biederman wrote:
> 
> I am sad my idea for simplifying things did not work out.
> 
> 
> Let's try an even bigger idea to reduce maintenance and simplify things.
> 
> Could vhost depend on io_uring?
> 
> Could vhost just be a translation layer of existing vhost requests to
> io_uring requests?
> 
> At a quick glance it looks like io_uring already supports the
> functionality that vhost supports (which I think is networking and
> scsi).
> 
> If vhost could become a translation layer that would allow removing
> the vhost worker and PF_USER_WORKER could be removed completely,
> leaving only PF_IO_WORKER.
> 
> 
> I suggest this because a significant vhost change is needed because in

It would be nice if the vhost layer could use the io-wq code as sort of
generic worker. I can look into what that would take if Jens is ok
with that type of thing.

For vhost, I just submitted a patch to the vhost layer that allow us to
switch out the vhost worker thread when IO is running:

https://lists.linuxfoundation.org/pipermail/virtualization/2023-June/067246.html

After that patch, I just need to modify vhost_worker/vhost_task_fn so
when get_signal returns true we set the worker to NULL and do a synchronize_rcu.
Then I just need to modify vhost-scsi so it detects when the worker is NULL
and modify the flush code so it handles work that didn't get to run.



> the long term the hacks in exec and coredump are not a good idea.  Which
> means something like my failed "[PATCH v3] fork, vhost: Use CLONE_THREAD
> to fix freezer/ps regression".
> 
> If we have to go to all of the trouble of reworking things it why can't
> we just make io_uring do all of the work?
> 
> Eric

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
