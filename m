Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C383F636D9E
	for <lists.virtualization@lfdr.de>; Wed, 23 Nov 2022 23:53:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F145D815CC;
	Wed, 23 Nov 2022 22:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F145D815CC
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=nMYuwp7h;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=eWuRxGDy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMlOBwrE6D5v; Wed, 23 Nov 2022 22:53:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 66C7481D11;
	Wed, 23 Nov 2022 22:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C7481D11
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71849C0078;
	Wed, 23 Nov 2022 22:53:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46916C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Nov 2022 22:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DDD041978
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Nov 2022 22:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DDD041978
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=nMYuwp7h; 
 dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com
 header.i=@oracle.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-oracle-onmicrosoft-com header.b=eWuRxGDy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wnUip1qQJso7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Nov 2022 22:53:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3908400F5
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3908400F5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Nov 2022 22:53:06 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANLtbJ4008802; Wed, 23 Nov 2022 22:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=55myybKgkjGd4IPnDqmE9BXsE8X4jdoZV8vBLE+S0BE=;
 b=nMYuwp7h2+kvbXDP9BuC1JIoUMa3vq65VqniWq58prlkbBD0bo2/nJ79MUgO7WBPhe5Y
 j1Usoc2Nnlb94Yg5aHBdQ5JQqC49VlSEyr+nbHXfXACab6+7FuiqAsicrdZUXzYhx8zt
 sHLVFIrDv8MrUPaVfBoXSGraOIv8cPK0xFDuHiyd5Idgl0+PYvXLomkZR++PGn2SuF/2
 u+FPYFLUzqREKJ8jmjwwWEm3WZRIpyF5g8i5DFB1Ph9FhZkekVb+pQ7Iw4+lwGAMjaDr
 0F5/jGqwgw62SaM2UVGiPWZwUQrlbLft/ujtUqSjkYHQuRYw0WNTHOSu7FaXIm30yXBB pw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3m1nd896kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Nov 2022 22:53:00 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2ANLLXkA009708; Wed, 23 Nov 2022 22:52:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kxnk7pbjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Nov 2022 22:52:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXcS3STbxfGI4erHribvUXk30NCIospgAAdzKMzoyoe2nD8ZzmMB/+bhpWx1jK9KuGj00CzJrYvD04r/yW0CCg5SyTPiSIA5enJ4WH2qLB6fk+JKoaRLA1wu2jQxELNxmaIttJnzaI+93jlwrWfFMA+XqBszL2rCI5+XavDIEOkC7FJaW4FkK1eufj4E3B4YQP/Vk/2SOfWsAC0u/9W03HzCuqByZv0eZY9FN5rCCq9031p79KYnP36rqzG2rfVtN31m2uiXqLhN73EAzfsBtDpCcgcyos6+0mcw7y2Xi4hr/71LjK/sHz1+HtpcvDOsYtiBDfoqG0GlZYlqzpwdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55myybKgkjGd4IPnDqmE9BXsE8X4jdoZV8vBLE+S0BE=;
 b=HLKFa9K51AcBwR9RysrFtwtcyshCHNSk5tt3N8eucCO/lZBAEUA5Hzi5cMRpnWCHvbUf1hOEaU+KqVdRg97tUsCbbRRT35vEKUQ7ZDsLUnRsPDlFk1VHSw4uPYhON3ju9l9mXPgy+8J20VvEzq4aN2UC2YzEdO2fazz/GOyIibZupcx6/VgcwD3zP1UqzSOKIpbGkXUNSkiKq1Yrnd/rNOzXv45uOJTyUnBIKHU2vBdyMk+svGKtLxCkVeub4NVohGzIvC+Ju5MQWu1mw3PFQDRxTyj0Lkq4+uQTidvbw9JbCBhSNIbVOQzgv+40bPhLYU8IudaYDXiRnF3ED3yTeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55myybKgkjGd4IPnDqmE9BXsE8X4jdoZV8vBLE+S0BE=;
 b=eWuRxGDyUdes/ewMNro1hxf5jOvvzTZWtfMJeAgEUVB3s4Fi2mkvuEoI+RhuraebEkXTXJrRDtLdpJCfWQjAaz5wXpWjxDANGZ7KnYK7PvQnShuE6YIg7PXBKCqSExYZtHw21Kt9Z3gjdqnvTO340+5RRaxQF01fqrS0gLklhWc=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by CO6PR10MB5588.namprd10.prod.outlook.com (2603:10b6:303:147::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 22:52:57 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::d1e:40c4:40e3:e7b5]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::d1e:40c4:40e3:e7b5%2]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 22:52:57 +0000
Message-ID: <74909b12-80d5-653e-cd1c-3ea6bc5dbbde@oracle.com>
Date: Wed, 23 Nov 2022 14:52:52 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V2] vdpa: allow provisioning device features
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
References: <20221117033303.16870-1-jasowang@redhat.com>
 <84298552-08ec-fe2d-d996-d89918c7fddf@oracle.com>
 <CACGkMEtLFTrqdb=MXKovP8gZzTXzFczQSmK0PgzXQTr0Dbr5jA@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEtLFTrqdb=MXKovP8gZzTXzFczQSmK0PgzXQTr0Dbr5jA@mail.gmail.com>
X-ClientProxiedBy: DM6PR08CA0037.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::11) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|CO6PR10MB5588:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ba1a26-718a-4bdf-3084-08dacda57680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yt1j7mFVkQSRdPCJDSEAQrDpJuwgwTsuMwO/ezIK8f/ryeP8gkZFYt1sShpwqrbI+z1nwER7AoOTmGrh0DqAiQFHKc3HBV/RudLbhkRIs2ISsezTJOAOURo18VQernSe362Uxo8HqjFsAuTNVpVSwK8zyflgUU9mTpL8Yd7VKXHlsooLMcp0HoXzaEs+XlpwH9jq29JvQ/kSo7u82SSCFhKJidNHdccUAPtf2FHi/tnV3GY4kE2e9YfaIVjORQhhSaR4r3Hvf6a4w6lODyL9I5wBE2SbqUCqt9sJRTgZAKI8WqNDr4KPxkoc0lLF3xAym6MQmb8j/H0wv8EVMdCg8qr2xJkeryoy8UMBoLwmP/0hMFqMsWmEuzsZb4F72NxXs0Helq17RE7HLLZ2LbV/pyafy0Z4PW57uIW5p6If1weBm+nNJ4eMDM1SqdL4ecD5RopkxH7wf/g2ch8DSWGJzhw6S3iluMC3AfTQFIVkCiy0QNmiX+0SwUdmDeLNJXcZczzb/pV6zkr1lSzlHVDBQcGLyY572OcTW/+1UIen1UuWgz7+OXgwKAGuxHJZF6zVev6/Q/AMOsqDRDImzlNVa7Zr4sdkiM0Gb2TLoZ6ftbqpj5ySktTlG3nbO+Usk9nc10oKhbpUYrXSak9XIpWfkz6jksmRUyy1TSWmiMyzGzi5dg3ity+RWfgw1oy10Cv6hktqk0crLdmwYl8rbvouCAkFXI50GQrN+fOZT2bMRIsidkTpIPNLWXdP4F7IMtRu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199015)(36916002)(478600001)(36756003)(6666004)(83380400001)(31696002)(186003)(2616005)(26005)(5660300002)(6512007)(86362001)(6506007)(53546011)(8936002)(41300700001)(2906002)(6486002)(38100700002)(31686004)(66476007)(4326008)(8676002)(66556008)(66946007)(6916009)(316002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEFMdlN4Sk84ZnZ2dUlYUE9XRFJFMWROdkdsT08xWjl2UHBDSWROM29EMWhL?=
 =?utf-8?B?N29sWVFNOFNKQW1ZdUlHTnJ1bkYybW1SRVNNNDBCekVZbGdSeW9VSU5GbVhU?=
 =?utf-8?B?NGdUR2s0NE5OSDEyVE84WDlWLzZJZXVyS21mT0syV0FiRHA1b2RkaGFKai9h?=
 =?utf-8?B?UjZLTkp3TWFBZ3J6aGc2RjhneU5vbDNyRG96d09GTFcyaVBMWEhFQzdZdERC?=
 =?utf-8?B?NXlXVUh5Z3JOcjBBWldmQmFvZFJaNGQra2w2L1c3N3NYcUZ0NlM4MGtXOHQx?=
 =?utf-8?B?djdHSVF4QnY3Szg1WnBaUyt3OEhoZ0UvMjhEWWtJMkVPZm1OZmVxK050Qytj?=
 =?utf-8?B?M1lyWmY5Q0tnL1UycDRkbDZ3bUg1V1IybG5wMk9XbTBvWjRaY2dQdkJWSk5n?=
 =?utf-8?B?aFJaaTNZMW9tWk5ib1k2NUNhOU04RmtqNW1kbVMzQ2dIUzFNZnBJdXFsbGdX?=
 =?utf-8?B?NUE3ZFJXbERmUzQrNFpBVEl1aHhwcmFpWWF2WnNlaURnRnVybTVlc2V6MjZP?=
 =?utf-8?B?dEVBOEIwdXc3YVhaUnBBMmVHTlhUOFhsaDFuWEdsUnZOMENQdFlXTWVJS0cy?=
 =?utf-8?B?VHZvS2hjUUwvSXVjK0RjS0dibThVbDhoK1RWa0RIUHFIbmtYc0N3RjZjYVdM?=
 =?utf-8?B?ekVqOS9BZEhYck8wVG1vVG5VV2F6dG05S29NKy96YzdKckhlUVF6QklDSDJT?=
 =?utf-8?B?RktwWExxZUZUVEI3ZURFSEY0N0hXeFJxSWVKK09pdlNPdkZxVmNrMjBHM0xL?=
 =?utf-8?B?M3NnS0RhcW5ROXdsZGc4RlUwVVowNlVFMDJOVjA2WkJuSWNRWEtZWkQwd0p2?=
 =?utf-8?B?WFBYaDRLdjFURndzN2UzeFpEQXlEK2FDdTAyNmJYY0VkaDZidWFrRWxYQ3p1?=
 =?utf-8?B?OHJzL3JGbjJybDc2SU9PWS9ZUWJ2eFNseit5SlhLak15ZnVSdStZNldJU3lI?=
 =?utf-8?B?NzJscWxibGxjcHF6NlZwVFdjblE5c2RHRm1JMk9CTVg5b21UN3VubWxUSWZH?=
 =?utf-8?B?c2NKaDUzTFlPclBWOFRzUmkxeElnREVQUGE5MGlNczVFSkNNV0c0ejdpMEZW?=
 =?utf-8?B?M0xvbGoraWNmK2hSblNUQ2pUN082Q0pOMWl5blljU1p2K2J6WWExeG5oU0ZQ?=
 =?utf-8?B?ZnU5aFMxVzlGYVZHdS9sNlpDVDkzNTdEOEM0QnRndHZJWER4d2RsSitPa1N4?=
 =?utf-8?B?STZUNDFibGFmUXg3c2gxYmJTVXh0SDRkZTVkd1kwTXBhWXVLcVNtTU1GZFNq?=
 =?utf-8?B?c3FCODZaSXlCYytRdGR1V2MvK0s0UWovclpHUlpWd2V2WWNRVEtZSVJ5Z2dI?=
 =?utf-8?B?SXlYSTFna0NIWHpsdFUzK3N0SzVjSGFLQmpUdktMYlRiRGF0c1MvbDVkZ21K?=
 =?utf-8?B?QjZUZjl3L3NaS0JoYmYrK3JTWGNCOE9BK1YzYU14V0V2TE5MQVk3T05CZ3Q1?=
 =?utf-8?B?akVCSk5JVFZlL3RmWUJXeE85N1UrTVh5ZHFOMjJpMUdxTHZVWlhnOG5HUDI2?=
 =?utf-8?B?TTVlRno4Tk54NnEyQkNVS3MzaHFCaEpBaTBqcnVqckVBVC8vSWlZdFlNSXB2?=
 =?utf-8?B?aGRkZkpHNDFHSTRGQkZTUWZ1SEZuVjE3blREb05YNVA1YlU1aWRTOXkzQmdK?=
 =?utf-8?B?UE0yeVlMR1FjUzFRM0t2MEJRQ1lvRmwyZ1plOWtlMUFKYll2UVExNkpuUHFo?=
 =?utf-8?B?U1NWcTA5OWtubklSWkpyU0pQUDVPanlGWVE5TkpEODIwODlPNW1ZOEpQZnJQ?=
 =?utf-8?B?Q0tidmU3RXZReHVJWVhVcnh6M0kxUXhhYnh6Q3luWXhXYmp0bmZwbHhvczJJ?=
 =?utf-8?B?bEpXUWlXdWpmSUVqc3J4T09XZmZXWVpkUGZkbGlOQUpkY0VDTGpVbHZxZ2tW?=
 =?utf-8?B?OWNFTGlqT3NxTEkyYTZGenhMTDdWWDF0SkhYQWxMVVdvQzZvRTdZeFRiQWJs?=
 =?utf-8?B?WStnUWp4SjE5WG82V3FDbmNneFlPUUlBU09XWDBSMmYxckwwS3VUcmY0aGxG?=
 =?utf-8?B?aDZKRy9QWEtZVEFWdDdyWnd4ZkZuUFVQUWdDR25Td2tZOFcvRWdyQ1NBOERy?=
 =?utf-8?B?RGlnRkVGZWplSEFaaFZ6VDVxbmNhS1NWN21scWljNWtQMzFpNEx4dkh2Nzhr?=
 =?utf-8?Q?W2QKB1IbrYm2eEoJCQ6k0XtiE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?SzlINHYwcUFjdmpGTXVQZGx4NElUNC9MQVBaUnRJeUtBeS9LbGliZlkrbjNu?=
 =?utf-8?B?aXBiTUIzdFRXNlJGdVVqM1VSTFhHd1R4NWNyaDBBdDJLWFk4dXFYclJZd2F1?=
 =?utf-8?B?QXlCVUdhZVREZGVmK1lRbnRvanhkT0dsUFg2T0E1dCtzMEVST2k3NnBGb1lP?=
 =?utf-8?B?bnowQnpXYzZHRFBYNVNYK0xyZXBPM0RLSC9JdVUrVk41UEtKa1FlOGx4VklP?=
 =?utf-8?B?ZnJqaCtPdjk1WFhLQ08xL0ZPdy9VWjlMbjlveXZSTGV6SHFoRkJpTDZvNDJp?=
 =?utf-8?B?QWJLMnFuV0kzQ2NKMVhmblZCcjFEd25Za0oxdUQ4bkYvenh0WEUyK1loeS9D?=
 =?utf-8?B?Q3dyUXo4MUMwMWRXWnlTRCtXcWlsNTdORW5HRlFSQXhiTHF0ZDFZZzErM29C?=
 =?utf-8?B?by9ocVdpd3VWdkwrMVl6SGtzSk9xbU5mQ011MDcyWHdDMGxYNisxaC9SRmFS?=
 =?utf-8?B?VnRxY1VVSXVJZGh1UjdPdm80REh2bkZ0YW1SL2dwbWhaNGJnTFVPQ2tVZnFM?=
 =?utf-8?B?Tm55ZlJGODVPQ1hZRlFlemxnVDNYTStZK3hzYk1HQWdRZFlPNGppaXBHclpN?=
 =?utf-8?B?TGFtT05JL1RvYnAyMFE3U21ya1VwZFVMcXdjZGh5UE1GcGlXRm9JY2lUMzE3?=
 =?utf-8?B?QWdZUE5PREpzcGkwMjR2ZjUxalc5S2hJa0N2dU1KSE53S05yWWN5dWhqb2N2?=
 =?utf-8?B?bGoxaE9wUG5TaE4vejFkQmNvcnplZGorbnNXTzJIOVNoakczUjgzNnJSZU1G?=
 =?utf-8?B?cXRQekh5NmI4aXZBWXNpa1ZkbDczWUlHeTZKNm1ac3V6bXRGMWI0aXN4QU1H?=
 =?utf-8?B?VGpDbkd3L05yTDV3K0pvM3ZiZ1hBRXJ0VTZLSnpvUTE4andWczhlWlZVcEpN?=
 =?utf-8?B?S0JwUy9zRkl4anFSVXlMTStweHREYWxKVnZ6LzRLTHp4TE95TnlhdEhWVUFt?=
 =?utf-8?B?cHQ4TGM5QWpnRjdVdFVjVkVHSHlOVC9GcEhlZVJZVnJVOUhWaWtKcmFsaTJu?=
 =?utf-8?B?MGpnOTFwT1c4cGdCeUtMK1RmV1k2dXJuaXY5RGdJM3VDb09rREgrbHE2Z3hw?=
 =?utf-8?B?Rk5WclFuWEtmbi90ZUQ2TjhhZHBWREN3TW11RFdJQTN1RzZlTm9tS0VHMmtW?=
 =?utf-8?B?MVhmamYzQTJOcXlzdlVkdTJtMFR0UHJCY20rWXlQcExwblZzOWdlSjN3RVhL?=
 =?utf-8?B?bUhEN1l4SzNYWFVNMmQ1bWRXRkkwSE4rNDI4Mjc0TUxiS1RJSVNYUzQ5Snpq?=
 =?utf-8?B?dUhXTWdDVXhMMC9UT016Rno3MUhRN3hWN25KcnF0RStPY0JXa1JyM0Z3U2Rs?=
 =?utf-8?Q?PElJGCH1AWJKb+hQ0VfK2ALPlK5peTTZJI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ba1a26-718a-4bdf-3084-08dacda57680
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 22:52:56.9476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLb6JfXhO6Kb4HEBQkTL82+DV6SxEWgEtA8WiwmTxkepaAZeyvILTQ35vI5ptWOBeOqmPHIkyqF3/bK4vu9SWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5588
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_13,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211230170
X-Proofpoint-GUID: vBI-E_tVayHuy8fCNuZ8iYF8ZaUwkmQW
X-Proofpoint-ORIG-GUID: vBI-E_tVayHuy8fCNuZ8iYF8ZaUwkmQW
Cc: mst@redhat.com, netdev@vger.kernel.org, dsahern@kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 elic@nvidia.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>



On 11/22/2022 7:35 PM, Jason Wang wrote:
> On Wed, Nov 23, 2022 at 6:29 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 11/16/2022 7:33 PM, Jason Wang wrote:
>>> This patch allows device features to be provisioned via vdpa. This
>>> will be useful for preserving migration compatibility between source
>>> and destination:
>>>
>>> # vdpa dev add name dev1 mgmtdev pci/0000:02:00.0 device_features 0x300020000
>> Miss the actual "vdpa dev config show" command below
> Right, let me fix that.
>
>>> # dev1: mac 52:54:00:12:34:56 link up link_announce false mtu 65535
>>>         negotiated_features CTRL_VQ VERSION_1 ACCESS_PLATFORM
>>>
>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>> ---
>>> Changes since v1:
>>> - Use uint64_t instead of __u64 for device_features
>>> - Fix typos and tweak the manpage
>>> - Add device_features to the help text
>>> ---
>>>    man/man8/vdpa-dev.8            | 15 +++++++++++++++
>>>    vdpa/include/uapi/linux/vdpa.h |  1 +
>>>    vdpa/vdpa.c                    | 32 +++++++++++++++++++++++++++++---
>>>    3 files changed, 45 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/man/man8/vdpa-dev.8 b/man/man8/vdpa-dev.8
>>> index 9faf3838..43e5bf48 100644
>>> --- a/man/man8/vdpa-dev.8
>>> +++ b/man/man8/vdpa-dev.8
>>> @@ -31,6 +31,7 @@ vdpa-dev \- vdpa device configuration
>>>    .I NAME
>>>    .B mgmtdev
>>>    .I MGMTDEV
>>> +.RI "[ device_features " DEVICE_FEATURES " ]"
>>>    .RI "[ mac " MACADDR " ]"
>>>    .RI "[ mtu " MTU " ]"
>>>    .RI "[ max_vqp " MAX_VQ_PAIRS " ]"
>>> @@ -74,6 +75,15 @@ Name of the new vdpa device to add.
>>>    Name of the management device to use for device addition.
>>>
>>>    .PP
>>> +.BI device_features " DEVICE_FEATURES"
>>> +Specifies the virtio device features bit-mask that is provisioned for the new vdpa device.
>>> +
>>> +The bits can be found under include/uapi/linux/virtio*h.
>>> +
>>> +see macros such as VIRTIO_F_ and VIRTIO_XXX(e.g NET)_F_ for specific bit values.
>>> +
>>> +This is optional.
>> Document the behavior when this attribute is missing? For e.g. inherit
>> device features from parent device.
> This is the current behaviour but unless we've found a way to mandate
> it, I'd like to not mention it. Maybe add a description to say the
> user needs to check the features after the add if features are not
> specified.
Well, I think at least for live migration the mgmt software should get 
to some consistent result between all vdpa parent drivers regarding 
feature inheritance. This inheritance predates the exposure of device 
features, until which user can check into specific features after 
creation. Imagine the case mgmt software of live migration needs to work 
with older vdpa tool stack with no device_features exposure, how does it 
know what device features are provisioned - it can only tell it from 
dev_features shown at the parent mgmtdev level.

IMHO it's not about whether vdpa core can or should mandate it in a 
common place or not, it's that (the man page of) the CLI tool should set 
user's expectation upfront for consumers (for e.g. mgmt software). I.e. 
in case the parent driver doesn't follow the man page doc, it should be 
considered as an implementation bug in the individual driver rather than 
flexibility of its own.

>> And what is the expected behavior when feature bit mask is off but the
>> corresponding config attr (for e.g. mac, mtu, and max_vqp) is set?
> It depends totally on the parent. And this "issue" is not introduced
> by this feature. Parents can decide to provision MQ by itself even if
> max_vqp is not specified.
Sorry, maybe I wasn't clear enough. The case I referred to was that the 
parent is capable of certain feature (for e.g. _F_MQ), the associated 
config attr (for e.g. max_vqp) is already present in the CLI, but the 
device_features bit mask doesn't have the corresponding bit set (e.g. 
the _F_MQ bit). Are you saying that the failure of this apparently 
invalid/ambiguous/conflicting command can't be predicated and the 
resulting behavior is totally ruled by the parent driver?

Thanks,
-Siwei

>> I think the previous behavior without device_features is that any config
>> attr implies the presence of the specific corresponding feature (_F_MAC,
>> _F_MTU, and _F_MQ). Should device_features override the other config
>> attribute, or such combination is considered invalid thus should fail?
> It follows the current policy, e.g if the parent doesn't support
> _F_MQ, we can neither provision _F_MQ nor max_vqp.
>
> Thanks
>
>> Thanks,
>> -Siwei
>>
>>> +
>>>    .BI mac " MACADDR"
>>>    - specifies the mac address for the new vdpa device.
>>>    This is applicable only for the network type of vdpa device. This is optional.
>>> @@ -127,6 +137,11 @@ vdpa dev add name foo mgmtdev vdpa_sim_net
>>>    Add the vdpa device named foo on the management device vdpa_sim_net.
>>>    .RE
>>>    .PP
>>> +vdpa dev add name foo mgmtdev vdpa_sim_net device_features 0x300020000
>>> +.RS 4
>>> +Add the vdpa device named foo on the management device vdpa_sim_net with device_features of 0x300020000
>>> +.RE
>>> +.PP
>>>    vdpa dev add name foo mgmtdev vdpa_sim_net mac 00:11:22:33:44:55
>>>    .RS 4
>>>    Add the vdpa device named foo on the management device vdpa_sim_net with mac address of 00:11:22:33:44:55.
>>> diff --git a/vdpa/include/uapi/linux/vdpa.h b/vdpa/include/uapi/linux/vdpa.h
>>> index 94e4dad1..7c961991 100644
>>> --- a/vdpa/include/uapi/linux/vdpa.h
>>> +++ b/vdpa/include/uapi/linux/vdpa.h
>>> @@ -51,6 +51,7 @@ enum vdpa_attr {
>>>        VDPA_ATTR_DEV_QUEUE_INDEX,              /* u32 */
>>>        VDPA_ATTR_DEV_VENDOR_ATTR_NAME,         /* string */
>>>        VDPA_ATTR_DEV_VENDOR_ATTR_VALUE,        /* u64 */
>>> +     VDPA_ATTR_DEV_FEATURES,                 /* u64 */
>>>
>>>        /* new attributes must be added above here */
>>>        VDPA_ATTR_MAX,
>>> diff --git a/vdpa/vdpa.c b/vdpa/vdpa.c
>>> index b73e40b4..d0ce5e22 100644
>>> --- a/vdpa/vdpa.c
>>> +++ b/vdpa/vdpa.c
>>> @@ -27,6 +27,7 @@
>>>    #define VDPA_OPT_VDEV_MTU           BIT(5)
>>>    #define VDPA_OPT_MAX_VQP            BIT(6)
>>>    #define VDPA_OPT_QUEUE_INDEX                BIT(7)
>>> +#define VDPA_OPT_VDEV_FEATURES               BIT(8)
>>>
>>>    struct vdpa_opts {
>>>        uint64_t present; /* flags of present items */
>>> @@ -38,6 +39,7 @@ struct vdpa_opts {
>>>        uint16_t mtu;
>>>        uint16_t max_vqp;
>>>        uint32_t queue_idx;
>>> +     uint64_t device_features;
>>>    };
>>>
>>>    struct vdpa {
>>> @@ -187,6 +189,17 @@ static int vdpa_argv_u32(struct vdpa *vdpa, int argc, char **argv,
>>>        return get_u32(result, *argv, 10);
>>>    }
>>>
>>> +static int vdpa_argv_u64_hex(struct vdpa *vdpa, int argc, char **argv,
>>> +                          uint64_t *result)
>>> +{
>>> +     if (argc <= 0 || !*argv) {
>>> +             fprintf(stderr, "number expected\n");
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     return get_u64(result, *argv, 16);
>>> +}
>>> +
>>>    struct vdpa_args_metadata {
>>>        uint64_t o_flag;
>>>        const char *err_msg;
>>> @@ -244,6 +257,10 @@ static void vdpa_opts_put(struct nlmsghdr *nlh, struct vdpa *vdpa)
>>>                mnl_attr_put_u16(nlh, VDPA_ATTR_DEV_NET_CFG_MAX_VQP, opts->max_vqp);
>>>        if (opts->present & VDPA_OPT_QUEUE_INDEX)
>>>                mnl_attr_put_u32(nlh, VDPA_ATTR_DEV_QUEUE_INDEX, opts->queue_idx);
>>> +     if (opts->present & VDPA_OPT_VDEV_FEATURES) {
>>> +             mnl_attr_put_u64(nlh, VDPA_ATTR_DEV_FEATURES,
>>> +                             opts->device_features);
>>> +     }
>>>    }
>>>
>>>    static int vdpa_argv_parse(struct vdpa *vdpa, int argc, char **argv,
>>> @@ -329,6 +346,14 @@ static int vdpa_argv_parse(struct vdpa *vdpa, int argc, char **argv,
>>>
>>>                        NEXT_ARG_FWD();
>>>                        o_found |= VDPA_OPT_QUEUE_INDEX;
>>> +             } else if (!strcmp(*argv, "device_features") &&
>>> +                        (o_optional & VDPA_OPT_VDEV_FEATURES)) {
>>> +                     NEXT_ARG_FWD();
>>> +                     err = vdpa_argv_u64_hex(vdpa, argc, argv,
>>> +                                             &opts->device_features);
>>> +                     if (err)
>>> +                             return err;
>>> +                     o_found |= VDPA_OPT_VDEV_FEATURES;
>>>                } else {
>>>                        fprintf(stderr, "Unknown option \"%s\"\n", *argv);
>>>                        return -EINVAL;
>>> @@ -615,8 +640,9 @@ static int cmd_mgmtdev(struct vdpa *vdpa, int argc, char **argv)
>>>    static void cmd_dev_help(void)
>>>    {
>>>        fprintf(stderr, "Usage: vdpa dev show [ DEV ]\n");
>>> -     fprintf(stderr, "       vdpa dev add name NAME mgmtdev MANAGEMENTDEV [ mac MACADDR ] [ mtu MTU ]\n");
>>> -     fprintf(stderr, "                                                    [ max_vqp MAX_VQ_PAIRS ]\n");
>>> +     fprintf(stderr, "       vdpa dev add name NAME mgmtdevMANAGEMENTDEV [ device_features DEVICE_FEATURES]\n");
>>> +     fprintf(stderr, "                                                   [ mac MACADDR ] [ mtu MTU ]\n");
>>> +     fprintf(stderr, "                                                   [ max_vqp MAX_VQ_PAIRS ]\n");
>>>        fprintf(stderr, "       vdpa dev del DEV\n");
>>>        fprintf(stderr, "Usage: vdpa dev config COMMAND [ OPTIONS ]\n");
>>>        fprintf(stderr, "Usage: vdpa dev vstats COMMAND\n");
>>> @@ -708,7 +734,7 @@ static int cmd_dev_add(struct vdpa *vdpa, int argc, char **argv)
>>>        err = vdpa_argv_parse_put(nlh, vdpa, argc, argv,
>>>                                  VDPA_OPT_VDEV_MGMTDEV_HANDLE | VDPA_OPT_VDEV_NAME,
>>>                                  VDPA_OPT_VDEV_MAC | VDPA_OPT_VDEV_MTU |
>>> -                               VDPA_OPT_MAX_VQP);
>>> +                               VDPA_OPT_MAX_VQP | VDPA_OPT_VDEV_FEATURES);
>>>        if (err)
>>>                return err;
>>>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
